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

statsd.increment('page.views')
