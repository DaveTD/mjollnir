require "mjollnir/version"

module Mjollnir
	def self.include(base)
		base.extend(ClassMethods)
	end

	def template(source, *args, &block)
		inside_template do
			super
			if File.exists?("lib/mjollnir") && File.directory?("lib/mjollnir")
				target_file = args.first|| source.sub(/\.tt$/, '')

				prependable = ERB.new(::File.binread("lib/mjollnir/prepend.rb"), nil, '-', '@output_buffer')
				appendable = ERB.new(::File.binread("lib/mjollnir/append.rb"), nil, '-', '@output_buffer')
			
				target_file_type = target_file.split('.').pop

				commentstarts = Hash[*File.read('lib/mjollnir/comment_starts.csv').split(/[, \n]+/)]
				commentends = Hash[*File.read('lib/mjollnir/comment_ends.csv').split(/[, \n]+/)]
				universal_comment_start = commentstarts[target_file_type] 
				universal_comment_end = commentends[target_file_type]	

				# Bind the variables to the ERB results
				preargs = [
					prependable.result(binding)
				]
				postargs = [
					appendable.result(binding)
				]
				prepend_to_file(target_file, *preargs, &block)
				append_to_file(target_file, *postargs, &block)
			end
		end
	end
	puts "Whosoever holds this hammer, if he be worthy, shall possess the power of Thor"
	Rails::Generators::NamedBase.send(:include, Mjollnir)
end
