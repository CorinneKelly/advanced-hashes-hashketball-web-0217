# Write your code here!
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo"  => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(players_name)
  game_hash.each do |team, team_info|
    team_info.each do |team_info, details|
      if team_info == :players
        details.each do |player, stats|
          if player == players_name
            stats.each do |stat_cat, stat_details|
              if stat_cat == :points
                return stat_details
              end
            end
          end
        end
      end
    end
  end

#   if game_hash[:home][:players].include?(players_name)
#     return game_hash[:home][:players][players_name][:points]
#   else
#     game_hash[:away][:players][players_name][:points]
#   end
end

def shoe_size(players_name)
  game_hash.each do |team, team_info|
    team_info.each do |team_info, details|
      if team_info == :players
        details.each do |player, stats|
          if player == players_name
            stats.each do |stat_cat, stat_details|
              if stat_cat == :shoe
                return stat_details
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_deets|
    team_deets.each do |deets_cat, info|
      if deets_cat == :team_name && info == team_name
        return game_hash[location][:colors]
      end
    end

  end
end

def team_names
  team_array = []
  game_hash.each do |location, team_stats|
    team_stats.each do |category, details|
      if category == :team_name
        team_array << details
      end
    end
  end
  team_array
end

def player_numbers(team)
  # home_team_numbers_array = []
  # away_team_numbers_array = []
  #
  # game_hash.each do |location, team_stats|
  #   if location == :home
  #     game_hash[:home][:players].each do |player_name, player_info|
  #       player_info.each do |player_detail, player_stat|
  #         if player_detail == number
  #         home_team_numbers_array << player_stat
  #     end
  #   end
  # end

  team_numbers_array = []
  game_hash.each do |location, team_stats|
    team_stats.each do |stats, details|
      if stats == :team_name && details == team
        game_hash[location][:players].each do |player_name, player_info|
          player_info.each do |player_stat, player_detail|
            if player_stat == :number
              team_numbers_array << player_detail
            end
          end
        end
      end
    end
  end
  team_numbers_array
end

def player_stats(player)
  game_hash.each do |location, team_stats|
    team_stats.each do |team_info, details|
      if team_info == :players
        details.each do |player_name, player_info|
          if player_name == player
            return player_info
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_player = ""
  biggest_shoe_size = 0
  game_hash.each do |location, team_stats|
    game_hash[location][:players].each do |player_name, player_info|
      if game_hash[location][:players][player_name][:shoe] > biggest_shoe_size
        biggest_shoe_size = game_hash[location][:players][player_name][:shoe]
        biggest_shoe_player = player_name
      end
    end
  end

  game_hash.each do |location, team_stats|
    game_hash[location][:players].each do |player_name, player_info|
      if player_name == biggest_shoe_player
        return game_hash[location][:players][player_name][:rebounds]
      end
    end
  end

end
