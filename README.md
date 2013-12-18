# Lokaty

Super easy way to get a user's country by IP.

```ruby
Lokaty::Guess.new("198.35.0.0").country_code # => 'us'
```

Restrict the possible output by passing `only:` an array of country codes:

```ruby
Lokaty::Guess.new("198.35.0.0", only: %w[us]).country_code # => 'us'
Lokaty::Guess.new("198.35.0.0", only: %w[be nl]).country_code # => nil
```

Some unsolvable addresses return nil:

```ruby
Lokaty::Guess.new("127.0.0.1").country_code # => nil
Lokaty::Guess.new("78be57bds").country_code # => nil
```

But you can specify a fallback:

```ruby
Lokaty::Guess.new("127.0.0.1", fallback: 'nl').country_code # => 'nl'
```

So if your website is for German, US and Dutch vistors, and you want to default all other's to the US version:

```ruby
Lokaty::Guess.new(the_ip, only: %w[de nl us], fallback: 'us').country_code # => 'us'
```


## Installation

```ruby
gem 'lokaty', github: 'tijmenb/lokaty'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
