require 'bundler/setup'

# Configure code coverage
require 'simplecov'
unless SimpleCov.running
	SimpleCov.start do
		add_filter '/test/'
	end
end


require 'minitest/autorun'
require 'minitest/pride'
require 'rr'
