=begin

Then /^Sign-in to (\w+) webpostage as (.*)\/(.*) using (\w+)$/ do |environment, username, password, browser|
  @browser = TestHelper.setup browser if browser.nil?
  web_apps.mail.sign_in.visit(environment).sign_in username, password
end

Then /^Expect webpostage user (.*) is signed-in$/ do |username|
  signed_in_username = web_apps.mail.navigation_bar.username.text
  logger.step "Expectation webpostage user #{username} is signed-in - Test #{(signed_in_username.include?username)?"Passed.":"Failed"}"
  signed_in_username.should eql username
end

=end
