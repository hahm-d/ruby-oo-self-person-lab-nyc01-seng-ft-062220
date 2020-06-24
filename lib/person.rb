require 'pry'
class Person 
    attr_reader :name, :hygiene
    attr_accessor :bank_account  

    @@all = [] #Question: is @@all storings all the instance variable data? or just the instance id? Is it pulling from each orbject id by id? 
               #yes it does store the entire object (instance variable)
    def initialize(name)
        @@all << self
        @name = name
        @bank_account = 25.00
        @happy_points = 8
        @hygiene = 8
    end

    def self.all
        @@all
    end

    def hygiene=(hygiene)
        @hygiene = hygiene
        if @hygiene > 10 
            @hygiene = 10
        elsif @hygiene < 0
            @hygiene = 0
        end
    end

    def happiness
        @happy_points 
        #@@all << self
    end

    def happiness=(happy_points)
        @happy_points = happy_points
        if @happy_points > 10 
            @happy_points = 10
        elsif @happy_points < 0
            @happy_points = 0
        end
    end

    def clean?
        if @hygiene > 7
            return true 
        end
        return false
    end

    def happy?
        if @happy_points > 7
            return true 
        end
        return false
    end

    def get_paid(funds)
        @bank_account += funds
        p "all about the benjamins"
    end
    
    def take_bath 
        self.hygiene= @hygiene + 4 #using self (current instance variable) we apply the def .hygiene 
        p "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.hygiene= @hygiene - 3  #when we call the instance of self 
        self.happiness= @happy_points + 2
        p  "♪ another one bites the dust ♫"
    end

    def call_friend(friend) # friend is the instance Id (variable) daniel.call_friend(kyle)
        self.happiness += 3
        friend.happiness += 3 
        p "Hi #{friend.name}! It's #{self.name}. How are you?"
    end


    #start_conversation
    def start_conversation(friend, topic)
        if topic == 'politics'
            self.happiness -= 2
            friend.happiness -= 2
            p "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            self.happiness += 1
            friend.happiness += 1           
            p "blah blah sun blah rain"
        else
            p "blah blah blah blah blah"
        end

    end

end
#binding.pry

