require 'rake/extensiontask'
require 'rake/testtask'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
Rake::ExtensionTask.new('hungarian_algorithm_c')

task test: [:compile, :spec]
