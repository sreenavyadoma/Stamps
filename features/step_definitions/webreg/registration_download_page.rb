Then /^Registration Download Page: Verify download page displays (.*)$/ do |expectation|
  raise "Registration Download Page is not present. Order was not placed." unless registration.profile.membership.download_page.present?
  actual_value = ""
  begin
    actual_value = registration.profile.membership.download_page.text
    10.times {logger.info actual_value}
    logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  rescue Exception => e
    logger.error e.backtrace.join "\n"
    actual_value = e.message
  end
  expectation.should eql actual_value
end