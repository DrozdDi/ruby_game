load './Players.rb'
load './Example.rb'

class TheGame
    
    def playgame
       
        welcome
        players = Players.new
        players.create_users

        exm = Example.new
        exm.example_generator
    end

    def welcome 
        puts "HI" # will be added
    end

    def initUsers
        @Players = [createUser('player 1'), createUser('player 2')]
    end

    def createUser(player)
        @userPlayer = {}
        puts "Please enter name #{player}"
        user_name = gets.chomp.capitalize
        #implement validation of the name!!!
        @userPlayer[:name] = user_name 
       
        set_user_param
        puts "Hi, #{@userPlayer[:name]}, you have a #{@userPlayer[:points]} points!"
        up = @userPlayer
        return up

    end

    def set_user_param
        @userPlayer[:points] = 100
    end
end