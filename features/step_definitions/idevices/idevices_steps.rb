
Then /^load mail sign-in page$/ do
  #SdcIDriver.driver.get "https://print.stamps.com/Webpostage/default2.aspx?"
  SdcIDriver.driver.get "https://printext.qasc.stamps.com/webpostage/default2.aspx#"
  @serial_number = SdcIDriver.driver.find_element(id: "sdc-mainpanel-nsserialtextfield-inputEl")
  SdcLog.info "@serial_number.tag_name}=#{@serial_number.tag_name}"
  @mail_settings = SdcIDriver.driver.find_element(css: "[class*=sdc-icon-settings]")
  SdcLog.info "@mail_settings.tag_name}=#{@mail_settings.tag_name}"
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
  #SdcLog.info "@mail_settings.tag_name}=#{@mail_settings.tag_name}"
  #@sign_in_button.click
  sleep(2)
end

Then /^navigates to a simple url$/ do

  MyOrders.browser = SdcTest.driver
  MyOrders.visit

  Orders.visit
  Orders.order_details.service.select "FCM"

  #browser.span(:id, 'checkbox-1026-displayEl')
  #browser.div(css: '[class*=remember-username-checkbox]')
  #'class'
  #'checked'

  orders = MyOrders.new
  orders.ns_serial_number.set 'S12345'
  orders.ns_from_zip.set '90502'
  orders.remember_me.check
  orders.remember_me.checked?
  orders.remember_me.uncheck



  TestPage.browser = SdcTest.driver
  test_page = TestPage.visit
  test_page.methods
  expect(test_page.title).to eql 'Forms with input elements'
end

Then /^navigates to a dynamic url$/ do
  class TestPage2 < PageObject
    page_url { |val| "http://watir.com/examples/#{val}" }
  end

  TestPage2.visit('forms_with_input_elements.html')
  expect(TestPage2.browser.title).to eql 'Forms with input elements'



end
# ext.qacc
# ext.qasc
# .testing
#
# webpostage/default2.aspx
# orders

Then /^enters text into a textfield based on value it is set equal to$/ do
  var = TestPage.new
  #var.first_name = 'Rob'
  #puts var.first_name
  var.first_name.send_keys 'Roger'
  puts var.first_name.text_value
  var.first_name.click
  element = var.browser.driver.find_element(id: 'new_user_email')
  element
  expect(var.first_name.value).to be == 'Roger'
end

Then /^selects value from dropdown based on value it is set equal to$/ do
  TestPage.new.country.select 'Sweden'
  expect(TestPage.new.country.value).to be == '3'
end

# Update Radio Set
Then /^selects radio button based being set equal to a true value$/ do
  TestPage.visit.identity.click
  expect(TestPage.new.identity).to be_set
end

Then /^selects checkbox based on being set equal to a true value$/ do
  TestPage.visit.cars.check
  expect(TestPage.new.cars).to be_set
end

Then /^deselects checkbox based on being set equal to a true value$/ do
  TestPage.new.cars.uncheck
  expect(TestPage.new.cars).to_not be_set
end

Then /^clicks button based on being set equal to a true value$/ do
  TestPage.visit.submit.click
  expect(ResultPage.new.success?).to be true
end


Then /^throws custom error message in waits$/ do
  test_page = TestPage.visit

  message = /^timed out after 0\.5 seconds, waiting for true condition on #<TestPage url=\S+ title=/
  expect { test_page.wait_until(timeout: 0.5) { false } }.to raise_exception Watir::Wait::TimeoutError, message
end