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
        @continue = true
        now_move = @Players[:player_1]
        opponent = @Players[:player_2]
        while @continue do
            player_move(now_move, opponent)
            check_score(opponent)
            show_balance
            now_move == @Players[:player_1] ? now_move  = @Players[:player_2] : now_move = @Players[:player_1]
            opponent == @Players[:player_2] ? opponent  = @Players[:player_1] : opponent = @Players[:player_2]
        end 
        puts 'Game over!'
    end

    def check_score(player)
        puts "cheking csore"
        balance = player[:user].get_points
        balance > 0 ? @continue  = true  : @continue = false
    end

    def  player_move (carrent_player, opponent)
        power = carrent_player[:user].move(@exmpl)
        power ? opponent[:user].blow(power) : puts('Ooops! Wrong answer')
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
        @userPlayer = {points: 5}
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

    def type_to_start
        print "#{@userPlayer[:name]}, your move! Type to start: "
        gets.chomp 
    end

    def move(exmpl)
        type_to_start
        right_answer = exmpl.recive_example
        return right_answer
        # right_answer ? blow(right_answer) :  puts('2')
        # puts "you have a #{get_points} points"
    end
end