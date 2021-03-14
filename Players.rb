load './Example.rb'

class Players
    def create_users
        @Players = {player_1: UserPlayer.new, player_2: UserPlayer.new}
        @Players[:player_1].input_user("player 1")
        @Players[:player_2].input_user("player 2")
    end

    def game_progress
        exmpl = Example.new
        @Players[:player_1].move(exmpl) 
    end

    def get_players
        return @Players
    end
end

class UserPlayer
    def initialize
        @userPlayer = {}
    end

    def get_points
        return @userPlayer[:points]
    end

    def set_user_param
        @userPlayer[:points] = 100
    end


    def blow(power)
        @userPlayer[:points] -= power
        return @userPlayer[:points]
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

    def move(exmpl)
        right_answer = exmpl.recive_example
        right_answer ? blow(right_answer) :  puts('2')
        puts "you have a #{get_points} points"
    end
end