# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "heroku_san_sanity/version"

Gem::Specification.new do |s|
  s.name        = "heroku_san_sanity"
  s.version     = HerokuSanSanity::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Neil Middleton"]
  s.email       = ["neil.middleton@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Sanity check deploys with heroku_san}
  s.description = %q{Adds a sanity check 'Are you sure?' before deploying to any environment named 'production'}

  s.rubyforge_project = "heroku_san_sanity"
  
  s.add_dependency "heroku", ">= 1.17.10"
  s.add_dependency "heroku_san", ">= 1.0.0"
  s.add_dependency "highline", ">= 1.6.1"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
