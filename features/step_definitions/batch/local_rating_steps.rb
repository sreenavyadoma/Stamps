Then /^Verify Local Rating$/ do |table|
  log.info "Step: Verify Local Rating..."
  #results_file = "local_rating_results.csv"
  @single_order_form = batch.order_details
  parameter_array = table.hashes
  results = Hash.new

  parameter_array.each_with_index { |element, index|
    step "Set Order Details Form Ship-From to #{element["ship_from"]}"
    step "Set Order Details Form Ship-To address to #{element["ship_to"]}"
    step "Set Order Details Form Ounces to #{element["weight_oz"]}"
    step "Set Order Details Form Pounds to #{element["weight_lbs"]}"
    step "Set Order Details Form Length to #{element["length"]}"
    step "Set Order Details Form Height to #{element["height"]}"
    step "Set Order Details Form Width to #{element["width"]}"
    step "Set Order Details Form Service to \"#{element["service"]}\""
    step "Set Order Details Form Tracking to #{element["tracking"]}"

    10.times { |counter|
      @single_order_form.click_form
      total = @single_order_form.total
      if total.eql? element["total"]
        results[index] = total.eql? element["total"]
        break
      else
        results[index] = total.eql? element["total"]
      end
    }
    total = @single_order_form.total

    log.info "| Test #{index} | #{(results[index])?"Passed":"Failed"} |Expectation=#{element["total"]},Actual=#{total}| | #{element["service"]} | #{element["weight_lbs"]} | #{element["weight_oz"]} | #{element["length"]} | #{element["height"]} | #{element["width"]} | #{element["tracking"]} | #{element["total"]} |"


    expected_total_amount = element["total"]

    5.times { |counter|
      batch.order_details.click_form
      sleep 1
      actual = batch.order_details.total
      batch.order_details.click_form
      log_expectation_eql "#{counter}. Total Cost", expected_total_amount, actual
      batch.order_details.click_form
      sleep 1
      break if actual.eql? expected_total_amount
    }
    actual = batch.order_details.total
    actual.should == expected_total_amount

    if actual != expected_total_amount
      raise "| Test #{index} | #{(results[index])?"Passed":"Failed"} |Expectation=#{element["total"]},Actual=#{total}| | #{element["service"]} | #{element["weight_lbs"]} | #{element["weight_oz"]} | #{element["length"]} | #{element["height"]} | #{element["width"]} | #{element["tracking"]} | #{element["total"]} |"
    end
  }

end

