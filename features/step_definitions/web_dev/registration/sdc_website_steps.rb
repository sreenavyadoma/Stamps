Then /^(?:|[Ii] )[Ll]oad(?:|ed) (?:|the default |default )[Rr]egistration(?: [Pp]age| [Tt]heme (.*))$/ do |str|
  if str.nil?
    step "I launch default browser"
    step "load SDC Website"
    step "click on Get Started"
  else
    TestData.store[:registration_theme]=str
    step "I launch default browser"
    registration.load_theme(TestData.store[:registration_theme])
  end
end

Then /^(?:|[Ii] )[Ll]oad(?:|ed) SDC Website$/ do
   sdc_website.load_page
end

Then /^[Cc]lick on [Gg]et [Ss]tarted$/ do
    sdc_website.get_started_btn.wait_until_present(5)
    expect(sdc_website.get_started_btn.present?).to be(true), "GET STARTED button is not preset"
    sdc_website.get_started_btn.click
    registration.bread_crumbs.bread_crumb_profile.wait_until_present(10)
    expect(SdcTest.driver.url).to include('profile')
end

