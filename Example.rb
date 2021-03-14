require 'benchmark'

class Example
    @answer = 0
    @calculated = 0
    @time = 0
    
    def recive_example
        generator
        # check the user`s answer
        @answer == @calculated ? res = @time : res = false
        return res
        
    end

    def get_answer
        @answer = gets.chomp.to_i
    end

    def generator
        exm = [rand(100), "", rand(100), "", rand(100), "="]

        # placement of characters in the example and output to the user
        exm[0] > exm[2] ? exm[1] = '-' : exm[1] = '+'  
        exm[2] < exm[4] ? exm[3] = '+' : exm[3] = '-'
        
        7.times {|i| print exm[i], " "}

        time = Benchmark.measure { get_answer }
        @time = time.real.to_i

        #example calculation
        calculated = exm[0]
        exm[1] == '-' ? calculated -= exm[2] : calculated +=  exm[2]
        exm[3] == '-' ? calculated -= exm[4] : calculated +=  exm[4]
        
        @calculated = calculated
        puts "answ: #{@calculated}, time #{@time}"
    end

    def answ
        answer = gets.chomp.capitalize
        puts answer
    end

 

end