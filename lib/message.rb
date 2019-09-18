require 'json'

class Message
  attr_accessor :namespace, :name, :path, :value, :extras, :sample_rate, :tags, :type

  def self.log(str)
    self.parse(str).to_json
  end

  def self.parse(str)
    return {} if str.nil? or str.eql?('')
    data = str.split('|')
    metric = data.first.split(':')
    {
      path: metric.first,
      namespace: metric.first.split('.')[0],
      name: metric.first.split('.')[1..metric.first.split('.').count - 1].join('.'),
      value: metric[1].to_i,
    }
  end
end
