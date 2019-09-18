require 'rspec'
require 'json'
require_relative '../lib/message'

describe Message do

  describe 'simple' do

    it '#parse' do
      metric = "namespace.metric:1|c|#test|extra"
      message = Message.parse(metric)

      expect(message[:namespace]).to eql('namespace')
      expect(message[:name]).to eql('metric')
      expect(message[:value]).to eql(1)
    end

    it '#log' do
      metric = "namespace.metric:1|c|#test|extra"
    end
  end

  describe 'sub_metric' do

    it '#parse' do
      metric = "namespace.metric.sub_metric:1|c|#test|extra"
      message = Message.parse(metric)

      expect(message[:namespace]).to eql('namespace')
      expect(message[:name]).to eql('metric.sub_metric')
      expect(message[:value]).to eql(1)
    end

    it '#log' do
      metric = "namespace.metric:1|c|#test|extra"
    end
  end
end
