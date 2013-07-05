# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_mailer_stop/version'

Gem::Specification.new do |spec|
  spec.name          = "action_mailer_stop"
  spec.version       = ActionMailerStop::VERSION
  spec.authors       = ["Adrien Siami"]
  spec.email         = ["adrien.siami@dimelo.com"]
  spec.description   = "Call 'stop!' from an ActionMailer class to abort the delivery of your email"
  spec.summary       = "Call 'stop!' from an ActionMailer class to abort the delivery of your email"
  spec.homepage      = "https://github.com/dimelo/action_mailer_stop"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.13.0'

  spec.add_dependency 'actionmailer', '>= 3.0', '< 5.0'
end
