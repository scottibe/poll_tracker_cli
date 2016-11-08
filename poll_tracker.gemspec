# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'poll_tracker/version'

Gem::Specification.new do |spec|
  spec.name          = "poll_tracker"
  spec.version       = PollTracker::VERSION
  spec.authors       = ["Scott Bewick"]
  spec.email         = ["bewick.scott@gmail.com"]

  spec.summary       = %q{it tracks presidential polls}     
  spec.description   = %q{presents top polls clinton trump allows you to look at each polls statistics updated daily}     
  spec.homepage      = "https://github.com/scottibe/poll_tracker_cli"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = 'http://rubygems.org'
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["poll_tracker"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-byebug", "~> 3.4.0", ">= 3.4.0" 
  spec.add_development_dependency "byebug", "~> 9.0", ">= 9.0.5"

  spec.add_runtime_dependency "colorize", "~> 0.8.1"
  spec.add_runtime_dependency "nokogiri", "~> 1.6", ">= 1.6.8"

end
