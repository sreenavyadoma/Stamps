#to-do all step def. by kaushal

#Looking for shipstation? dialog Step Definitions
Then /^[Ee]xpect [Oo]rders [Pp]age [Ll]ooking for [Ss]hip[Ss]tation[?] dialog is present$/ do
#todo
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog header contain (.*)$/ do |str|
#todo
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog [Cc]heckBox is present$/ do
#todo
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog [Ss]ign in to [Ss]hip[Ss]tation [Bb]utton exists$/ do
#todo
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog Close [Bb]utton exists$/ do
  pending
end

Then /^[Cc]heck [Ll]ooking for [Ss]hip[Ss]tation[?] dialog don't show checkbox$/ do
#todo
end

Then /^[Uu]n-[Cc]heck [Ll]ooking for [Ss]hip[Ss]tation[?] dialog don't show [Cc]heckbox$/ do
#todo
end

Then /^[Cc]lick on [Ss]ign in to [Ss]hip[Ss]tation [Bb]utton$/ do
#todo
end

Then /^[Cc]lick on [Cc]lose [Bb]utton$/ do
  stamps.orders.stores.shipstation.add_advanced_shipping_feature.dialog_header.present?
end


# Add advanced shipping features dialog Step Definitions
Then /^[Ee]xpect [Oo]rders [Pp]age [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog is present$/ do
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).add_advanced_shipping_feature.dialog_header.present?).to be(true), "Add Advanced Shipping Features! dialog does not present"

end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog [Ss]hip[Ss]tation logo exists$/ do
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).add_advanced_shipping_feature.shipstation_logo.present?).to be(true), "Shipstation logo does not exists"
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog body contain (.*)$/ do |str|
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).add_advanced_shipping_feature.body.text).to eql(str), "Add Advanced Shipping Features! dialog does not contain text"
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog [Aa]dd [Ff]eatures [Nn]ow Button exists$/ do
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).add_advanced_shipping_feature.add_features_now.present?).to be(true), "Add Advanced Shipping Features! dialog does not have 'Add features now' button"
end

Then /^[Cc]lick on [Aa]dd [Ff]eatures [Nn]ow [Bb]utton$/ do
  stamps.orders.marketplace.dataview.store_window(:opencart).add_advanced_shipping_feature.add_features_now.click
end

# Activate your new features dialog Step Definitions
Then /^[Ee]xpect [Oo]rders [Pp]age [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog is present$/ do
  stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.header.wait_until_present(7)
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.header.present?).to be(true), "Activate Your New Features dialog does not present"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog body contain (.*)$/ do |str|
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.body.text).to eql(str), "Activate Your New Features dialog does not have matching text"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Uu]sername exists$/ do
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.username.present?).to be(true), "Activate Your New Features dialog does not have Username textbox"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword exists$/ do
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.password.present?).to be(true), "Activate Your New Features dialog does not have Password textbox"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions checkbox exists$/ do
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.check_box.present?).to be(true), "Activate Your New Features dialog does not have checkbox"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Ll]ogin Button exists$/ do
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.login.present?).to be(true), "Activate Your New Features dialog does not have Login Button"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Uu]sername is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.username.text).to eql(test_param[:username]), "Username does not correct"
end

Then /^[Ss]et in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword to (?:random value|(.*))$/ do |str|
  stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.password.set(test_param[:password]=(str.nil?)?"pass111":str)
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.password.text).to eql(test_param[:password]), "Password does not correct"
end

Then /^[Cc]heck in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions checkbox$/ do
  stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.check_box.click
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions is checked$/ do
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.check_box.checked?).to be(false), "Checkbox does not checked"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword tooltip to be (.*)$/ do |str|
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.password_tooltip.text).to eql(str), "Activate Your New Features dialog Password toltip does not match or present"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions tooltip to be (.*)$/ do |str|
  expect(stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.terms_tooltip.text).to eql(str), "Activate Your New Features dialog Terms toltip does not match or present"
end

Then /^[Cc]lick on [Ll]ogin Button$/ do
  stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.login.click
end

Then /^[Cc]lose [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog$/ do
  stamps.orders.marketplace.dataview.store_window(:opencart).activate_your_new_features.close_x.click
end
