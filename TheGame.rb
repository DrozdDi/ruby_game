load './Players.rb'
load './Example.rb'
load './methods.rb'

class TheGame
    
    def playgame
        welcome_message
        
        print "Please enter name for player 1:  "
        user_name_1 = gets.chomp.capitalize
        print "Please enter name for player 2:  "
        user_name_2 = gets.chomp.capitalize

        players = Players.new(user_name_1, user_name_2)  
        players.battle  

    end
end