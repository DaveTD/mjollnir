# Mjolnir

A gem for prepending and appending text to rails generated files.

## Usage

add "gem 'mjollnir'" to your Gemfile

Create a directory in your lib directory called "mjollnir".
Add four files to this directory:  
	1. append.rb - this file contains instructions for insertions at the end of generated files.  
	2. prepend.rb - this file contains instructions for insertions at the beinning of generated files.  
	3. comment_starts.csv - put lines in this file when you need to create block comments in different file types.  For example, use a line, "rb,=start" for the start of a ruby block.  When generating text in the append.rb or prepend.rb files, use <%= universal_comment_start %> to declare the start of any comment block, so long as that file type has been included in comment_starts.csv.  
	4. comment_ends.csv - much like comment_starts.csv, but this file is for comment block ends in generated text.  For example, use "erb,-->" to end a comment block in an erb file.  When generating text in the append.rb or prepend.rb files, use <%= universal_comment_end %> to declare the end of any comment block, so long as that file type has been included in comment.ends.csv.  

## Variables

	The following usable variables for append.rb and prepend.rb:  

	target_file_type - the target file's type (rb, erb, coffee, etc.)  
	target_file - the target file directory, name and extention  
	universal_comment_start - the target file's file type comment block start, so long as it is declared in the comment_starts.csv file in the lib/mjollnir directory  
	universal_comment_end - the taret file's file type comment block end, so long as it is declared in the comment_ends.csv file in the lib/mjollnir directory  

## Example

prepend.rb for adding MIT license:  
		<%= universal_comment_start %>

		<%= target_file %>

        Copyright (c)<%= Time.now.year %> 123 Fake Co.

        Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

        Generated at: <%= Time.now %>
		<%= universal_comment_end %>

comment_ends.csv for common file types:  
rb,=end  
scss,*/  
js,*/  
haml,#-  
coffee,###  
css,*/  
erb,-->  
html,-->  



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Planned changes

1. Version 0.2.0 will add a generator for the prepend, and append ruby files, as well as for the two csvs.
2.  The change after that will be to automate some testing.
