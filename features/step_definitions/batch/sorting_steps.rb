Then /^Sort Order Grid (.*) in (.*) order$/ do |column, sort_order|
  case column.downcase
    when "order id"
      batch.filter.awaiting_shipment.grid.column.order_id.sort_order(sort_order).should be true
    else

  end

end