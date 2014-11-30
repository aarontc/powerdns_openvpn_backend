require 'logger'
require 'powerdns_pipe'

module PowerdnsOpenvpnBackend
	class PowerDNSBackend
		DEBUG = ENV.has_key?('DEBUG') && %w[true t 1].include?(ENV['DEBUG'].downcase)

		def initialize(input_stream = STDIN, output_stream = STDOUT, log_stream = STDERR)
			@input = input_stream
			@output = output_stream
			@log = log_stream

			@input.sync = true
			@output.sync = true
			@log.sync = true

			@logger = Logger.new @log
			@logger.level = DEBUG ? Logger::DEBUG : Logger::INFO

			@pipe = PowerDNS::Pipe.new banner: 'PowerDNS OpenVPN Backend', input: @input, output: @output, err: @log
		end


		def run(argv)
			@pipe.run! do
				STDERR.puts 'QUESTION: ' + question.inspect
			end
		end
	end
end

