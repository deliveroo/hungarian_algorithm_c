require_relative './lib/hungarian_algorithm_c/version'
require 'date'

Gem::Specification.new do |s|
  s.name = 'hungarian_algorithm_c'
  s.version = HungarianAlgorithmC::VERSION
  s.date = Date.today.to_s
  s.summary = 'Evaluates the Hungarian algorithm in C'
  s.description = 'A Ruby gem that evaluates the Hungarian algorithm in C'
  s.homepage = 'https://github.com/deliveroo/hungarian_algorithm_c'
  s.license = 'MIT'

  s.authors = ['Logistics Algorithms']
  s.email = 'logistics+algorithms-engineers@deliveroo.co.uk'

  s.test_files = %w[spec/hungarian_algorithm_c_spec.rb]
  s.require_paths = %w[ext lib]
  s.files = `git ls-files`
    .split($OUTPUT_RECORD_SEPARATOR)
    .reject { |file| file[%r{(\Alib/rvg/to_c.rb)}] }

  s.extensions = %w[ext/hungarian_algorithm_c/extconf.rb]
  s.has_rdoc = false

  s.required_ruby_version = '>= 2.0.0'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake-compiler'
end
