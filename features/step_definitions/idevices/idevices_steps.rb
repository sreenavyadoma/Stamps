
Then /^load mail sign-in page$/ do
  #SdcDeviceDriver.driver.get "https://print.stamps.com/Webpostage/default2.aspx?"
  SdcDeviceDriver.driver.get "https://printext.qasc.stamps.com/webpostage/default2.aspx#"
  @serial_number = SdcDeviceDriver.driver.find_element(id: "sdc-mainpanel-nsserialtextfield-inputEl")
  SdcTest.log.info "@serial_number.tag_name}=#{@serial_number.tag_name}"
  @mail_settings = SdcDeviceDriver.driver.find_element(css: "[class*=sdc-icon-settings]")
  SdcTest.log.info "@mail_settings.tag_name}=#{@mail_settings.tag_name}"
end

Then /^set Stamps serial number to (.+)$/ do |str|
  @serial_number.send_key str
end

Then /^expect Stamps serial number is (.+)$/ do |str|
  sleep(2)
  expect(@serial_number.property "value").to eql str
end



Then /^click Print Sample button$/ do
  #@mail_settings.click
  #@mail_settings.click
  #sleep(2)
  #@sign_in_button = SdcDeviceDriver.driver.find_element(css: "[class*='sdc-regwin-signinbtn']")
  #SdcTest.log.info "@mail_settings.tag_name}=#{@mail_settings.tag_name}"
  #@sign_in_button.click
  sleep(2)
end
