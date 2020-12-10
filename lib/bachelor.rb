require 'pry'


def get_first_name_of_season_winner(data, season)
  data.find do |season_number, contestants|
    if season_number == season
      contestants.find do |contestant|
        contestant["status"] == "winner" 
        return contestant["name"].split.first 
      end 
    end
  end 
end


def get_contestant_name(data, occupation)
  data.each do |season_number, contestants|
    contestants.find do |contestant|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end 
    end
  end
end



def count_contestants_by_hometown(data, hometown)
hometome_counter = 0
  data.each do |season_number, contestants|
    contestants.filter do |contestant|
      if contestant["hometown"] == hometown
        hometome_counter += 1
      end
    end
  end
  hometome_counter
end

def get_occupation(data, hometown)
  data.each do |season_number, contestants|
    contestants.find do |contestant|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end 
  end 
end

def get_average_age_for_season(data, season)
ages = []
  data.each do |season_number, contestants|
    if season_number == season  
      contestants.filter do |contestant|
        ages << contestant["age"].to_f
      end
    end
  end
  avg=ages.sum/ages.length
  avg.round
end



