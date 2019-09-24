[![Build Status](https://travis-ci.com/drish/dogstatsd-local.svg?branch=master)](https://travis-ci.com/drish/dogstatsd-local)

### dogstatsd-local

A simple Ruby UDP service that prints back to STDOUT DogStatsD messages in a JSON prettified format


#### Setup 

docker-compose

```yml
version: '3.4'

services:
  dogstatsd-local:
    image: drish/dogstatsd-local
    ports:
      - 8125:8125/udp
```

straight docker 

```text
~/drish/ » docker run -p 8125:8125 drish/dogstatsd-local
INFO -- : initialized dogstatsd-local 0.0.0.0:8125
INFO -- : waiting for statsd datagrams..
```

Use your statsd client normally

```ruby
require 'datadog/statsd'
statsd = Datadog::Statsd.new('dogstatsd-local', 8125)
statsd.increment('page.views')
```


```sh
[2019-09-18T18:44:38.221440 #1]  INFO -- : {"path":"page.views","namespace":"page","name":"views","value":1}
```

#### TODO

- [ ] Events
