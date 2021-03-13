class Players
    def create_users
        @Players = [UserPlayer.new, UserPlayer.new]
        @Players[0].input_user("player 1")
        @Players[0].input_user("player 2")
    end

    def get_players
        return @Players
    end
end

class UserPlayer
    def initialize
        @userPlayer = {}
    end

    def set_user_param
        @userPlayer[:points] = 100
    end

    def input_user(player)

        puts "Please enter name for #{player}"
        user_name = gets.chomp.capitalize
        @userPlayer[:name] = user_name 
        set_user_param

        puts "Hi, #{@userPlayer[:name]}, you have a #{@userPlayer[:points]} points!"
        up = @userPlayer
        return up
    end


end