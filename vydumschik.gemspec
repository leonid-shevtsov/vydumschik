# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vydumschik/version"

Gem::Specification.new do |s|
  s.name        = "vydumschik"
  s.version     = Vydumschik::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Leonid Shevtsov"]
  s.email       = ["leonid@shevtsov.me"]
  s.homepage    = "https://github.com/leonid-shevtsov/vydumschik"
  s.summary     = %q{A fake data library (Vydumschik is russian for "inventor")}
  s.description = %q{Vydumschik creates fake Cyrillic names, surnames, full names, and lipsum-like text}

  s.add_development_dependency "rake"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
