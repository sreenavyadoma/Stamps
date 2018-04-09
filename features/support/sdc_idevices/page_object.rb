# module Stamps
#
#   class MyOrders < SdcPageObject
#     element(:ns_serial_number) { SdcElement.new(browser.text_field(name: 'NsSerial')) }
#     element(:ns_from_zip) { SdcElement.new(browser.text_field(name: 'unauthFromZip')) }
#     element(:remember_me, required: true) { SdcChooser.new(
#         browser.span(:id, 'checkbox-1026-displayEl'),
#         browser.div(css: '[class*=remember-username-checkbox]'),
#         'class', 'checked') }
#
#     page_url(required: true) { "https://print.stamps.com/webpostage/default2.aspx" }
#   end
#
#
#
#
#
#
#   class TestPage < SdcPageObject
#
#     element(:first_name) { SdcElement.new(browser.text_field(id: 'new_user_first_name')) }
#     element(:last_name) { SdcElement.new(browser.text_field(id: 'new_user_last_name')) }
#     element(:email_address) { SdcElement.new(browser.text_field(id: 'new_user_email')) }
#     element(:email_address_confirm)  { SdcElement.new(browser.text_field(id: 'new_user_email_confirm')) }
#     element(:country) { SdcElement.new(browser.select(id: 'new_user_country'))}
#     element(:occupation) { SdcElement.new(browser.text_field(id: 'new_user_occupation')) }
#     element(:submit) { SdcElement.new(browser.button(id: 'new_user_submit')) }
#
#     element(:cars) { SdcElement.new(browser.checkbox(id: 'new_user_interests_cars'))}
#     element(:div_index) { |indx| SdcElement.new(browser.div(index: indx)) }
#     element(:first_element) { SdcElement.new(browser.div) }
#     elements(:all_elements) { browser.divs }
#     element(:first_sub_element) { div_index(1).div }
#     elements(:all_sub_elements) { div_index(1).divs }
#
#     page_url { 'http://watir.com/examples/forms_with_input_elements.html' }
#
#   end
#
#
#   class ResultPage < SdcPageObject
#
#     element(:message) { browser.div(id: 'messages').div(index: -1) }
#
#     def success?
#       message.text == 'submit'
#     end
#   end
# end