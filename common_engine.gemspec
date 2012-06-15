# -*- encoding: utf-8 -*-
require File.expand_path('../lib/common_engine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josh Starcher, Weston Platter"]
  gem.email         = ["josh@email, westonplatter@gmail.com"]
  gem.description   = %q{Common Engine Short}
  gem.summary       = %q{Common Engine Long}
  gem.homepage      = "http://www.github.com/cruglobal"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "CommonEngine"
  gem.require_paths = ["lib"]
  gem.version       = CommonEngine::VERSION
end
