require_relative 'players.rb'
require_relative 'example.rb'
require_relative 'methods.rb'

class TheGame
    
    def playgame
        welcome_message
        players = Players.new(input_names("user 1"), input_names("user 2"))  
        players.battle  
        goodbye_message
    end

    def input_names(user)        
        print "Please enter name for #{user}: "
        user_name = gets.chomp
        user_name.length < 2 ? uncorrect = true : uncorrect = false
        while uncorrect
            print  "The name must be at least 2 characters long, re-enter please: "
            user_name = gets.chomp.capitalize
            user_name.length < 2 ? uncorrect = true : uncorrect = false
        end
        return user_name
    end

end