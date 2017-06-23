Then /^(?:|[Ii] )[Ll]oad(?:|ed) (?:|the default |default )[Rr]egistration(?: [Pp]age| [Tt]heme (.*))$/ do |str|
  if str.nil?
    step "I launch default browser"
    step "load SDC Website"
    step "click on Get Started"
  else
    test_param[:registration_theme] = str
    step "I launch default browser"
    registration.load_theme(test_param[:registration_theme])
  end
end

Then /^(?:|[Ii] )[Ll]oad(?:|ed) SDC Website$/ do
 sdc_website.load_page
end

Then /^[Cc]lick on [Gg]et [Ss]tarted$/ do
  sdc_website.get_started
  expect(test_config.browser.url).to include('profile')
end

