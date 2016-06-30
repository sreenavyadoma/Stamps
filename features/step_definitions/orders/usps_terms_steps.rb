Then /^Expect USPS Terms modal appears$/ do
  logger.info "Expect USPS Terms modal appears"
  actual = orders.toolbar.usps_intl_terms.is_usps_terms_modal_present
  actual.should eql true

end

Then /^Click Cancel on USPS Terms modal$/ do
  logger.info "Click Cancel on USPS Terms modal"
  orders.toolbar.usps_intl_terms.click_cancel_button

end

Then /^Click I Agree on USPS Terms modal$/ do
  logger.info "Click I Agree on USPS Terms modal"
  orders.toolbar.usps_intl_terms.click_i_agree_button

end

Then /^Check Do Not Show Again checkbox in USPS Terms modal$/ do
  logger.info "Check Do Not Show Again checkbox in USPS Terms modal"
  sleep 2
  orders.toolbar.usps_intl_terms.check_dont_show_again_checkbox
  sleep 2
end
