Then /^Sort Order Grid (.*) in (.*) order$/ do |column, sort_order|
  case column.downcase
    when "order id"
      batch.filter_panel.awaiting_shipment.grid.order_id.sort_order(sort_order).should be true
    else

  end

end