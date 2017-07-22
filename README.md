![odra](https://user-images.githubusercontent.com/2478436/28491007-95355790-6ef0-11e7-95b9-a08f585db9e8.png)

###

Unofficial Ruby Library for [OpenDotaAPI](https://docs.opendota.com/). This API provides Dota 2 related data. 
###
Please keep request rate to approximately 3/s.

###
[![Gem Version](https://badge.fury.io/rb/open_dota_api.svg)](https://badge.fury.io/rb/open_dota_api)
[![Build Status](https://travis-ci.org/vergilet/open_dota_api.svg?branch=master)](https://travis-ci.org/vergilet/open_dota_api)
[![Code Climate](https://codeclimate.com/github/vergilet/open_dota_api/badges/gpa.svg)](https://codeclimate.com/github/vergilet/open_dota_api)
[![Test Coverage](https://codeclimate.com/github/vergilet/open_dota_api/badges/coverage.svg)](https://codeclimate.com/github/vergilet/open_dota_api/coverage)

## Installation
If you use Rubygems you can type:

```ruby
gem install open_dota_api
```

or add this line to your application's Gemfile:
   
```ruby
gem 'open_dota_api'
```

then execute:
```
$ bundle
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

## Endpoints

#### Leagues

##### API Method: [leagues](https://docs.opendota.com/#tag/leagues)

```ruby
leagues = OpenDotaApi.leagues
leagues                # array
```
```ruby
league = leagues.first
league.class           # OpenDotaApi::Leagues

```
```ruby
league.league_id       # Number, league ID
league.ticket          # String, ticket identifier
league.banner          # String, banner identifier
league.tier            # String, premiere, pro, amateur
league.name            # String, league name

```
#### Teams

##### API Method: [teams](https://docs.opendota.com/#tag/teams)

```ruby
teams = OpenDotaApi.teams
teams                  # array
```

```ruby
team = teams.first
team.class             # OpenDotaApi::Team
```

```ruby
team.team_id
team.rating
team.wins
team.losses
team.last_match_time
team.name
team.tag
```
#### Matches

##### API Method: [matches](https://docs.opendota.com/#tag/matches)


```ruby
match_id = 0000000001        # number, is required
```

```ruby
match = OpenDotaApi.matches(match_id)
match.class                  # OpenDotaApi::Match
```

```ruby
match.match_id
match.start_time
match.duration
match.series_id
match.series_type
match.radiant_team_id
match.dire_team_id
match.match_seq_num
match.league_id
match.first_blood_time
match.winner
match.cluster
match.replay_salt
match.cluster
match.replay_url
match.players               # array of players (type OpenDotaApi::Matches::Player)
```
##### Player

```ruby
players = match.players 
player = players.first
player.class                # OpenDotaApi::Matches::Player
```

```ruby
player.match_id             # related to OpenDotaApi::Match
player.player_slot
player.account_id
player.assists
player.camps_stacked
player.deaths
player.denies
player.gold_per_min
player.hero_id              # related to OpenDotaApi::Hero
player.kills
player.obs_placed
player.sen_placed
player.rune_pickups
player.stuns
player.xp_per_min
player.name
player.side
player.kda
player.tower_kills
player.roshan_kills
player.hero_healing
```

#### Heroes

##### API Method: [heroes](https://docs.opendota.com/#tag/heroes)


```ruby
heroes = OpenDotaApi.heroes
heroes.class              # array        
```

```ruby
hero = heroes.first
hero.class                # OpenDotaApi::Hero    
```
```ruby
hero.id
hero.name
hero.localized_name       # "Anti-mage"
hero.primary_attr
hero.attack_type
hero.roles                # array of roles
hero.legs
```
...

That's all for now.

## Contributing

Feel free to contribute:
1. Fork it (https://github.com/droptheplot/adminable/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License
The gem is available as open source under the terms of the MIT License.

Copyright (c) 2017 Yaro.
[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://raw.githubusercontent.com/vergilet/open_dota_api/master/LICENSE)
