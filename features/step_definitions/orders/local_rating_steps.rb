Then /^Verify Local Rating$/ do |table|
  log.info "Step: Verify Local Rating..."
  #results_file = "local_rating_results.csv"
  @order_details = orders.details
  parameter_array = table.hashes
  results = Hash.new

  parameter_array.each_with_index { |element, index|
    log.info "  --------------------------------------------------------------------------- "
    log.info "  Test #{index}  ||  #{element["ship_from"]} ||  #{element["ship_to"]} ||  #{element["weight_oz"]} ||  #{element["weight_lbs"]} ||  #{element["length"]} ||  #{element["height"]} ||  #{element["width"]} ||  #{element["service"]} ||  #{element["tracking"]}"
    log.info "  --------------------------------------------------------------------------- "
    step "Order Details - Set Ship-From to #{element["ship_from"]}"
    step "Order Details - Set Ship-To address to #{element["ship_to"]}"
    step "Order Details - Set Ounces to #{element["weight_oz"]}"
    step "Order Details - Set Pounds to #{element["weight_lbs"]}"
    step "Order Details - Set Length to #{element["length"]}"
    step "Order Details - Set Height to #{element["height"]}"
    step "Order Details - Set Width to #{element["width"]}"
    step "Order Details - Set Service to \"#{element["service"]}\""
    step "Order Details - Set Tracking to \"#{element["tracking"]}\""

    10.times do
      @order_details.click_form
      total = @order_details.total
      if total.eql? element["total"]
        results[index] = total.eql? element["total"]
        break
      else
        results[index] = total.eql? element["total"]
      end
    end
    total = @order_details.total

    expected_total_amount = element["total"]

    5.times do
      orders.details.click_form
      sleep 1
      actual = orders.details.total
      orders.details.click_form
      orders.details.click_form
      sleep 1
      break if actual.eql? expected_total_amount
    end

    log.info "  --------------------------------------------------------------------------- "
    log.info "  Test #{index} #{(results[index])?"Passed":"Failed"}"
    log.info "  --------------------------------------------------------------------------- "

    actual = orders.details.total
    actual.should == expected_total_amount

    if actual != expected_total_amount
      raise "| Test #{index} | #{(results[index])?"Passed":"Failed"} |Expectation=#{element["total"]},Actual=#{total}| | #{element["service"]} | #{element["weight_lbs"]} | #{element["weight_oz"]} | #{element["length"]} | #{element["height"]} | #{element["width"]} | #{element["tracking"]} | #{element["total"]} |"
    end
  }

end

