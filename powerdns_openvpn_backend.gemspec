# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'powerdns_openvpn_backend/version'

Gem::Specification.new do |spec|
	spec.name = "powerdns_openvpn_backend"
	spec.version = PowerdnsOpenvpnBackend::VERSION
	spec.authors = ['Aaron Ten Clay']
	spec.email = ['powerdns_openvpn_backend-gem@aarontc.com']
	spec.summary = %q{PowerDNS 'pipe' backend using OpenVPN status files for resolving client name/address mappings.}
	spec.homepage = 'https://github.com/aarontc/powerdns_openvpn_backend'
	spec.license = 'MIT'

	spec.files = `git ls-files -z`.split("\x0")
	spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ['lib']

	spec.add_dependency 'powerdns_pipe'

	spec.add_development_dependency 'bundler', '~> 1.7'
	spec.add_development_dependency 'minitest', '~> 5'
	spec.add_development_dependency 'rake', '~> 12'
	spec.add_development_dependency 'rr', '~> 1.1'
	spec.add_development_dependency 'simplecov'
end
