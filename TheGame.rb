load './Players.rb'
load './Example.rb'

class TheGame
    
    def playgame
        welcome
        autorizatin
        # start_game
    end

    def welcome 
        puts "HI" # will be added
    end

    def autorizatin
        @players = Players.new
        @players.create_users
        @players.game_progress
    end

    def start_game
        # @players.game_progress
    end
end