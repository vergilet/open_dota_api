<p align="right">
    <a href="https://github.com/vergilet/open_dota_api"><img align="" src="https://user-images.githubusercontent.com/2478436/51829223-cb05d600-22f5-11e9-9245-bc6e82dcf028.png" width="56" height="56" /></a>
<a href="https://rubygems.org/gems/open_dota_api"><img align="right" src="https://user-images.githubusercontent.com/2478436/51829691-c55cc000-22f6-11e9-99a5-42f88a8f2a55.png" width="56" height="56" /></a>
</p>

<p align="center">
   <a href="https://rubygems.org/gems/open_dota_api"><img width="460" src="https://user-images.githubusercontent.com/2478436/28491007-95355790-6ef0-11e7-95b9-a08f585db9e8.png" /></a>
</p>



:gem: Unofficial Ruby Gem for [OpenDotaAPI](https://docs.opendota.com/). This API provides Dota 2 related data. 

[![Gem Version](https://badge.fury.io/rb/open_dota_api.svg)](https://badge.fury.io/rb/open_dota_api)
[![Build Status](https://travis-ci.org/vergilet/open_dota_api.svg?branch=master)](https://travis-ci.org/vergilet/open_dota_api)
[![Code Climate](https://api.codeclimate.com/v1/badges/b27d9ae2e4796c30c290/maintainability)](https://codeclimate.com/github/vergilet/open_dota_api)
[![Test Coverage](https://api.codeclimate.com/v1/badges/b27d9ae2e4796c30c290/test_coverage)](https://codeclimate.com/github/vergilet/open_dota_api/coverage)
<!--[![Dependency Status](https://www.versioneye.com/user/projects/59a3b1540fb24f002b6205ef/badge.svg?style=flat)](https://www.versioneye.com/user/projects/59a3b1540fb24f002b6205ef) -->
<!--[![Dependency Status](https://gemnasium.com/badges/github.com/vergilet/open_dota_api.svg)](https://gemnasium.com/github.com/vergilet/open_dota_api) -->



> :warning: Please keep request rate to approximately 3/s.

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

Use available methods to gather needed data:

```ruby
# Leagues listing
OpenDotaApi.leagues

# Teams listing
OpenDotaApi.teams

# Match details
OpenDotaApi.matches(match_id)

# Heroes listing
OpenDotaApi.heroes

# Pro players listing
OpenDotaApi.pro_players

# Explorer output (limited)
OpenDotaApi.explorer(league_id)

# Players (account) details
OpenDotaApi.players(account_id)

```

## Premium Tier (update)

**Beginning 2018-04-22, the OpenDota API is limited to 50,000 free calls per month and 60 requests/minute.**

> We offer a Premium Tier with unlimited API calls and higher rate limits. 
> Check out the [API page](https://www.opendota.com/api-keys) to learn more.

<p align="center">
    <a href="https://github.com/vergilet/open_dota_api/tree/9-authentication-support#premium-tier-update"><img width="649" alt="" src="https://user-images.githubusercontent.com/2478436/65829471-a6ac3000-e2ae-11e9-9b67-796e3d980b9f.png"></a>
</p>

**Please follow the link to [Get the KEY](https://www.opendota.com/api-keys).**

#### Requests Limit:

To check the request limit for Free Tier:
```ruby
  OpenDotaApi.limits 
```
*Output:*
```ruby
  {
    per_min: "0",         # request left for per minute
    per_month: "49878"    # request left for per month
  } 
```



#### Using the API_KEY

After you get you personal key you have two options:
1. Set `api_key` globally to all your request.
    For Rails application you can create the initializer:

    ```ruby
    # config/initializers/open_dota_api.rb
    
    OpenDotaApi.api_key = [YOUR_KEY_HERE]
    ```

2. Or you can set `api_key` directly in the request:
    ```ruby
    OpenDotaApi.leagues(api_key: [YOUR_KEY_HERE])
   
    OpenDotaApi.teams(api_key: [YOUR_KEY_HERE])
   
    OpenDotaApi.matches(match_id, api_key: [YOUR_KEY_HERE])
   
    OpenDotaApi.heroes(api_key: [YOUR_KEY_HERE])
   
    OpenDotaApi.pro_players(api_key: [YOUR_KEY_HERE])
   
    OpenDotaApi.explorer(league_id, api_key: [YOUR_KEY_HERE])
   ```
   
Enjoy!

## Endpoints

#### :large_blue_diamond: Leagues

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
#### :large_blue_diamond: Teams

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

#### :large_blue_diamond: Players

##### API Method: [matches](https://docs.opendota.com/#tag/players)

```ruby
account_id = 65366604        # number, is required
```

```ruby
player = OpenDotaApi.players(account_id)
player.class                 # OpenDotaApi::Player
```

```ruby
player.account_id
player.mmr_estimate
player.plus
player.contributor?
player.steam_id
player.avatar
player.avatar_medium
player.avatar_full
player.profile_url
player.persona_name
player.last_login
player.cheese
player.loc_country_code
player.name
player.tracked_until
player.rank_tier
player.competitive_rank
player.solo_competitive_rank
player.leaderboard_rank
```

#### :large_blue_diamond: Matches

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
match.radiant_score         # Integer
match.dire_score            # Integer
match.players               # array of players (type OpenDotaApi::Matches::Player)
```
##### :small_blue_diamond: Player

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
player.last_hits
player.firstblood_claimed
player.hero_damage
player.teamfight_participation
```

#### :large_blue_diamond: Heroes

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

#### :large_blue_diamond: Pro Players

##### API Method: [proPlayers](https://docs.opendota.com/#tag/proPlayers)


```ruby
pro_players = OpenDotaApi.pro_players
pro_players.class              # array        
```

```ruby
pro_player = pro_players.first
pro_player.class               # OpenDotaApi::ProPlayer    
```

```ruby
pro_player.account_id
pro_player.steam_id
pro_player.avatar
pro_player.avatar_medium
pro_player.avatar_full
pro_player.profile_url
pro_player.persona_name
pro_player.last_login
pro_player.full_history_time
pro_player.cheese
pro_player.fh_unavailable
pro_player.loc_country_code
pro_player.last_match_time
pro_player.name
pro_player.country_code
pro_player.fantasy_role
pro_player.team_id
pro_player.team_name
pro_player.team_tag
pro_player.locked?
pro_player.pro?
pro_player.locked_until
```


#### :large_blue_diamond: Explorer

##### API Method: [explorer](https://docs.opendota.com/#tag/explorer)


```ruby
explorer = OpenDotaApi.explorer(league_id)
explorer.class                  # OpenDotaApi::Explorer       
```

```ruby
explorer.league_matches_ids     # Array of matches IDs for current league 
```
...

That's all for now.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vergilet/open_dota_api

<img align="right" src="https://user-images.githubusercontent.com/2478436/28493917-7c3389c8-6f28-11e7-932e-da360b68f3d3.gif"/> 
    
Feel free to contribute:
1. Fork it (https://github.com/vergilet/open_dota_api/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request



## License
The gem is available as open source under the terms of the MIT License.

Copyright © 2017 Yaro.

[![GitHub license](https://img.shields.io/badge/license-MIT-brightgreen)](https://raw.githubusercontent.com/vergilet/open_dota_api/master/LICENSE)
