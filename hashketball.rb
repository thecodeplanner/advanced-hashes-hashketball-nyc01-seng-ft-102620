# Write your code below game_hash

require 'pry'

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

#method takes in player and returns number of points num_points_scored

def num_points_scored(player) 
  points = nil  #set points equal to nil
 game_hash.each do |location, team_data|  #iterate through outer hash
    team_data.each do |attribute, data|
      if attribute == :players  #iterates through hash, if attribute key is equal to :players, iterate further into hashes 
        data.each do |player_data|
          player_data.each do |stats|   #finally in the inner hash of the player names
              if stats[1] == player 
              points = player_data[:points] # if stats[1] which is player name, equare the player passed in, assign points to the corresponding points 
              end 
            end
          end
        end
      end
    end
    points #return points 
end


#method finds player's shoe size when player is passed in 

def shoe_size(player)
  size = nil 
 game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_data|
          player_data.each do |stats|
              if stats[1] == player 
              size = player_data[:shoe]
              end 
            end
          end
        end
      end
    end
    size 
end


#returns the team colors of team names passed in 

def team_colors(team_name)
  colors = []
  game_hash.each do |location, team_data| 
    team_data.each do |attribute, data|
      if team_name == data 
        colors = team_data[:colors]
      end
    end 
  end
  colors 
end

# method returns array of team names 
def team_names
  team_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_array << data 
      end
    end
  end
  team_array
end 

## returns the player jersey numbers 

def player_numbers(team_name)
  jersey_num_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if team_name == team_data[:team_name]
        count = 0
        while count < team_data[:players].length do 
          jersey_num_array << team_data[:players][count][:number]
          count += 1 
        end
      end
    end
  end
  jersey_num_array.uniq #used unique method as numbers were pushed in and duplicated
end

## method to return player stats when player passed in 

def player_stats(player)
  p_stats = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_data|
          player_data.each do |stats|
            if stats[1] == player
              p_stats = player_data
            end
          end
        end
      end
    end
  end
  p_stats
end

def big_shoe_rebounds
  biggest_shoe = 0 
  big_shoe_rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_data|
          player_data.each do |stats|
            if stats[0] == :shoe 
              if player_data[:shoe] > biggest_shoe
                biggest_shoe = player_data[:shoe]
                big_shoe_rebounds = player_data[:rebounds]
              end  
            end
          end
        end
      end
    end
  end
  big_shoe_rebounds
end

