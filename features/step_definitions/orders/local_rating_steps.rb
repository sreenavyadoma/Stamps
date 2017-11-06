Then /^Verify Local Rating$/ do |table|
  #test_config.logger.step "Verify Local Rating..."
  #results_file="local_rating_results.csv"
  order_details_form=stamps.orders.details
  parameter_array=table.hashes
  results=Hash.new

  parameter_array.each_with_index do |field, index|
    #test_config.logger.step "  --------------------------------------------------------------------------- "
    #test_config.logger.step "  Test #{index}  ||  #{field["ship_from"]} ||  #{field["ship_to"]} ||  #{field["weight_oz"]} ||  #{field["weight_lb"]} ||  #{field["length"]} ||  #{field["height"]} ||  #{field["width"]} ||  #{field["service"]} ||  #{field["tracking"]}"
    #test_config.logger.step "  --------------------------------------------------------------------------- "
    step "set Order Details form Ship-From to #{field["ship_from"]}"
    step "set Order Details form Ship-To Domestic address to #{field["ship_to"]}"
    step "set Order Details form Ounces to #{field["weight_oz"]}"
    step "set Order Details form Pounds to #{field["weight_lb"]}"
    step "set Order Details form Length to #{field["length"]}"
    step "set Order Details form Height to #{field["height"]}"
    step "set Order Details form Width to #{field["width"]}"
    step "set Order Details form service to #{field["service"]}"
    step "set Order Details form Tracking to #{field["tracking"]}"

    10.times do
      order_details_form.blur_out
      total=order_details_form.footer.total_ship_cost
      if total.eql? field["total"]
        results[index]=total.eql? field["total"]
        break
      else
        results[index]=total.eql? field["total"]
      end
    end
    total=order_details_form.footer.total_ship_cost

    expected_total_amount=field["total"]

    5.times do
      stamps.orders.single_order_details.blur_out
      sleep(0.5)
      total_ship_cost=stamps.orders.single_order_details.footer.total_ship_cost
      stamps.orders.single_order_details.blur_out
      stamps.orders.single_order_details.blur_out
      sleep(0.5)
      break if total_ship_cost==expected_total_amount.to_f.round(2)
    end

    #test_config.logger.step "  --------------------------------------------------------------------------- "
    #test_config.logger.step "  Test #{index} #{(results[index])?"Passed":"Failed"}"
    #test_config.logger.step "  --------------------------------------------------------------------------- "

    actual=stamps.orders.single_order_details.footer.total_ship_cost
    expect(actual).to eql expected_total_amount

    expect("").to eql "| Test #{index} | #{(results[index])?"Passed":"Failed"} |Expectation=#{field["total"]},Actual=#{total}| | #{field["service"]} | #{field["weight_lb"]} | #{field["weight_oz"]} | #{field["length"]} | #{field["height"]} | #{field["width"]} | #{field["tracking"]} | #{field["total"]} |" if actual != expected_total_amount
  end

end

