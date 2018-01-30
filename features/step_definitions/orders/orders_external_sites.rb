
Then /^[Ee]xpect [Ee]xternal [Ss]ite [Ss]quare [Ee]mail text box is present$/ do
  step "pause for 3 seconds"
  expect(stamps.orders.external_sites.square_com.email.present?).to be(true), "External site square login page not available"
end

Then /^[Ss]et [Ee]xternal [Ss]ite [Ss]quare [Ee]mail is (.*)$/ do |str|
  stamps.orders.external_sites.square_com.email.set(str)
end

Then /^[Ss]et [Ee]xternal [Ss]ite [Ss]quare [Pp]assword is (.*)$/ do |pwd|
  stamps.orders.external_sites.square_com.password.set(pwd)
end

Then /^[Cc]lick [Ee]xternal [Ss]ite [Ss]quare [Ss]ign [Ii]n [Bb]utton$/ do
  stamps.orders.external_sites.square_com.sign_in.click
end