# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "huginn_transmission_agent"
  spec.version       = '0.1'
  spec.authors       = ["Luiz Felipe G. Pereira"]
  spec.email         = ["luiz.felipe.gp@gmail.com"]

  spec.summary       = %q{Huginn Agent for integration with Transmission}
  spec.description   = %q{This agent provides an interface between Huginn and the Transmission torrent client}

  spec.homepage      = "https://github.com/Draiken/huginn_transmission_agent"

  spec.license       = "MIT"


  spec.files         = Dir['LICENSE.txt', 'lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir['spec/**/*.rb'].reject { |f| f[%r{^spec/huginn}] }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "huginn_agent"
  spec.add_runtime_dependency "httparty", "~> 0.14.0"
end
