Then /^Sort Order Grid (.*) in (.*) order$/ do |column, sort_order|
  case column.downcase
    when "order id"
      batch.filter.awaiting_shipment.grid.column.order_id.sort_order(sort_order).should be true
    else
      raise "The error lay between the chair and the keyboard... know how to use the API pls."
  end
end


