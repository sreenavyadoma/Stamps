Then /^Print Postage: Select Stamps$/ do
  step "Select Print Postage Print On Stamps"
end

Then /^Print Postage: Select Shipping Label 5 x 8$/ do
  step "Select Print Postage Print On Shipping Label - 5 ½” x 8 ½”"
end

Then /^Print Postage: Select Shipping Label 8 x 11$/ do
  step "Select Print Postage Print On Shipping Label - 8 ½” x 11” Paper"
end

Then /^Print Postage: Select Shipping Label 4 x 6$/ do
  step "Select Print Postage Print On Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
end

Then /^Print Postage: Select Envelope - #10$/ do
  step "Select Print Postage Print On Envelope - #10, 4 ⅛” x 9 ½”"
end

Then /^Print Postage: Select Envelope - #6$/ do
  step "Select Print Postage Print On Envelope - #6, 3 ⅝” x 6 ½”"
end

Then /^Print Postage: Select Envelope - #7$/ do
  step "Select Print Postage Print On Envelope - #7, 3 ⅞” x 7 ½”"
end

Then /^Print Postage: Select Envelope - #9$/ do
  step "Select Print Postage Print On Envelope - #9, 3 ⅞” x 8 ⅞”"
end

Then /^Print Postage: Select Envelope - #11$/ do
  step "Select Print Postage Print On Envelope - #11, 4 ½” x 10 ⅜”"
end

Then /^Print Postage: Select Envelope - #12$/ do
  step "Select Print Postage Print On Envelope - #12, 4 ¾” x 11”"
end

Then /^Print Postage: Select Envelope - #A2$/ do
  step "Select Print Postage Print On Envelope - #A2, 4 ⅜” x 5 ¾”"
end

Then /^Print Postage: Select Envelope - #A9$/ do
  step "Select Print Postage Print On Envelope - #A9, 5 ¾” x 8 ¾”"
end

Then /^Print Postage: Select Print On (.*)/ do |media|
  log.info "Select Print Postage Print On #{media}"

  postage.print_on.select media

  if media.include? 'Stamps'
    @stamps = postage.stamps
  elsif media.include? 'Shipping Label'
    @shipping_label = postage.shipping_label
    log.info "Preview image: #{(@shipping_label.form_view.preview_image.present?)?"YES": "NO"}"
  elsif media.include? 'Envelope'
    @envelope = postage.envelope
    log.info "Preview image: #{(@envelope.form_view.preview_image.present?)?"YES": "NO"}"
  elsif media.include? 'Certified Mail'
    @certified_mail = postage.certified_mail
  end
end

Then /^Print Postage: Expect Print Media Tooltip to be (.*)$/ do |selection|
  postage.print_on.tooltip selection
end

Then /^Print Postage: Expect Print Media (.*) to be disabled$/ do |selection|
  postage.print_on.disabled? selection
end

Then /^Print Postage: Expect Print Media (.*) to be enabled$/ do |selection|
  postage.print_on.enabled? selection
end

Then /^Print Postage: Set Service to \"(.*)\"/ do |service|
  log.info "Step: Set Print Postage Service to: \n #{service}"
  @postage_form.service.select service
end

Then /^Print Postage: Set Ounces to (.*)/ do |ounces|
  log.info "Step: Set Print Postage Ounces to: \n #{ounces}"
  @postage_form.weight.ounces.set ounces
end

Then /^Print Postage: Set Pounds to (.*)/ do |pounds|
  log.info "Step: Set Print Postage Pounds to: \n #{pounds}"
  @postage_form.weight.pounds.set pounds
end

Then /^Print Postage: Set Ship-To address to$/ do |table|
  ship_to = PrintHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Set Print Postage Form Ship-To address to \n#{ship_to}"
  step "Set Print Postage Form Ship-To address to #{ship_to}"
end

Then /^Print Postage: Set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "Set Order Details Ship-To address to zone 1 through 4"
end

Then /^Print Postage: Set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "Set Order Details Ship-To address to zone 5 through 8"
end

#todo-elie Fix ship_from
Then /^Print Postage: Set Ship-From to (.*)/ do |value|
  log.info "Step: Set Print Postage Ship-From to: \n #{value}"
  @postage_form.ship_from.select value
end

Then /^Print Postage: Set Ship-To country to (.*)/ do |country|
  log.info "Step: Set Print Postage Country to: \n #{country}"
  @postage_form.country.select country

end

Then /^Print Postage: Expect Ship-To address to be (.*)/ do |address|

end
