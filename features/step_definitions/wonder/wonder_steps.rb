Then /^Sign-in to (\w+) webpostage as (.*)\/(.*) using (\w+)$/ do |environment, username, password, browser|
  @browser = Stamps::Test.setup browser
  print_postage.sign_in_page.visit(environment).sign_in_with_credentials username, password
end

Then /^Expect webpostage user (.*) is signed-in$/ do |username|
  signed_in_username = print_postage.navbar.username_text_field.text
  log.info "Expectation webpostage user #{username} is signed-in - Test #{(signed_in_username.include?username)?"Passed.":"Failed"}"
  signed_in_username.should eql username
end

