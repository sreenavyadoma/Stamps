Given /^I launch browser$/ do
  log.info "I launch browser"
  @browser = Stamps::Test.setup
end

Then /^Teardown$/ do
  log.info "Teardown"
  Stamps::Test.teardown
end

Given /^I launch browser (\w+)$/ do |browser|
  log.info "Step: I launch browser #{browser}"
  if browser.downcase.include? "default"
    @browser = Stamps::Test.setup
  else
    @browser = Stamps::Test.setup browser
  end
end

=begin
Then /^BROWSER:  CTRL-O$/ do
  @browser.send_keys [:control, 'o']
  @browser.send_keys [:control, 'o']
  open_file = Windows::OpenFile.new
  log.info open_file.present?
  log.info open_file.present?
  log.info open_file.present?
  open_file.file_name "C:\Github\Stamps\config\data\import.csv"

  open_file.file_name "C:\Github\Stamps\config\data\import.csv"

end

Then /^BROWSER:  Zoom Out$/ do
  @browser.send_keys [:control, '-']
end

Then /^BROWSER:  Zoom In$/ do
  @browser.send_keys [:control, '+']
end
=end

