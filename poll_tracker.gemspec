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
  spec.description   = %q{presents top polls clinton trump allows you to look at each polls statistics several stories on election updated daily}     
  # spec.homepage      = "www.github.com/scottibe"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "nokogiri"
  # spec.add_development_dependency "colorize"

  spec.add_runtime_dependency "colorize"

end
