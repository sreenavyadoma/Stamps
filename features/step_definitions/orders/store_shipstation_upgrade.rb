
#Looking for shipstation? dialog Step Definitions
Then /^[Ee]xpect [Oo]rders [Pp]age [Ll]ooking for [Ss]hip[Ss]tation[?] dialog is present$/ do
  expect(stamps.orders.market_place.shipstation.looking_for_shipstation.title.present?).to be(true), "Looking for ShipStation? dialog does not present"
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog header contain (.*)$/ do |str|
  expect(stamps.orders.market_place.shipstation.looking_for_shipstation.header.text).to eql(str), "Text does not match with UI in Looking for ShipStation? dialog "
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog [Cc]heckBox is present$/ do
  expect(stamps.orders.market_place.shipstation.looking_for_shipstation.check_box.present?).to be(true), "Check box does not present in Looking for ShipStation? dialog"
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog [Ss]ign in to [Ss]hip[Ss]tation [Bb]utton exists$/ do
  expect(stamps.orders.market_place.shipstation.looking_for_shipstation.sign_in_to_shipstation.present?).to be(true), "'Sign in to shipstation' Button does not present in Looking for ShipStation? dialog"
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog Close [Bb]utton exists$/ do
  expect(stamps.orders.market_place.shipstation.looking_for_shipstation.close.present?).to be(true), "'Close' Button does not present in Looking for ShipStation? dialog"
end

Then /^[Cc]heck [Ll]ooking for [Ss]hip[Ss]tation[?] dialog don't show checkbox$/ do
  stamps.orders.market_place.shipstation.looking_for_shipstation.check_box.click
end

Then /^[Uu]n-[Cc]heck [Ll]ooking for [Ss]hip[Ss]tation[?] dialog don't show [Cc]heckbox$/ do
  stamps.orders.market_place.shipstation.looking_for_shipstation.check_box.click
end

Then /^[Cc]lick on [Ss]ign in to [Ss]hip[Ss]tation [Bb]utton$/ do
  stamps.orders.market_place.shipstation.looking_for_shipstation.sign_in_to_shipstation.click
end

Then /^[Cc]lick on [Cc]lose [Bb]utton$/ do
  stamps.orders.market_place.shipstation.looking_for_shipstation.close.click
end


# Add advanced shipping features dialog Step Definitions
Then /^[Ee]xpect [Oo]rders [Pp]age [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog is present$/ do
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.dialog_header.present?).to be(true), "Add Advanced Shipping Features! dialog does not present"
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog [Ss]hip[Ss]tation logo exists$/ do
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.shipstation_logo.present?).to be(true), "Shipstation logo does not exists"
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog body contain (.*)$/ do |str|
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.body.text).to eql(str), "Add Advanced Shipping Features! dialog does not contain text"
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog content heading contain (.*)$/ do |str|
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.content_heading.text).to eql(str), "Add Advanced Shipping Features! dialog does not contain or match content heading text"
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog contain all content list$/ do
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.li_1.text).to eql("Includes mobile app for shipping on the go")
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.li_2.text).to eql("Connect to 100+ marketplaces and channels")
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.li_3.text).to eql("One-stop rate shopping saves you money")
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.li_4.text).to eql("Real-time geo-tracking for all your shipments in one place")
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.li_5.text).to eql("Self-service returns portal for your customers")
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.li_6.text).to eql("Best-in-class shipping automation tools")
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog [Aa]dd [Ff]eatures [Nn]ow Button exists$/ do
  expect(stamps.orders.market_place.shipstation.add_advanced_shipping_feature.add_features_now.present?).to be(true), "Add Advanced Shipping Features! dialog does not have 'Add features now' button"
end

Then /^[Cc]lick on [Aa]dd [Ff]eatures [Nn]ow [Bb]utton$/ do
  stamps.orders.market_place.shipstation.add_advanced_shipping_feature.add_features_now.click
end

# Activate your new features dialog Step Definitions
Then /^[Ee]xpect [Oo]rders [Pp]age [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog is present$/ do
  stamps.orders.market_place.shipstation.activate_your_new_features.header.wait_until_present(7)
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.header.present?).to be(true), "Activate Your New Features dialog does not present"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog body contain (.*)$/ do |str|
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.body.text).to include(str), "Activate Your New Features dialog does not have matching text"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Uu]sername exists$/ do
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.username.present?).to be(true), "Activate Your New Features dialog does not have Username textbox"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword exists$/ do
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.password.present?).to be(true), "Activate Your New Features dialog does not have Password textbox"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions checkbox exists$/ do
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.check_box.present?).to be(true), "Activate Your New Features dialog does not have checkbox"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Ll]ogin Button exists$/ do
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.login.present?).to be(true), "Activate Your New Features dialog does not have Login Button"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Uu]sername is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.username.text).to eql(test_param[:username]), "Username does not correct"
end

Then /^[Ss]et in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword to (?:random value|(.*))$/ do |str|
  stamps.orders.market_place.shipstation.activate_your_new_features.password.set(test_param[:password]=(str.nil?)?"pass111":str)
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.password.text).to eql(test_param[:password]), "Password does not correct"
end

Then /^[Cc]heck in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions checkbox$/ do
  stamps.orders.market_place.shipstation.activate_your_new_features.check_box.click
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions is checked$/ do
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.check_box.checked?).to be(false), "Checkbox does not checked"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword tooltip to be (.*)$/ do |str|
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.password_tooltip.text).to eql(str), "Activate Your New Features dialog Password toltip does not match or present"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions tooltip to be (.*)$/ do |str|
  expect(stamps.orders.market_place.shipstation.activate_your_new_features.terms_tooltip.text).to eql(str), "Activate Your New Features dialog Terms toltip does not match or present"
end

Then /^[Cc]lick on [Ll]ogin Button$/ do
  stamps.orders.market_place.shipstation.activate_your_new_features.login.click
end

Then /^[Cc]lose [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog$/ do
  stamps.orders.market_place.shipstation.activate_your_new_features.close_x.click
end
