Given /^Expect Single Order Form (.+) text box data error tooltip to be \"(.+)\"$/ do |field, value|
  @international_ship_to = @single_order_form.international
  case field.downcase
    when "phone"
      phone_text_box = @international_ship_to.phone
      browser_error_message = phone_text_box.attribute_value "data-errorqtip"
      browser_error_message.should include value
      log "Error message is #{browser_error_message}"
    when "email"
      email_text_box = @single_order_form.email
      browser_error_message = email_text_box.attribute_value "data-errorqtip"
      browser_error_message.should include value
      log "Error message is #{browser_error_message}"
    when "length"
      length_text_box = @single_order_form.length
      browser_error_message = length_text_box.attribute_value "data-errorqtip"
      browser_error_message.should include value
      log "Error message is #{browser_error_message}"
    when "width"
      width_text_box = @single_order_form.width
      browser_error_message = width_text_box.attribute_value "data-errorqtip"
      browser_error_message.should include value
      log "Error message is #{browser_error_message}"
    when "height"
      height_text_box = @single_order_form.height
      browser_error_message = height_text_box.attribute_value "data-errorqtip"
      browser_error_message.should include value
      log "Error message is #{browser_error_message}"
    else
      raise "Illegal Argument Exception.  #{field} is not a valid field. - Expect Validation Error #{field} to be #{value}"
  end

end
