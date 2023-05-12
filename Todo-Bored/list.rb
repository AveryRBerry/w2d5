require_relative "item.rb"
class List

    attr_accessor :label

    def initialize(lable)
        @lable = lable
        @items = []
    end

    def add_item(title, deadline, description = "")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        return @items.length
    end

    def valid_index?(index)
        return false if @items[index] == nil
        return true
    end

    def swap(index_1, index_2)
        return nil if !valid_index?(index_1) || !valid_index?(index_2)
    end

end





list1 = List.new("Funfun")
puts list1.add_item("Title", "1999-12-21", "testing 123 hello anyone there?")