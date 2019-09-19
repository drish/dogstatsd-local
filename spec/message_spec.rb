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
  end

  describe 'sub_metric' do

    it '#parse' do
      metric = "namespace.metric.sub_metric:1|c|#test|extra"
      message = Message.parse(metric)

      expect(message[:namespace]).to eql('namespace')
      expect(message[:name]).to eql('metric.sub_metric')
      expect(message[:value]).to eql(1)
    end
  end

  describe 'multi tags' do

    it '#parse' do
      metric = "default.page.views:1|c|#env:dev,region:toronto"
      message = Message.parse(metric)

      expect(message[:namespace]).to eql('default')
      expect(message[:type]).to eql('c')
      expect(message[:name]).to eql('page.views')
      expect(message[:value]).to eql(1)
      expect(message[:tags].count).to eql(2)

      expect(message[:tags].first).to eql('env:dev')
      expect(message[:tags][1]).to eql('region:toronto')
    end
  end
end
