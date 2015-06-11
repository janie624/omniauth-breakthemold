# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/breakthemold/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-breakthemold"
  spec.version       = Omniauth::Breakthemold::VERSION
  spec.authors       = ["siera"]
  spec.email         = ["sieraruo@gmail.com"]

  spec.summary       = %q{A Breakthemold Oauth2 Provider Plugin Strategy for Omniauth}
  spec.description   = %q{A Breakthemold Oauth2 Provider Plugin Strategy for Omniauth}
  spec.homepage      = "http://www.breakthemold.co.uk"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth-oauth2"
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
