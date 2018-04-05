Then /^Stamps Endicia Stuff$/ do
  SdcEndiciaLanding.visit
  expect(SdcEndiciaLanding.username).to be_present

  expect(SdcEndiciaLanding.username).to be_present
  SdcEndiciaLanding.password.set 'blah'
end