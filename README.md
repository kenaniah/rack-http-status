# Rack::HTTP::Status

This gem provides exception classes that represent each HTTP status.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-http-status'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-http-status

## Usage

```ruby
# In Rails
class ExampleController < ApplicationController
  include Rack::HTTP::Status
  rescue_from Status do |status|
    render plain: "Status code was: #{status.code} - #{status}", status: status
  end
  def action1
    head NoContent # => Returns HTTP 204 No Content
  end
  def action2
    raise NotFound # => Renders HTTP 404 with "Status code was: 404 - Not Found" body
  end
end
```

Each status class inherits from `Rack::HTTP::Status`, and contains the following convenience methods:

| Method | Description | Example |
| `#to_sym` | Returns the symbolized version of this HTTP status | `NotFound.to_sym` => `:not_found` |
| `#to_i` | Returns the HTTP status code's value | `NoContent.to_i` => `204` |
| `#to_s` | Returns the description of the HTTP status | `NonAuthoritativeInformation.to_s` => `"Non-Authoritative Information"` |

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kenaniah/rack-http-status.
