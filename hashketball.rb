require "pry"
def game_hash
  
  game_hash = {
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
            :rebounds => 11,
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
            
          "Bismack Biyombo" => {
            :number => 0, 
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
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
        
        "Kemba Walker" => {  
          :number => 33, 
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12 
        }
  
      }
    }
  }
  game_hash
end


def num_points_scored(players_name)
  
  
  if game_hash[:home][:players].include?(players_name)
     return game_hash[:home][:players][players_name][:points]
  elsif game_hash[:away][:players].include?(players_name)
    return  game_hash[:away][:players][players_name][:points]
  else
   "No player found."
  end
end
  
  def shoe_size(players_name)
      if game_hash[:home][:players].include?(players_name)
       return game_hash[:home][:players][players_name][:shoe]
    elsif game_hash[:away][:players].include?(players_name)
      return  game_hash[:away][:players][players_name][:shoe]
    else
     "No player found."
    end
  end

def team_colors(team_name)
   array = []
  
  if game_hash[:home][:team_name] == team_name
    array = game_hash[:home][:colors]
   

  elsif game_hash[:away][:team_name] == team_name
    array = game_hash[:away][:colors]
    
  end

  return array
end

def team_names()
  team_names = []
  
  team_names << game_hash[:home][:team_name]
  team_names << game_hash[:away][:team_name]
  
  return team_names
end

def player_numbers(team_name)
  jersey_numbers = []

  if game_hash[:home][:team_name] == team_name

      game_hash[:home][:players].each do |player|
       jersey_numbers << player[1][:number]
      end
  elsif game_hash[:away][:team_name] == team_name

      game_hash[:away][:players].each do |player|
       jersey_numbers << player[1][:number]
      end
  else
  end
  return jersey_numbers
end

def player_stats(players_name)
  player_stats = {}

  game_hash[:home][:players].each do |x, y|  

  # x.each do |name|
    if x == players_name
      puts game_hash[:home][:players][players_name]
      player_stats = game_hash[:home][:players][players_name]
    end
  # end
  end

  game_hash[:away][:players].each do |x, y|
  # x.each do |name|

    puts x
    if x == players_name
    
      puts game_hash[:away][:players][players_name]
      player_stats = game_hash[:away][:players][players_name]
    end
  # end

  end
  player_stats
end


  
def big_shoe_rebounds()
  player_biggest_shoe = ""
  biggest_shoe_size = 0
  
  game_hash[:home][:players].each do |name, player|
    if player[:shoe] > biggest_shoe_size
      player_biggest_shoe = name
      biggest_shoe_size = player[:shoe]
    end
  end
  game_hash[:away][:players].each do |name, player|
    if player[:shoe] > biggest_shoe_size
      player_biggest_shoe = name
      biggest_shoe_size = player[:shoe]
    end
  end
  
  game_hash[:home][:players][player_biggest_shoe][:rebounds]
  
end



def most_points_scored
  most_points = 0
  player = ""
  game_hash.each do |team_position, team_data|
    team_data[:players].each do |player_name, player_data|
      if most_points < player_data[:points]
        player = player_name
        most_points = player_data[:points]
      else 
        most_points
      end
  end
  end
  player 
end



def winning_team 

  away = 0
  home = 0

    game_hash[:home][:players].each do |player_name|
      home += player_name[1][:points]
      puts home
    end

    game_hash[:away][:players].each do |player_name|
      away += player_name[1][:points]
      puts away
    end

    return home > away ? game_hash[:home][:team_name] : game_hash[:away][:team_name]

end


def player_with_longest_name
  longest_name = ""
  length = 0

  game_hash[:away][:players].each do |name, player|
    if name.length > length
      puts name
      puts name.length
      length = name.length
      longest_name = name
    end

  end

  game_hash[:home][:players].each do |name, player|
    if name.length > length
      puts name
      puts name.length
      length = name.length
      longest_name = name
    end

  end
     longest_name
end

def long_name_steals_a_ton?
  most_steal = ""
  steals = 0

  game_hash[:away][:players].each do |name, player|
 
    if player[:steals] > steals
      
      most_steal = name
      steals = player[:steals]
    end

  end

  game_hash[:home][:players].each do |name, player|
  
    if player[:steals] > steals
      most_steal = name
      steals = player[:steals]
    end

  end
 
  return player_with_longest_name == most_steal ? true : false
    
end















# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#     team_data.each do |attribute, data|
#       #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#       binding.pry
 
#       #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
#       data.each do |data_item|
#           binding.pry
#       end
#     end
#   end
# end

# good_practices


















