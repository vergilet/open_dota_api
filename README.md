![odra](https://user-images.githubusercontent.com/2478436/28491007-95355790-6ef0-11e7-95b9-a08f585db9e8.png)



Unofficial Ruby Library for [OpenDotaAPI](https://docs.opendota.com/).


## Installation
```ruby
gem install open_dota_api
```

or add to your Gemfile:
```ruby
gem 'open_dota_api'
```


## Using

```ruby
# leagues list
OpenDotaApi.leagues

# teams list
OpenDotaApi.teams

# match details
OpenDotaApi.matches(match_id)

# heroes list
OpenDotaApi.heroes
```
