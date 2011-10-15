# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sourcify/version"

Gem::Specification.new do |s|
  s.name        = "sourcify"
  s.version     = Sourcify::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["NgTzeYang"]
  s.email       = ["ngty77@gmail.com"]
  s.homepage    = "http://github.com/ngty/sourcify"
  s.summary     = %q{Workarounds before ruby-core officially supports Proc#to_source (& friends)}
  s.description = %q{}

  s.add_dependency 'file-tail', '>= 1.0.5'
  s.add_development_dependency 'bacon'

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- spec/*`.split("\n")
  s.require_paths    = ["lib"]
end
