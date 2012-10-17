# -*- encoding: utf-8 -*-
#lib = File.expand_path('../lib', __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$:.push File.expand_path("../lib", __FILE__)
require 'mjollnir/version'

Gem::Specification.new do |gem|
  gem.name          = "mjollnir"
  gem.version       = Mjollnir::VERSION
  gem.authors       = ["DaveTD"]
  gem.email         = ["its.dave.dawson@gmail.com"]
  gem.description   = %q{A gem for prepending and appending generated files from any rails generator, though the power of Thor.}
  gem.summary       = %q{A gem for prepending and appending generated files from any rails generator.}
  gem.homepage      = ""

  #gem.files         = `git ls-files`.split($/)
  gem.files	    = `git ls-files`.split("\n")
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("railties", "~> 3.1")
end
