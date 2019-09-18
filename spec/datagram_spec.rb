require 'rspec'
require 'json'
require_relative '../lib/message'

describe Message do

  it '#parse' do
    metric = "namespace.metric:1|c|#test|extra"
    message = Message.parse(metric)

    expect(message[:namespace]).to eql('namespace')
    expect(message[:name]).to eql('metric')
  end

  it '#log' do
    metric = "namespace.metric:1|c|#test|extra"
  end
end
