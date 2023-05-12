require "byebug"
class Item

    attr_reader :deadline
    attr_accessor :title, :description

    def self.valid_date?(date_string)
        year = ""
        month = ""
        day = ""
        i = 0

        #define year
        while date_string[i] != "-"
            i += 1
        end
        year = date_string[0...i]
        i += 1

        #define month
        while date_string[i] != "-"
            i += 1
        end
        month = date_string[((year.length)+1)...i]
        i += 1

        #define day
        day = date_string[i..-1]

        #check conditions
        return false if day.to_i > 31 || day.to_i < 1
        return false if month.to_i > 12 || month.to_i < 1
        return true
    end


    def initialize(title, deadline, description)
        return "invalid date" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(new_deadline)
        @deadline = new_deadline if Item.valid_date?(new_deadline)
    end

        

end

#item1 = Item.new

#test self.valid_date?
# puts Item.valid_date?('2019-10-25') # true
# puts Item.valid_date?('1912-06-23') # true
# puts Item.valid_date?('2018-13-20') # false
# puts Item.valid_date?('2018-12-32') # false
# puts Item.valid_date?('2019-10-42') # flase

item1 = Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

item2 = Item.new(
    'Buy Cheese',
    '2019-10-31',
    'You require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
)

item3 = Item.new(
    'Fix checkout page',
    '10-25-2019',
    'The font is too small.'
) # raises error due to invalid date


# puts Item.valid_date?(item2.deadline())