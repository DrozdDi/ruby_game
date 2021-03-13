class Example
    def example_generator
        @exm = [rand(100), "", rand(100), "", rand(100), "="]
        
        # placement of characters in the example and output to the user
        @exm[0] > @exm[2] ? @exm[1] = '-' : @exm[1] = '+'  
        @exm[2] < @exm[4] ? @exm[3] = '+' : @exm[3] = '-'
        
        7.times {|i| print @exm[i], " "}
        answer = gets.chomp.capitalize

        #example calculation
        calculated = @exm[0]
        @exm[1] == '-' ? calculated -= @exm[2] : calculated +=  @exm[2]
        @exm[3] == '-' ? calculated -= @exm[4] : calculated +=  @exm[4]
        
        # check the user`s answer
        answer == calculated ? puts('1') :  puts('2')
    end

    def answ
        answer = gets.chomp.capitalize
        puts answer
    end

 

end