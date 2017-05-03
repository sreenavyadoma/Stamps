Then /^(?:|[Ii] )[Ll]oad(?:|ed) (?:|default )[Rr]egistration(?: [Pp]age| [Tt]heme (.*))$/ do |str|
  test_param[:registration_theme] = str
  step "I launch default browser"
  registration.load_theme(test_param[:registration_theme])
end

Then /^(?:|[Ii] )[Ll]oad(?:|ed) SDC Website$/ do
  step "I launch default browser"
  sdc_website.load_page
end

Then /^[Cc]lick on [Gg]et [Ss]tarted$/ do
  registration = sdc_website.get_started
end