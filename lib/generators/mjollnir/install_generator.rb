module Mjollnir
  module Generators
	class InstallGenerator < Rails::Generators::Base
		desc "Creates the four required files for mjollnir"

		source_root File.expand_path("../../templates", __FILE__)

		def create_lib_files
			mjollnir_root = "lib/mjollnir"
	
			empty_directory mjollnir_root	
		
			create_file mjollnir_root + "/prepend.rb", <<-FILE

			FILE
			create_file mjollnir_root + "/append.rb", <<-FILE

			FILE
			#create_file mjollnir_root + "/comment_starts.csv", File.join('comment_starts.csv')
			template 'comment_starts.csv', File.join(mjollnir_root, 'comment_starts.csv')

			#create_file mjollnir_root + "/comment_ends.csv", File.join('comment_ends.csv')
			template 'comment_ends.csv', File.join(mjollnir_root, 'comment_ends.csv')
		end
	end
  end
end
