load './Example.rb'

class Players
    def create_users
        @Players = {
            player_1: {user: UserPlayer.new, balance: false}, 
            player_2: {user: UserPlayer.new, balance: false}  
        }
        @Players[:player_1][:user].input_user("player 1")
        @Players[:player_2][:user].input_user("player 2")
    end

    def game_progress
        @exmpl = Example.new
        continue = true
        while continue do
            player_move(@Players[:player_1], @Players[:player_2])
            check_score(@Players[:player_2]) ? player_move(@Players[:player_2], @Players[:player_1]) : continue = false
            check_score(@Players[:player_1]) ? continue = true  : continue = false
            show_balance
        end 
        puts 'Game over!'
    end

    def check_score(player)
        puts "cheking csore"
        player[:balance] = player[:user].get_points
        player[:balance] > 0 ? send = true : send = false
        return send 
    end

    def  player_move (carrent_player, opponent)
        power = carrent_player[:user].move(@exmpl)
        power ? opponent[:user].blow(power) : puts('mimo')
    end

    def show_balance
        puts "P1: #{@Players[:player_1][:user].get_points}"   
        puts "P2: #{@Players[:player_2][:user].get_points}" 
    end

    def get_players
        return @Players
    end
end

class UserPlayer
    def initialize
        @userPlayer = {points: 100}
    end

    def get_points
        return @userPlayer[:points]
    end

    # def set_user_param
    #     @userPlayer[:points] = 100
    # end


    def blow(power)
        puts power
        @userPlayer[:points] -= power
        puts  "On, sheet! #{ @userPlayer[:name]}, you have a #{@userPlayer[:points]}"
        # return @userPlayer[:points]
    end 

    def input_user(player)
        puts "Please enter name for #{player}"
        user_name = gets.chomp.capitalize
        @userPlayer[:name] = user_name 

        puts "Hi, #{@userPlayer[:name]}, you have a #{@userPlayer[:points]} points!"
        up = @userPlayer
        return up
    end

    def move(exmpl)
        right_answer = exmpl.recive_example
        return right_answer
        # right_answer ? blow(right_answer) :  puts('2')
        # puts "you have a #{get_points} points"
    end
end