
Then /^[Ss]et [Pp]rofile [Ee]mail to (.*)$/ do |str|
  registration.profile.email.wait_until_present(10)
  registration.profile.email.set str
end

Then /^[Ss]et [Pp]rofile username to (.*)$/ do |str|
  registration.profile.account_username.set str
end

Then /^[Ss]et [Pp]rofile Password to (.*)$/ do |str|
  registration.profile.account_password.set str
end

