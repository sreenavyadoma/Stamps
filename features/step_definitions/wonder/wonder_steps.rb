Then /^Sign-in to (\w+) webpostage as (.*)\/(.*) using (\w+)$/ do |environment, username, password, browser|
  @browser = Stamps.setup browser
  print_postage.sign_in_page.visit environment
  print_postage.sign_in_page.sign_in username, password
end


Then /^Expect webpostage user (.*) is signed-in$/ do |username|
  signed_in_username = print_postage.navigation.username.text
  log "Expect webpostage user #{username} is signed-in - Test #{(signed_in_username.include?username)?"Passed.":"Failed"}"
  signed_in_username.should eql username
end

