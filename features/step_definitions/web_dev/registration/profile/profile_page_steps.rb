
Then /^[Ss]et [Pp]rofile [Ee]mail to (.*)$/ do |str|
  registration.profile.email.set str
end

Then /^[Ss]et [Pp]rofile username to (.*)$/ do |str|
  registration.profile.username.set str
end

Then /^[Ss]et [Pp]rofile Password to (.*)$/ do |str|
  registration.profile.password.set str
end
