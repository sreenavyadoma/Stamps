Then /^Verify Local Rating$/ do |table|

  pending
  ##SdcLog.step "Verify Local Rating..."
  #results_file="local_rating_results.csv"
  # order_details_form = stamps.orders.details
  # parameter_array = table.hashes
  # results = {}
  #
  # parameter_array.each_with_index do |field, index|
  #   #SdcLog.step "  --------------------------------------------------------------------------- "
  #   #SdcLog.step "  Test #{index}  ||  #{field["ship_from"]} ||  #{field["ship_to"]} ||  #{field["weight_oz"]} ||  #{field["weight_lb"]} ||  #{field["length"]} ||  #{field["height"]} ||  #{field["width"]} ||  #{field["service"]} ||  #{field["tracking"]}"
  #   #SdcLog.step "  --------------------------------------------------------------------------- "
  #   step "set order details ship-from to #{field["ship_from"]}"
  #   step "set Order Details Ship-To Domestic address to #{field["ship_to"]}"
  #   step "set order details ounces to #{field["weight_oz"]}"
  #   step "set order details pounds to #{field["weight_lb"]}"
  #   step "set order details length to #{field["length"]}"
  #   step "set order details height to #{field["height"]}"
  #   step "set order details width to #{field["width"]}"
  #   step "set Order Details service to #{field["service"]}"
  #   step "set order details tracking to #{field["tracking"]}"
  #
  #   #todo-Rob fix this grade school coding smells problem
  #   10.times do
  #     order_details_form.blur_out
  #     total = order_details_form.footer.total_ship_cost.text.parse_digits.to_f.round(2)
  #     if total.eql? field["total"]
  #       results[index] = total.eql? field["total"]
  #       break
  #     else
  #       results[index] = total.eql? field["total"]
  #     end
  #   end
  #   total = order_details_form.footer.total_ship_cost.text.parse_digits.to_f.round(2)
  #
  #   expected_total_amount = field["total"]
  #
  #   5.times do
  #     stamps.orders.order_details.blur_out
  #     sleep(0.5)
  #     total_ship_cost = stamps.orders.order_details.footer.total_ship_cost.text.parse_digits.to_f.round(2)
  #     stamps.orders.order_details.blur_out
  #     stamps.orders.order_details.blur_out
  #     sleep(0.5)
  #     break if total_ship_cost == expected_total_amount
  #   end
  #
  #   #SdcLog.step "  --------------------------------------------------------------------------- "
  #   #SdcLog.step "  Test #{index} #{(results[index])?"Passed":"Failed"}"
  #   #SdcLog.step "  --------------------------------------------------------------------------- "
  #
  #   actual = stamps.orders.order_details.footer.total_ship_cost.text.parse_digits.to_f.round(2)
  #   expect(actual).to eql expected_total_amount
  #
  #   expect("").to eql "| Test #{index} | #{(results[index]) ? "Passed" : "Failed"} |Expectation=#{field["total"]},Actual=#{total}| | #{field["service"]} | #{field["weight_lb"]} | #{field["weight_oz"]} | #{field["length"]} | #{field["height"]} | #{field["width"]} | #{field["tracking"]} | #{field["total"]} |" if actual != expected_total_amount
  #end

end

