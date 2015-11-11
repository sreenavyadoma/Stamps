Then /^Expect USPS Terms modal appears$/ do
  log "Test: Expect USPS Terms modal appears"
  actual = batch.toolbar.usps_intl_terms.is_usps_terms_modal_present
  log_expectation_eql "Expect USPS Terms modal appears", true, actual
  actual.should eql true

end

Then /^Click Cancel on USPS Terms modal$/ do
  log "Test: Click Cancel on USPS Terms modal"
  batch.toolbar.usps_intl_terms.click_cancel_button

end

Then /^Click I Agree on USPS Terms modal$/ do
  log "Test: Click I Agree on USPS Terms modal"
  batch.toolbar.usps_intl_terms.click_i_agree_button

end

Then /^Check Do Not Show Again checkbox in USPS Terms modal$/ do
  log "Test: Check Do Not Show Again checkbox in USPS Terms modal"
  sleep 2
  batch.toolbar.usps_intl_terms.check_dont_show_again_checkbox
  sleep 2
end
