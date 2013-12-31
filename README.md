# `attr_similar`

[![Install gem](https://badge.fury.io/rb/attr_similar.png)](https://rubygems.org/gems/attr_similar)
[![Build status](https://travis-ci.org/rcook/attr_similar.png)](https://travis-ci.org/rcook/attr_similar)
[![Coverage status](https://coveralls.io/repos/rcook/attr_similar/badge.png?branch=master)](https://coveralls.io/r/rcook/attr_similar)

Rails plugin that provides `attr_similar` helper to declare similarity-matching attributes on a model.

# Rails support

`attr_similar` works with Rails 3.2.x and Rails 4.0.x and is tested against Ruby versions 1.9.3, 2.0.0 and 2.1.0.

# Installation

Add `gem 'attr_similar'` to your Rails' `Gemfile` and run `bundle install`.

# Contributing

See [`.travis.yml`](https://github.com/rcook/attr_similar/blob/master/.travis.yml)
for details of the commands that are run as part of the Travis-CI build of this project.
The minimum bar for all push requests is that the Travis-CI build must pass. Please also
consider adding new tests to cover any new functionality introduced into the project.

To manually run the Travis-CI verification steps on your local machine, you can use the
following sequence of commands for Rails 3.2.x:

```bash
# Ensure gem dependencies are installed
BUNDLE_GEMFILE=Gemfile.rails3 bundle install
# Reset database
BUNDLE_GEMFILE=Gemfile.rails3 bundle exec rake test_db_reset
# Run tests
BUNDLE_GEMFILE=Gemfile.rails3 bundle exec rake test
# Build the gem
BUNDLE_GEMFILE=Gemfile.rails3 bundle exec gem build attr_similar.gemspec
```

To test against Rails 4.0.x, use:

```bash
# Ensure gem dependencies are installed
BUNDLE_GEMFILE=Gemfile.rails4 bundle install
# Reset database
BUNDLE_GEMFILE=Gemfile.rails4 bundle exec rake test_db_reset
# Run tests
BUNDLE_GEMFILE=Gemfile.rails4 bundle exec rake test
# Build the gem
BUNDLE_GEMFILE=Gemfile.rails4 bundle exec gem build attr_similar.gemspec
```

# Licence

`attr_similar` is released under the MIT licence.

