require_relative 'example.rb'
require_relative 'user_player.rb'
require_relative 'methods.rb'


class Players
    def initialize(user_name_1, user_name_2)
        starter_balance  = 10
        @Players = {
            player_1: UserPlayer.new(user_name_1, starter_balance), 
            player_2: UserPlayer.new(user_name_2, starter_balance)  
        }
    end

    def battle
        @exmpl = Example.new
        @continue = true
        @current_move = @Players[:player_1]
        @opponent = @Players[:player_2]

        while @continue do
            player_move
            check_score
            show_balance
            @current_move == @Players[:player_1] ? @current_move  = @Players[:player_2] : @current_move = @Players[:player_1]
            @opponent == @Players[:player_2] ? @opponent  = @Players[:player_1] : @opponent = @Players[:player_2]
        end 
        fatal_blow_message(@opponent.name)
    end

    def  player_move
        move = @current_move.move(@exmpl)
        if move 
            @opponent.blow(@exmpl.blow) 
        end
    end

    def check_score
        balance = @opponent.points
        balance > 0 ? @continue  = true  : @continue = false
    end

    def show_balance
        puts "User`s balance:
        #{@Players[:player_1].name} - #{@Players[:player_1].points} points 
        #{@Players[:player_2].name} - #{@Players[:player_2].points} points"
    end
end