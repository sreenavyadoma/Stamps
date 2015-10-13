Then /^Verify Local Rating$/ do |table|
  @single_order_form = batch.single_order_form
  parameter_array = table.hashes
  results = Hash.new

  CSV.open("local_rating_results.csv", "wb") do |csv|
    log "| test_result | ship_from | ship_to | service | weight_lbs | weight_oz | length | height | width | tracking | total |"
    csv << ["test_number", "ship_from", "ship_to", "service", "weight_lbs", "weight_oz", "length", "height", "width", "tracking", "total"]
    parameter_array.each_with_index { |element, index|
      step "Set single-order form Ship-From to #{element["ship_from"]}"
      step "Set single-order form Ship-To address to #{element["ship_to"]}"
      step "Set single-order form Service to \"#{element["service"]}\""
      step "Set single-order form Ounces to #{element["weight_oz"]}"
      step "Set single-order form Pounds to #{element["weight_lbs"]}"
      step "Set single-order form Length to #{element["length"]}"
      step "Set single-order form Height to #{element["height"]}"
      step "Set single-order form Width to #{element["width"]}"
      step "Set single-order form Tracking to #{element["tracking"]}"
      #step "Expect single-order form Total to be $#{element["total"]} |"

      10.times { |counter|
        total = @single_order_form.total
        if total.eql? element["total"]
          results[index] = total.eql? element["total"]
          break
        else
          results[index] = total.eql? element["total"]
        end
      }
      total = @single_order_form.total

      log "| #{index} | #{(results[index])?"Passed":"Failed"} |Expectation=#{element["total"]},Actual=#{total}| | ##{index} | |#{element["ship_from"]} | #{element["ship_to"]} | #{element["service"]} | #{element["weight_lbs"]} | #{element["weight_oz"]} | #{element["length"]} | #{element["height"]} | #{element["width"]} | #{element["tracking"]} | #{element["total"]} |"

      csv << [index, (results[index])?"Passed":"Failed", "Expectation=#{element["total"]},Actual=#{total}", element["ship_from"], element["ship_to"], element["service"], element["weight_lbs"], element["weight_oz"], element["length"], element["height"], element["width"], element["tracking"], element["total"]]


    }
  end

end

