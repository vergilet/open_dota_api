![odra](https://user-images.githubusercontent.com/2478436/28491007-95355790-6ef0-11e7-95b9-a08f585db9e8.png)



Unofficial Ruby Library for [OpenDotaAPI](https://docs.opendota.com/).


## Installation
If you use Rubygems you can type:

```ruby
gem install open_dota_api
```

or add gem to your Gemfile:
```ruby
gem 'open_dota_api'
```


## Using

To use OpenDotaApi you can:

```ruby

require 'open_dota_api'

```

Use available methods to gather the data:

```ruby
# Leagues listing
OpenDotaApi.leagues

# Teams listing
OpenDotaApi.teams

# Match details
OpenDotaApi.matches(match_id)

# Heroes listing
OpenDotaApi.heroes
```

## Warning!

> Please keep request rate to approximately 3/s.
