require 'csv'

module PowerdnsOpenvpnBackend
	class OpenVPNStatusFileParser

		# Parses an OpenVPN routing table that looks like this:
		#
		# Virtual Address,Common Name,Real Address,Last Ref
		# 10.150.13.28,my-machine,112.24.33.279:48488,Mon Nov 17 19:21:03 2014
		#
		#
		def parse_routing_table(routing_table)
			table_matcher = /\nROUTING TABLE\n(?<table>.*)\nGLOBAL STATS\n/m
			matches = table_matcher.match routing_table
			CSV.parse matches[:table], headers: :first_row
		end
		#
		#
		# # Breaks the status file into sections.
		#
		# def parse_status_file_contents(file_contents)
		# 	sections = {}
		#
		#
		# end
	end
end
