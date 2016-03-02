# odr

odr is a very simple JSON OpenData CLI reader

## Usage

```sh
    $ odr [OPTIONS] URL
```

`odr` connects to the provided url (which should provide `JSON`-formatted
data) and produces output according to the provided option flags.

In general, this data can then be displayed with plotting software like
`gnuplot` et al. as:

```sh
    $ odr [OPTIONS] URL | gnuplot --persist display.gnuplot
```    

where `display.gnuplot` is a file containing indications for plotting for
`gnuplot` (please see the `gnuplot(1)` man page and online help).

Options are:

* `--keys`         displays the keys present in the `JSON` data, along with
                   the size of the related values
* `--k=key`        will use the `key` as `n-th coordinate` of the plot,
                   establishing a column for the actual data

Several `--k=key`s may be used and the columns will be ordered consequently.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'odr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install odr

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec odr` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicb/odr.

## License

odr - a very simple JSON OpenData CLI reader
Copyright (C) 2016  Nicola Bernardini

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
