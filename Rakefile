require "bundler/gem_tasks"

require File.join(File.dirname(__FILE__), '/lib/sluggify/version')

require 'rake'
require 'rspec'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = %w[--format progress]
  spec.pattern = "spec/unit/**/*_spec.rb"
end

task :default => :spec
