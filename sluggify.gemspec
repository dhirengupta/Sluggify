# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sluggify/version"

Gem::Specification.new do |s|
  s.name        = "sluggify"
  s.version     = Sluggify::VERSION
  s.authors     = ["Deepak Prasanna"]
  s.email       = ["deepaksrm@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{It create a slug for your models}
  s.description = %q{It create a slug for your models}

  s.rubyforge_project = "sluggify"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "mysql2"
  s.add_development_dependency "rspec"

  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "activerecord"
end
