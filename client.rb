# client file for testing

require 'datadog/statsd'

config = {
  host: 'localhost',
  port: 8125,
  namespace: 'default',
  tags: ["env:dev", "region:toronto"]
}

statsd = Datadog::Statsd.new(config[:host],
  config[:port],
  namespace: config[:namespace],
  tags: config[:tags]
)

statsd.gauge('page.views', 1, sample_rate: 0.5)
# statsd.increment('messages.count', by: 2, tags: ['kind:incoming'])
