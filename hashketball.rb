# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player)
  player_data = find_player player, true
  if player_data
    get_score player_data
  else
    player_data = find_player player, false
    if player_data
      get_score player_data
    else
      nil
    end
  end
end

def shoe_size(player)
  player_data = find_player player, true
  if player_data
    get_shoe_size player_data
  else
    player_data = find_player player, false
    if player_data
      get_shoe_size player_data
    else
      nil
    end
  end
end

def team_colors(team)
  (game_hash[:home][:team_name] == team) ? game_hash[:home][:colors] : (game_hash[:away][:colors])
end

def team_names
  game_hash.map do |key, _|
    game_hash[key][:team_name]
  end
end

def player_numbers(team)
  side = find_team_side team
  game_hash[side][:players].map { |player| player[:number] }
end

def player_stats(player)
  find_player(player, true) ? find_player(player, true) : find_player(player, false)
end

def big_shoe_rebounds
  biggest_shoe[:rebounds]
end

def biggest_shoe
  large = 0
  player_name = ""
  game_hash.each do |key,value|
    value[:players].each do |player|
      if player[:shoe] > large
        player_name = player[:player_name]
        large = player[:shoe]
      end
    end
  end

  if find_player(player_name, true)
    find_player(player_name, true)
  else
    find_player(player_name, false)
  end

end

def find_player(player, home)
  if home
    game_hash[:home][:players].find do |element|
      element[:player_name] == player
    end
  else
    game_hash[:away][:players].find do |element|
      element[:player_name] == player
    end
  end
end

def find_team_side(team)
  game_hash[:home][:team_name] == team ? :home : :away
end

def get_score(player)
  player[:points]
end

def get_shoe_size(player)
  player[:shoe]
end
