Then /^Verify Local Rating$/ do |table|
  logger.step "Verify Local Rating..."
  #results_file = "local_rating_results.csv"
  order_details_form = stamps.orders.details
  parameter_array = table.hashes
  results = Hash.new

  parameter_array.each_with_index do |element, index|
    logger.step "  --------------------------------------------------------------------------- "
    logger.step "  Test #{index}  ||  #{element["ship_from"]} ||  #{element["ship_to"]} ||  #{element["weight_oz"]} ||  #{element["weight_lbs"]} ||  #{element["length"]} ||  #{element["height"]} ||  #{element["width"]} ||  #{element["service"]} ||  #{element["tracking"]}"
    logger.step "  --------------------------------------------------------------------------- "
    step "Details: Set Ship-From to #{element["ship_from"]}"
    step "Details: Set Ship-To text area to #{element["ship_to"]}"
    step "Details: Set Ounces to #{element["weight_oz"]}"
    step "Details: Set Pounds to #{element["weight_lbs"]}"
    step "Details: Set Length to #{element["length"]}"
    step "Details: Set Height to #{element["height"]}"
    step "Details: Set Width to #{element["width"]}"
    step "Details: Set Service to \"#{element["service"]}\""
    step "Details: Set Tracking to \"#{element["tracking"]}\""

    10.times do
      order_details_form.blur_out
      total = order_details_form.footer.total_ship_cost
      if total.eql? element["total"]
        results[index] = total.eql? element["total"]
        break
      else
        results[index] = total.eql? element["total"]
      end
    end
    total = order_details_form.footer.total_ship_cost

    expected_total_amount = element["total"]

    5.times do
      stamps.orders.order_details.blur_out
      sleep 1
      total_ship_cost = stamps.orders.order_details.footer.total_ship_cost
      stamps.orders.order_details.blur_out
      stamps.orders.order_details.blur_out
      sleep 1
      break if total_ship_cost.to_f == expected_total_amount.to_f
    end

    logger.step "  --------------------------------------------------------------------------- "
    logger.step "  Test #{index} #{(results[index])?"Passed":"Failed"}"
    logger.step "  --------------------------------------------------------------------------- "

    actual = stamps.orders.order_details.footer.total_ship_cost
    actual.should eql expected_total_amount

    "".should eql "| Test #{index} | #{(results[index])?"Passed":"Failed"} |Expectation=#{element["total"]},Actual=#{total}| | #{element["service"]} | #{element["weight_lbs"]} | #{element["weight_oz"]} | #{element["length"]} | #{element["height"]} | #{element["width"]} | #{element["tracking"]} | #{element["total"]} |" if actual != expected_total_amount
  end

end

