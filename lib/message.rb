require 'json'

class Message
  attr_accessor :namespace, :name, :path, :value, :extras, :sample_rate, :tags, :type

  class << self

    def log(str)
      parse(str).to_json
    end

    def parse(str)
      return {} if str.nil? or str.eql?('')

      data = str.split('|')

      # type of metric, eg: c -> counter, g -> gauge
      type = data[1]

      # fetch sample_rate when present
      if data[2][0].eql?('@')

        sample_rate = data[2].sub!('@', '')
        tags = data[3].sub!('#', '').split(',')
      elsif data[2][0].eql?('#')

        sample_rate = 1
        tags = data[2].sub!('#', '').split(',')
      end

      metric = data.first.split(':')

      {
        type: type,
        path: metric.first,
        namespace: metric.first.split('.')[0],
        name: metric.first.split('.')[1..metric.first.split('.').count - 1].join('.'),
        value: metric[1].to_i,
        tags: tags,
        sample_rate: sample_rate.to_f
      }
    end
  end
end
