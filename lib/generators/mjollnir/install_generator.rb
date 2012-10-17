module Mjollnir
  module Generators
	class MjollnirGenerator < Rails::Generators::Base
		source_root File.expand_path("../../templates", __FILE__)

		desc "Creates the four required files for mjollnir"

		def create_lib_files
			empty_directory "lib/mjollnir"
		
			mjollnir_root = "lib/mjollnir"
		
			create_file mjollnir_root + "/prepend.rb", <<-FILE

			FILE
			create_file mjollnir_root + "/append.rb", <<-FILE

			FILE
			create_file mjollnir_root + "/comment_starts.csv", <<-FILE
rb,=begin
scss,/*
js,/*
haml,#-
coffee,###
css,/*
erb,<!--
html,<!--
yml,#
			FILE
			create_file mjollnir_root + "/comment_ends.csv", <<-FILE
rb,=end
scss,*/
js,*/
coffee,###
css,*/
erb,-->
html,-->
			FILE
		end
	end
  end
end
