# coding: utf-8

require_relative './lib/hungarian_algorithm_c/version'

Gem::Specification.new do |spec|
  spec.name          = "hungarian_algorithm_c"
  spec.version       = HungarianAlgorithmC::VERSION
  spec.authors       = ["Syed Humza Shah"]
  spec.email         = ["humza.shah@deliveroo.co.uk"]

  spec.summary       = 'Evaluates the Hungarian algorithm in C'
  spec.description   = 'A Ruby gem that evaluates the Hungarian algorithm in C'
  spec.homepage      = 'https://github.com/deliveroo/hungarian_algorithm_c'
  spec.license       = "MIT"

  spec.require_paths = ["lib"]

  all_files          = `git ls-files -z`.split("\x0")
  test_file_regex    = %r{^(test|spec|features)/}
  spec.files         = all_files.reject { |f| f.match(test_file_regex) }
  spec.test_files    = all_files.select { |f| f.match(test_file_regex) }

  spec.has_rdoc      = false
  spec.extensions    = %w[ext/hungarian_algorithm_c/extconf.rb]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake-compiler'
end
