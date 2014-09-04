# Quipper::Mixpanel::Exporter

Client library of Mixpanel Data Export API (NOT OFFICIAL).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quipper-mixpanel-exporter', github: 'quipper/quipper-mixpanel-exporter'
```

And then execute:

    $ bundle

## Usage

```ruby
ENV['MIXPANEL_API_KEY'] = "XXXXXXXXXXXXXXXX"
ENV['MIXPANEL_API_SECRET'] = "XXXXXXXXXXXXXXXX"

exporter = Quipper::Mixpanel::Exporter.new

p exporter.api("/api/2.0/events/names", {})
p exporter.api("/api/2.0/segmentation/", {
  event: 'user_performed_awesome_action',
  from_date: '2014-08-01',
  to_date: '2014-08-31',
  on: 'properties["id"]',
  limit: 200,
})

p exporter.export("/api/2.0/export/", {
  from_date: '2014-09-01',
  to_date: '2014-09-01',
  event: ['user_performed_awesome_action'],
})
```

## Contributing

1. Fork it ( https://github.com/quipper/quipper-mixpanel-exporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
