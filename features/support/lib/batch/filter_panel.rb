module Batch
  class FilterPanel < BatchObject
    def awaiting_shipment
      #todo-eli here are your steps;
      Filters.new(@browser).filter "Awaiting Shipment"
      Grid.new @browser
    end

    def shipped
      #do something click the shipped label
      Filters.new(@browser).filter "Shipped"
      Grid.new @browser
    end
  end


end