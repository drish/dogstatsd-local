require_relative './message.rb'

class Datagram
  attr_accessor :family, :message, :host, :port

  def initialize(datagram)
    @message = datagram[0]
    @family = datagram[1][0]
    @port = datagram[1][1]
    @host = datagram[1][2]
  end
end

