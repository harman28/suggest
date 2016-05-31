# Suggest

Simple generic suggest method for any active-record model.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'suggest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install suggest

## Usage
Extend it, it's a class method.
````ruby
class People
    extend Suggest
end
````
Start searching.
````
search_params = {"name"=>"adi kumar","age"="21","height"=">182"}
People.suggest search_params
=> [#<Person id: 154778, name: "Aditya Kumar", age: "21", height: "191", weight: "91">,
#<Person id: 475768, name: "Adi Kumar", age: "21", height: "185", weight: "71">,
#<Person id: 714278, name: "aditi kumari", age: "21", height: "189", weight: "88">,
#<Person id: 165468, name: "S. Aditya Kumaraswamy", age: "21", height: "183", weight: "102">]
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/harman28/suggest. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

