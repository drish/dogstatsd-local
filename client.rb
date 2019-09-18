# client file for testing

require 'datadog/statsd'

statsd = Datadog::Statsd.new('server', 8125)

statsd.increment('page.views')
