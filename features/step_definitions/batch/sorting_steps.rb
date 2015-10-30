Then /^Sort Order Grid (.*) in (.*) order$/ do |column, sort_order|
  case column.downcase
    when "age"
      batch.filter.awaiting_shipment.column.age.sort_order(sort_order).should be true
    when "order id"
      batch.filter.awaiting_shipment.column.order_id.sort_order(sort_order).should be true
    when "order date"
      batch.filter.awaiting_shipment.column.order_date.sort_order(sort_order).should be true
    when "recipient"
      batch.filter.awaiting_shipment.column.recipient.sort_order(sort_order).should be true
    when "address"
      batch.filter.awaiting_shipment.column.address.sort_order(sort_order).should be true
    when "city"
      batch.filter.awaiting_shipment.column.city.sort_order(sort_order).should be true
    when "state"
      batch.filter.awaiting_shipment.column.state.sort_order(sort_order).should be true
    when "zip"
      batch.filter.awaiting_shipment.column.zip.sort_order(sort_order).should be true
    when "phone"
      batch.filter.awaiting_shipment.column.phone.sort_order(sort_order).should be true
    when "email"
      batch.filter.awaiting_shipment.column.email.sort_order(sort_order).should be true
    when "qty"
      batch.filter.awaiting_shipment.column.qty.sort_order(sort_order).should be true
    when "item sku"
      batch.filter.awaiting_shipment.column.item_sku.sort_order(sort_order).should be true
    when "item name"
      batch.filter.awaiting_shipment.column.item_name.sort_order(sort_order).should be true
    when "ship from"
      batch.filter.awaiting_shipment.column.ship_from.sort_order(sort_order).should be true
    when "weight"
      batch.filter.awaiting_shipment.column.weight.sort_order(sort_order).should be true
    when "insured value"
      batch.filter.awaiting_shipment.column.insured_value.sort_order(sort_order).should be true
    when "order status"
      batch.filter.awaiting_shipment.column.order_status.sort_order(sort_order).should be true
    when "ship date"
      batch.filter.awaiting_shipment.column.ship_date.sort_order(sort_order).should be true
    when "order total"
      batch.filter.awaiting_shipment.column.order_total.sort_order(sort_order).should be true
    when "country"
      batch.filter.awaiting_shipment.column.country.sort_order(sort_order).should be true

    else
      raise "The error lay between the chair and the keyboard... know how to use the API pls."
  end
end


