Then /^Sign-in to (\w+) webpostage as (.*)\/(.*) using (\w+)$/ do |environment, username, password, browser|
  @browser = Stamps.setup browser
  postage.visit environment
  postage.sign_in username, password
end


Then /^Expect webpostage user (.*) is signed-in$/ do |username|
  signed_in_username = postage.navigation.username.text
  signed_in_username.should eql username
end

