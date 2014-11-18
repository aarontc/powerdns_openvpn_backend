require_relative 'minitest_helper'

require 'powerdns_openvpn_backend/open_vpn_status_file_parser'

class TestOpenVPNStatusFileParser < Minitest::Test
	EXHIBITS_PATH = Pathname.new(File.expand_path(File.dirname(__FILE__))).join 'test_exhibits'

	def test_sample_status
		expected = { 'Virtual Address' => '10.150.13.28', 'Common Name' => 'my-machine', 'Real Address' => '112.24.33.279:48488', 'Last Ref' => 'Mon Nov 17 19:21:03 2014' }

		body = File.read EXHIBITS_PATH.join('sample_status.txt')
		uut = PowerdnsOpenvpnBackend::OpenVPNStatusFileParser.new
		actual = uut.parse_routing_table body

		assert_equal 1, actual.length
		assert_equal expected.keys.length, actual[0].length

		expected.each_pair do |key, value|
			assert_equal value, actual[0][key]
		end
	end
end
