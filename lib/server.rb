require 'socket'
require 'logger'

require_relative './message.rb'
require_relative './datagram.rb'

class Server
  attr_accessor :host, :port, :server, :logger

  def initialize
    @host = '0.0.0.0'
    @port = ENV['PORT'] || 8125
    @server = UDPSocket.new
    @server.bind(host, port)
    @logger = Logger.new($stdout)
    @logger.level = Logger::INFO
  end

  def start

    logger.info("initialized dogstatsd-local #{host}:#{port}")
    logger.info('waiting for statsd datagrams..')
    Thread.new do
      loop do
        text = server.recvfrom(1024) # might need to tweak this size

        begin
          d = Datagram.new(text)
          logger.info(Message.log(d.message))
        rescue StandardError => e
          logger.info(e)
        end
        server.send("", 0, d.host, d.port)
      end
    end.join
  end
end
