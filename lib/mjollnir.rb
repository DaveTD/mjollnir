require "mjollnir/version"

module Mjollnir
	def template(source, *args, &block)
		inside_template do
			super
			
			mjollnir_root = "lib/mjollnir"

			if File.exists?(mjollnir_root) && File.directory?(mjollnir_root)
				target_file = args.first|| source.sub(/\.tt$/, '')
				target_file_type = target_file.split('.').pop
		
				if File.exists?(mjollnir_root + "/comment_starts.csv")
					commentstarts = Hash[*File.read(mjollnir_root + '/comment_starts.csv').split(/[, \n]+/)]
					universal_comment_start = commentstarts[target_file_type] 
				end
				if File.exists?(mjollnir_root + "/comment_ends.csv")
					commentends = Hash[*File.read(mjollnir_root + '/comment_ends.csv').split(/[, \n]+/)]
					universal_comment_end = commentends[target_file_type]	
				end
			
				if File.exists?(mjollnir_root + "/prepend.rb") 
					preargs = [ ERB.new(::File.binread(mjollnir_root + "/prepend.rb"), nil, '-', '@output_buffer').result(binding) ]
					prepend_to_file(target_file, *preargs, &block)
				end
				if File.exists?(mjollnir_root + "/append.rb")
					postargs = [ ERB.new(::File.binread(mjollnir_root + "/append.rb"), nil, '-', '@output_buffer').result(binding) ]
					append_to_file(target_file, *postargs, &block)
				end
			end
		end
	end
	puts "Whosoever holds this hammer, if he be worthy, shall possess the power of Thor"
	Rails::Generators::NamedBase.send(:include, Mjollnir)
end
