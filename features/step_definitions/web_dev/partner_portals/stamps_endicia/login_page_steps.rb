Then /^Stamps Endicia Stuff$/ do

  SdcEndiciaPP.visit
  login_page = SdcEndiciaPP.new().login_page
  login_page.email.username set 'test'
  expect(SdcEndiciaLanding.username).to be_present

  expect(SdcEndiciaLanding.username).to be_present
  SdcEndiciaLanding.password.set 'blah'

end

Then /^PP: A user navigates to the login page$/do
  SdcEndiciaPP.visit
end


