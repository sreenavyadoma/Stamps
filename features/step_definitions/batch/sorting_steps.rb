Then /^Sort Order Grid (.*) in (.*) order$/ do |column, sort_order|
  @grid = batch.filter.awaiting_shipment
  case column.downcase
    when "age"
      @grid.age.sort(sort_order).should be true
    when "order id"
      @grid.order_id.sort(sort_order).should be true
    when "order date"
      @grid.order_date.sort(sort_order).should be true
    when "recipient"
      @grid.recipient.sort(sort_order).should be true
    when "address"
      @grid.domestic.sort(sort_order).should be true
    when "city"
      @grid.city.sort(sort_order).should be true
    when "state"
      @grid.state.sort(sort_order).should be true
    when "zip"
      @grid.zip.sort(sort_order).should be true
    when "phone"
      @grid.phone.sort(sort_order).should be true
    when "email"
      @grid.email.sort(sort_order).should be true
    when "qty"
      @grid.qty.sort(sort_order).should be true
    when "item sku"
      @grid.item_sku.sort(sort_order).should be true
    when "item name"
      @grid.item_name.sort(sort_order).should be true
    when "ship from"
      @grid.ship_from.sort(sort_order).should be true
    when "weight"
      @grid.weight.sort(sort_order).should be true
    when "insured value"
      @grid.insured_value.sort(sort_order).should be true
    when "order status"
      @grid.order_status.sort(sort_order).should be true
    when "ship date"
      @grid.ship_date.sort(sort_order).should be true
    when "order total"
      @grid.order_total.sort(sort_order).should be true
    when "country"
      @grid.country.sort(sort_order).should be true

    else
      raise "The error lay between the chair and the keyboard... know how to use the API pls."
  end
end


