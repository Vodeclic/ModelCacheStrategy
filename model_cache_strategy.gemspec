# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'model_cache_strategy/version'

Gem::Specification.new do |spec|
  spec.name          = "model_cache_strategy"
  spec.version       = ModelCacheStrategy::VERSION
  spec.authors       = ["charles FD", "Guillaume Garcera"]
  spec.email         = ["charles.freitas-denke@vodeclic.com", "guillaume.garcera@vodeclic.com"]

  spec.summary       = %q{This allow to send adequate data to specified services based on Rails model modification callback.}
  spec.description   = %q{This allow to send adequate data to specified services based on Rails model modification callback. For the moment it manage only SNS and Varnish.}
  # spec.homepage      = "."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'sidekiq',           '~> 4.2.10'
  spec.add_dependency 'sidekiq-throttler', '~> 0.5.1'
  spec.add_dependency 'aws-sdk',           '~> 2.1.21'
  spec.add_dependency 'rails',             '~> 3.2'

  spec.add_development_dependency "bundler",    "~> 1.10"
  spec.add_development_dependency "rake",       "~> 10.0"
  spec.add_development_dependency "rspec",      "~> 3.3.0"
  spec.add_development_dependency "pry",        "~> 0.10.1"
  spec.add_development_dependency "pry-byebug", "~> 3.1.0"
end
