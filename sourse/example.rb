require_relative 'user_player.rb'
require 'benchmark'

class Example
    attr_reader :user_answer, :right_answer, :blow
    
    def recive_example
        generator
        @user_answer == @right_answer ? check_time_limit : wrong_answ
        return @blow
    end

    def check_time_limit
        time_limit  = 20
        power = 0
        if @time > time_limit  
            puts ("You thought too long, your strength is gone ¯\_(ツ)_/¯")
            @blow = false
        else
            @blow = time_limit - @time
            puts ("Right! The force of your blow is equal #{@blow}")
        end
    end

    def wrong_answ
        puts "Khm... NO! Right  answer - #{@right_answer}"
        @blow = false
    end 

    def save_user_answer
        @user_answer = gets.chomp.to_i
    end

    def generator
        exm = [rand(100), "", rand(100), "", rand(100), "="]

        # placement of characters in the example and output to the user
        exm[0] > exm[2] ? exm[1] = '-' : exm[1] = '+'  
        exm[2] < exm[4] ? exm[3] = '+' : exm[3] = '-'
        
        7.times {|i| print exm[i], " "}

        time = Benchmark.measure { save_user_answer }
        @time = time.real.to_i

        #example calculation
        calculated = exm[0]
        exm[1] == '-' ? calculated -= exm[2] : calculated +=  exm[2]
        exm[3] == '-' ? calculated -= exm[4] : calculated +=  exm[4]
        
        @right_answer = calculated
    end

end