
Then /^Open Settings Modal$/ do
  log.info "Step: Open Settings Modal"
  @general_settings = orders.toolbar.settings.general_settings
end

Then /^Settings: Check Services$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.services.check
  log.info "Show unavailable service #{(@general_settings.services.checked?)?"checked":"unchecked"}"
end

Then /^Settings:  Uncheck Services$/ do
  step "Open Settings Modal" if @general_settings.nil?

  @general_settings.services.uncheck
  log.info "Show unavailable service #{(@general_settings.services.checked?)?"checked":"unchecked"}"
end

# Set Logoff

Then /^Settings:  Set Logoff to 5 min.$/ do
  step "Settings:  Logoff set 5 min"
end

Then /^Settings:  Set Logoff to 10 min.$/ do
  step "Settings:  Logoff set 10 min"
end

Then /^Settings:  Set Logoff to 15 min.$/ do
  step "Settings:  Logoff set 15 min"
end

Then /^Settings:  Set Logoff to 30 min.$/ do
  step "Settings:  Logoff set 30 min"
end

Then /^Settings:  Set Logoff to 1 hour.$/ do
  step "Settings:  Logoff set 1 hour"
end

Then /^Settings:  Set Logoff to 2 hours.$/ do
  step "Settings:  Logoff set 2 hours"
end

Then /^Settings:  Logoff set (.*)$/ do |logoff|
  step "Open Settings Modal" if @general_settings.nil?
  case logoff.downcase
    when "5 min"
      @general_settings.log_off.five_min
    when "10 min"
      @general_settings.log_off.ten_min
    when "15 min"
      @general_settings.log_off.fifteen_min
    when "30 min"
      @general_settings.log_off.thirty_min
    when "1 hour"
      @general_settings.log_off.one_hour
    when "2 hours"
      @general_settings.log_off.two_hours
    else
      raise "Invalid Logoff Selection -  Settings:  Logoff #{logoff}"
  end
  log.info "Step:  Logoff if the application is inactive for #{@general_settings.log_off.text_box.text}"
end

# Set Postdate

Then /^Settings:  Set Postdate to 12:00 a.m.$/ do
  step "Settings:  Postdate Set 12:00 a.m."
end

Then /^Settings:  Set Postdate to 1:00 a.m.$/ do
  step "Settings:  Postdate Set 1:00 a.m."
end

Then /^Settings:  Set Postdate to 2:00 a.m.$/ do
  step "Settings:  Postdate Set 2:00 a.m."
end

Then /^Settings:  Set Postdate to 3:00 a.m.$/ do
  step "Settings:  Postdate Set 3:00 a.m."
end

Then /^Settings:  Set Postdate to 4:00 a.m.$/ do
  step "Settings:  Postdate Set 4:00 a.m."
end

Then /^Settings:  Set Postdate to 5:00 a.m.$/ do
  step "Settings:  Postdate Set 5:00 a.m."
end

Then /^Settings:  Set Postdate to 6:00 a.m.$/ do
  step "Settings:  Postdate Set 6:00 a.m."
end

Then /^Settings:  Set Postdate to 7:00 a.m.$/ do
  step "Settings:  Postdate Set 7:00 a.m."
end

Then /^Settings:  Set Postdate to 8:00 a.m.$/ do
  step "Settings:  Postdate Set 8:00 a.m."
end

Then /^Settings:  Set Postdate to 9:00 a.m.$/ do
  step "Settings:  Postdate Set 9:00 a.m."
end

Then /^Settings:  Set Postdate to 10:00 a.m.$/ do
  step "Settings:  Postdate Set 10:00 a.m."
end

Then /^Settings:  Set Postdate to 11:00 a.m.$/ do
  step "Settings:  Postdate Set 11:00 a.m."
end

Then /^Settings:  Set Postdate to 12:00 p.m.$/ do
  step "Settings:  Postdate Set 12:00 p.m."
end

Then /^Settings:  Set Postdate to 1:00 p.m.$/ do
  step "Settings:  Postdate Set 1:00 p.m."
end

Then /^Settings:  Set Postdate to 2:00 p.m.$/ do
  step "Settings:  Postdate Set 2:00 p.m."
end

Then /^Settings:  Set Postdate to 3:00 p.m.$/ do
  step "Settings:  Postdate Set 3:00 p.m."
end

Then /^Settings:  Set Postdate to 4:00 p.m.$/ do
  step "Settings:  Postdate Set 4:00 p.m."
end

Then /^Settings:  Set Postdate to 5:00 p.m.$/ do
  step "Settings:  Postdate Set 5:00 p.m."
end

Then /^Settings:  Set Postdate to 6:00 p.m.$/ do
  step "Settings:  Postdate Set 6:00 p.m."
end

Then /^Settings:  Set Postdate to 7:00 p.m.$/ do
  step "Settings:  Postdate Set 7:00 p.m."
end

Then /^Settings:  Set Postdate to 8:00 p.m.$/ do
  step "Settings:  Postdate Set 8:00 p.m."
end

Then /^Settings:  Set Postdate to 9:00 p.m.$/ do
  step "Settings:  Postdate Set 9:00 p.m."
end

Then /^Settings:  Set Postdate to 10:00 p.m.$/ do
  step "Settings:  Postdate Set 10:00 p.m."
end

Then /^Settings:  Set Postdate to 11:00 p.m.$/ do
  step "Settings:  Postdate Set 11:00 p.m."
end

Then /^Settings:  Postdate Set(.*)$/ do |postdate|
  step "Open Settings Modal" if @general_settings.nil?

  case postdate.downcase
    when /12:00 a.m./
      @general_settings.post_date.twelve_am
    when /1:00 a.m./
      @general_settings.post_date.one_am
    when /2:00 a.m./
      @general_settings.post_date.two_am
    when /3:00 a.m./
      @general_settings.post_date.three_am
    when /4:00 a.m./
      @general_settings.post_date.four_am
    when /5:00 a.m./
      @general_settings.post_date.five_am
    when /6:00 a.m./
      @general_settings.post_date.six_am
    when /7:00 a.m./
      @general_settings.post_date.seven_am
    when /8:00 a.m./
      @general_settings.post_date.eight_am
    when /9:00 a.m./
      @general_settings.post_date.nine_am
    when /10:00 a.m./
      @general_settings.post_date.ten_am
    when /11:00 a.m./
      @general_settings.post_date.eleven_am
    when /12:00 p.m./
      @general_settings.post_date.twelve_pm
    when /1:00 p.m./
      @general_settings.post_date.one_pm
    when /2:00 p.m./
      @general_settings.post_date.two_pm
    when /3:00 p.m./
      @general_settings.post_date.three_pm
    when /4:00 p.m./
      @general_settings.post_date.four_pm
    when /5:00 p.m./
      @general_settings.post_date.five_pm
    when /6:00 p.m./
      @general_settings.post_date.six_pm
    when /7:00 p.m./
      @general_settings.post_date.seven_pm
    when /8:00 p.m./
      @general_settings.post_date.eight_pm
    when /9:00 p.m./
      @general_settings.post_date.nine_pm
    when /10:00 p.m./
      @general_settings.post_date.ten_pm
    when /11:00 p.m./
      @general_settings.post_date.eleven_pm
    else
      raise "Invalid Postdate Selection -  Settings:  Postdate #{logoff}"
  end
  log.info "Step:  Postdate mail to next day after #{@general_settings.log_off.text_box.text}"
end




# Expectations
Then /^Settings:  Expect Services Checked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  log.info "Step:  Expect Settings - Show unavailable service Checked"
  log.info "Test #{(@general_settings.services.checked?)?"Passed":"Failed"}"
  @general_settings.services.checked?.should be true
end

Then /^Settings:  Expect Show unavailable service Unchecked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  log.info "Step:  Expect Settings - Show unavailable service Unchecked"
  log.info "Test #{(@general_settings.services.checked?)?"Passed":"Failed"}"
  @general_settings.services.checked?.should be false
end

Then /^Settings:  Expect Logoff is set for 5 min.$/ do
  step "Settings:  Expect Logoff to be 5 min."
end

Then /^Settings:  Expect Logoff is set for 10 min.$/ do
  step "Settings:  Expect Logoff to be 10 min."
end

Then /^Settings:  Expect Logoff is set for 15 min.$/ do
  step "Settings:  Expect Logoff to be 15 min."
end

Then /^Settings:  Expect Logoff is set for 30 min.$/ do
  step "Settings:  Expect Logoff to be 30 min."
end

Then /^Settings:  Expect Logoff is set for 1 hour$/ do
  step "Settings:  Expect Logoff to be 1 hour"
end

Then /^Settings:  Expect Logoff is set for 2 hours$/ do
  step "Settings:  Expect Logoff to be 2 hours"
end

Then /^Settings:  Expect Logoff to be (.*)$/ do |expectation|
  step "Open Settings Modal" if @general_settings.nil?

  log.info "Step:  Settings:  Expect Logoff is set for #{expectation}"
  log.info "Test #{(@general_settings.log_off.text_box.text.include? expectation)?"Passed":"Failed"}"
  @general_settings.log_off.text_box.text.should eql expectation
end

# End Expectations





Then /^$/ do

  log.info @general_settings.print_confirm.checked?
  @general_settings.print_confirm.check
  log.info @general_settings.print_confirm.checked?
  @general_settings.print_confirm.uncheck
  log.info @general_settings.print_confirm.checked?

  log.info @general_settings.usps_terms.checked?
  @general_settings.usps_terms.check
  log.info @general_settings.usps_terms.checked?
  @general_settings.usps_terms.uncheck
  log.info @general_settings.usps_terms.checked?

  log.info @general_settings.contacts.checked?
  @general_settings.contacts.check
  log.info @general_settings.contacts.checked?
  @general_settings.contacts.uncheck
  log.info @general_settings.contacts.checked?

  log.info @general_settings.shipments.checked?
  @general_settings.shipments.check
  log.info @general_settings.shipments.checked?
  @general_settings.shipments.uncheck
  log.info @general_settings.shipments.checked?

  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.zero
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.ten
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.twenty_five
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.fifty
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.one_hundred
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.two_hundred_fifty
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.five_hundred
  log.info @general_settings.postage_balance.text_box.text

  reset_fields = @general_settings.reset_fields
  log.info reset_fields.ship_to_address.checked?
  reset_fields.ship_to_address.uncheck
  log.info reset_fields.ship_to_address.checked?
  reset_fields.ship_to_address.check
  log.info reset_fields.ship_to_address.checked?

  log.info reset_fields.tracking.checked?
  reset_fields.tracking.uncheck
  log.info reset_fields.tracking.checked?
  reset_fields.tracking.check
  log.info reset_fields.tracking.checked?

  log.info reset_fields.extra_services.checked?
  reset_fields.extra_services.uncheck
  log.info reset_fields.extra_services.checked?
  reset_fields.extra_services.check
  log.info reset_fields.extra_services.checked?

  log.info reset_fields.insurance.checked?
  reset_fields.insurance.uncheck
  log.info reset_fields.insurance.checked?
  reset_fields.insurance.check
  log.info reset_fields.insurance.checked?

  log.info reset_fields.reference_numbers.checked?
  reset_fields.reference_numbers.uncheck
  log.info reset_fields.reference_numbers.checked?
  reset_fields.reference_numbers.check
  log.info reset_fields.reference_numbers.checked?

  log.info reset_fields.cost_code.checked?
  reset_fields.cost_code.uncheck
  log.info reset_fields.cost_code.checked?
  reset_fields.cost_code.check
  log.info reset_fields.cost_code.checked?

  log.info reset_fields.customs.checked?
  reset_fields.customs.uncheck
  log.info reset_fields.customs.checked?
  reset_fields.customs.check
  log.info reset_fields.customs.checked?

  log.info reset_fields.quantity.checked?
  reset_fields.quantity.uncheck
  log.info reset_fields.quantity.checked?
  reset_fields.quantity.check
  log.info reset_fields.quantity.checked?

  log.info reset_fields.stamps_amount.checked?
  reset_fields.stamps_amount.uncheck
  log.info reset_fields.stamps_amount.checked?
  reset_fields.stamps_amount.check
  log.info reset_fields.stamps_amount.checked?

  log.info reset_fields.auto_advance_label_position.checked?
  reset_fields.auto_advance_label_position.uncheck
  log.info reset_fields.auto_advance_label_position.checked?
  reset_fields.auto_advance_label_position.check
  log.info reset_fields.auto_advance_label_position.checked?

  reset_fields.weight.lbs.increment 10
  reset_fields.weight.lbs.decrement 5
  reset_fields.weight.lbs.set 2
  reset_fields.weight.lbs.set 7

  reset_fields.weight.oz.increment 10
  reset_fields.weight.oz.decrement 5
  reset_fields.weight.oz.set 2
  reset_fields.weight.oz.set 7

  reset_fields.dimensions.length.increment 10
  reset_fields.dimensions.length.decrement 5
  reset_fields.dimensions.length.set 2
  reset_fields.dimensions.length.set 7

  reset_fields.dimensions.width.increment 10
  reset_fields.dimensions.width.decrement 5
  reset_fields.dimensions.width.set 2
  reset_fields.dimensions.width.set 7

  reset_fields.dimensions.height.increment 10
  reset_fields.dimensions.height.decrement 5
  reset_fields.dimensions.height.set 2
  reset_fields.dimensions.height.set 7

  reset_fields.close
  @general_settings.save

  log.info "rob"
end

Then /^Settings: Save$/ do
  step "Open Settings Modal" if @general_settings.nil?
  log.info "Settings: Save"
  @general_settings.save
  log.info "Settings #{(@general_settings.present?)?"was not saved":"Saved"}"
end

Then /^Settings: Close$/ do
  step "Open Settings Modal" if @general_settings.nil?
  log.info "Settings: Close"
  @general_settings.close
  log.info "Settings #{(@general_settings.present?)?"was not closed":"Closed"}"
end





