Then /^Verify Local Rating$/ do |table|
  #test_config.logger.step "Verify Local Rating..."
  #results_file = "local_rating_results.csv"
  order_details_form = stamps.orders.details
  parameter_array = table.hashes
  results = Hash.new

  parameter_array.each_with_index do |element, index|
    #test_config.logger.step "  --------------------------------------------------------------------------- "
    #test_config.logger.step "  Test #{index}  ||  #{element["ship_from"]} ||  #{element["ship_to"]} ||  #{element["weight_oz"]} ||  #{element["weight_lb"]} ||  #{element["length"]} ||  #{element["height"]} ||  #{element["width"]} ||  #{element["service"]} ||  #{element["tracking"]}"
    #test_config.logger.step "  --------------------------------------------------------------------------- "
    step "set Order Details form Ship-From to #{element["ship_from"]}"
    step "set Order Details form Ship-To Domestic address to #{element["ship_to"]}"
    step "set Order Details form Ounces to #{element["weight_oz"]}"
    step "set Order Details form Pounds to #{element["weight_lb"]}"
    step "set Order Details form Length to #{element["length"]}"
    step "set Order Details form Height to #{element["height"]}"
    step "set Order Details form Width to #{element["width"]}"
    step "set Order Details form service to #{element["service"]}"
    step "set Order Details form Tracking to #{element["tracking"]}"

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
      stamps.orders.single_order_details.blur_out
      sleep(0.5)
      total_ship_cost = stamps.orders.single_order_details.footer.total_ship_cost
      stamps.orders.single_order_details.blur_out
      stamps.orders.single_order_details.blur_out
      sleep(0.5)
      break if total_ship_cost == expected_total_amount.to_f.round(2)
    end

    #test_config.logger.step "  --------------------------------------------------------------------------- "
    #test_config.logger.step "  Test #{index} #{(results[index])?"Passed":"Failed"}"
    #test_config.logger.step "  --------------------------------------------------------------------------- "

    actual = stamps.orders.single_order_details.footer.total_ship_cost
    expect(actual).to eql expected_total_amount

    expect("").to eql "| Test #{index} | #{(results[index])?"Passed":"Failed"} |Expectation=#{element["total"]},Actual=#{total}| | #{element["service"]} | #{element["weight_lb"]} | #{element["weight_oz"]} | #{element["length"]} | #{element["height"]} | #{element["width"]} | #{element["tracking"]} | #{element["total"]} |" if actual != expected_total_amount
  end

end

