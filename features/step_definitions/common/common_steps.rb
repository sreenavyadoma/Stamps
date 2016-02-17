Given /^I launch browser (\w+)$/ do |browser|
  log.info "Step: I launch browser #{browser}"
  @browser = Stamps::Test.setup browser
end

Given /^I launch default browser$/ do
  log.info "Step: I launch default browser"
  @browser = Stamps::Test.setup
  print_window = Windows::PrintWindow.new :ie
  #@browser.send_keys [:control, 'p']
  #sleep 2
  print_window.print
  #sleep 2

end