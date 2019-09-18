# client file for testing

require 'datadog/statsd'

statsd = Datadog::Statsd.new('127.0.0.1', 8125)

statsd.increment('page.views')
