class UserPlayer
    attr_accessor :name
    attr_reader :points
 
    def initialize(user_name = "Unknown", points)
        @name = user_name
        @points = points
    end

    def blow(power)
        power > @points ? @points = 0 : @points -= power
    end 

    def move(exmpl)
        type_to_start
        exmpl.recive_example
    end

    def type_to_start
        print "#{name}, your move! Type enter to get your example: "
        gets.chomp 
    end
end