# -*- encoding: utf-8 -*-
require File.expand_path('../lib/common_engine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josh Starcher, Weston Platter"]
  gem.email         = ["js@email, westonplatter@gmail.com"]
  gem.description   = %q{Common Engine Short}
  gem.summary       = %q{Common Engine Long}
  gem.homepage      = "http://www.github.com/cruglobal"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "common_engine"
  gem.require_paths = ["lib"]
  gem.version       = CommonEngine::VERSION

  # gem.add_dependency "_gem_name_"
  # gem.add_development_dependency "_gem_name_"
  
  gem.add_dependency 'rails'
  gem.add_dependency 'highline'
  gem.add_dependency 'bundler'

  gem.add_development_dependency "rspec"

end
