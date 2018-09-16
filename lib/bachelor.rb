require 'pry'

def get_first_name_of_season_winner(data, season)
  data.each {|season_name,contestants|
    if season_name == season
      winner = contestants.select {|contestant,properties|
        contestant["status"] == "Winner"
      }.first
      if winner != nil
        return winner["name"].split(" ").first
      end
    end
  }
end

def get_contestant_name(data, occupation)
  data.each {|season_name,contestants|
    person = contestants.select {|contestant,properties|
      contestant["occupation"] == occupation
    }.first
    if person != nil
      return person["name"]
    end
  }
end

def count_contestants_by_hometown(data, hometown)
  count_contestants = 0
  data.each {|season_name,contestants|
    season_contestants = contestants.select {|contestant,properties|
      contestant["hometown"] == hometown
    }.length
    count_contestants += season_contestants
  }
  count_contestants
end

def get_occupation(data, hometown)
  data.each {|season_name,contestants|
    person = contestants.select {|contestant,properties|
      contestant["hometown"] == hometown
    }.first
    if person != nil
      return person["occupation"]
    end
  }
end

def get_average_age_for_season(data, season)
  ages = []
  data.each {|season_name,contestants|
    if season_name == season
      contestants.each {|contestant,properties|
        ages << contestant["age"].to_i
      }
      age_sum = ages.inject{|sum, n| sum + n}
      return (age_sum.to_f / ages.size.to_f).round
    end
  }
end
