require 'socket'

require './lib/message.rb'
require './lib/datagram.rb'

class Server
  attr_accessor :host, :port, :server

  def initialize
    @host = "0.0.0.0"
    @port = ENV['PORT'] || 8125
    @server = UDPSocket.new
    @server.bind(host, port)
  end

  def start
    t = Thread.new do

      while text = server.recvfrom(16)
        d = Datagram.new(text)
        puts Message.log(d.message)
        server.send("", 0, d.host, d.port)
      end
    end

    puts "initialized dogstatsd-local #{host}:#{port}"
    puts 'waiting for statsd datagrams..'
    t.join
  end
end

Server.new.start
