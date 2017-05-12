Then /^(?:|[Ii] )[Ll]oad(?:|ed) (?:|the default |default )[Rr]egistration(?: [Pp]age| [Tt]heme (.*))$/ do |str|
  if str.nil?
    test_param[:registration_theme] = str
    step "I launch default browser"
    registration.load_theme(test_param[:registration_theme])
  else
    step "I launch default browser"
    step "load SDC Website"
    step "click on Get Started"
  end
end

Then /^(?:|[Ii] )[Ll]oad(?:|ed) SDC Website$/ do
  step "I launch default browser"
  sdc_website.load_page
end

Then /^[Cc]lick on [Gg]et [Ss]tarted$/ do
  sdc_website.get_started
  expect(config.browser.url).to include('profile')
end

