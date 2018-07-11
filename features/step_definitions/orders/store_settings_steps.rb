Then /^set store settings store nickname to (.*)$/ do |str|

  pending
  #nickname = (str.downcase.include?('random') ? TestHelper.rand_alpha_numeric : str)
  # stamps.orders.marketplace.store_settings.store_nickname.set(TestData.hash[:store_nickname] = nickname)
end

Then /^select store settings shipping service to ([\w \/]+)$/ do |str|

  pending
  #expect(stamps.orders.marketplace.store_settings.shipping_service.select(str)).to include(str)
end

Then /^select store settings requested service to ([\w \/]+)$/ do |str|

  pending
  #stamps.orders.marketplace.store_settings.requested_service.set(str)
end

Then /^expect store settings (\w+) modal is present$/ do |store_name|

  pending
  #expect(stamps.orders.marketplace.store_settings.window_title.text).to include("#{store_name} Settings")
end

Then /^expect store settings modal is present$/ do

  pending
  #step "pause for 20 seconds"
  # expect(stamps.orders.marketplace.store_settings.window_title.text).to eql("Settings")
end

Then /^[Aa]dd store service Mapping (\d+), Requested Services (.*), Shipping service (.*)$/ do |mapping_number, requested_services, shipping_service|

  pending
  #step "add store service Mapping #{mapping_number}"
  # step "set store service Mapping #{mapping_number} Requested Service to #{requested_services}"
  # step "set store service Mapping #{mapping_number} Shipping Service to #{shipping_service}"
end

Then /^[Aa]dd store service Mapping (\d+)$/ do |mapping_number|

  pending
  #stamps.orders.marketplace.store_settings.service_mapping_list.mapping_number(mapping_number.to_i)
end

Then /^[Ss]et store service Mapping (\d+) Requested Service to (.*)$/ do |mapping_number, value|

  pending
  #TestData.hash[:service_mapping_items][mapping_number] = {} unless TestData.hash[:service_mapping_items].has_key?(mapping_number)
  # TestData.hash[:service_mapping_items][mapping_number][:requested_service] = (value.downcase.include?('random') ? TestHelper.rand_alpha_numeric : value)
  # stamps.orders.marketplace.store_settings.service_mapping_list.mapping_number(mapping_number.to_i).requested_service_mapping.set(TestData.hash[:service_mapping_items][mapping_number][:requested_service])
end

Then /^[Ss]et store service Mapping (\d+) Shipping Service to (.*)$/ do |mapping_number, value|

  pending
  #TestData.hash[:service_mapping_items][mapping_number] = {} unless TestData.hash[:service_mapping_items].has_key?(mapping_number)
  # TestData.hash[:service_mapping_items][mapping_number][:shipping_service] = value
  # expect(stamps.orders.marketplace.store_settings.service_mapping_list.mapping_number(mapping_number.to_i).shipping_service_mapping.select(TestData.hash[:service_mapping_items][mapping_number][:shipping_service])).to include(TestData.hash[:service_mapping_items][mapping_number][:shipping_service])
end


Then /^[Aa]dd new store service mapping$/ do

  pending
  #@store_settings.add_new_service_mapping.click
end

Then /^[Ss]et store service Mapping (\d+), Requested Services (.*), Shipping service (.*)$/ do |item_number, requested_services, shipping_service|
  #StampsTest.log.step "Store Settings: Set Requested Services to random #{requested_services}"

  pending
  #raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  # service_mapping_item = @store_settings.service_mapping.item item_number.to_i
  # service_mapping_item.requested_services.set(requested_services.downcase.include? 'random') ? TestHelper.rand_alpha_numeric(min: 4, max: 20) : requested_services
  # service_mapping_item.shipping_Service.select shipping_service
end

Then /^Store Settings: Set Automatically Import New Orders to checked$/ do
  #StampsTest.log.step "Store Settings: Set Automatically Import New Orders to checked"

  pending
  #raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  # @store_settings.automatically_import_new_web_apps.orders.check
end

Then /^Store Settings: Uncheck Automatically Import New Orders$/ do
  #StampsTest.log.step "Store Settings: Uncheck Automatically Import New Orders"

  pending
  #raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  # sleep(0.35)
  # @store_settings.automatically_import_new_web_apps.orders.uncheck
end

Then /^Store Settings: Save$/ do

  pending
  #raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  # @store_settings.save
end


#### Settings Modal ####

Then /^[Ee]xpect [Ss]quare [Ss]ettings [Dd]ialog is present$/ do

  pending
  #
  # expect(stamps.orders.marketplace.square.settings.window_title.present?).to be(true), "Sqaure Settings dialog is not present"
end

Then /^[Cc]heck Settings dialog store import new orders$/ do

  pending
  #stamps.orders.marketplace.store_settings.auto_import_new_orders.check
end

Then /^[Ee]xpect Settings dialog store import new orders is checked$/ do

  pending
  #expect(stamps.orders.marketplace.store_settings.auto_import_new_orders.checked?).to be(true), "Automatically import new orders is NOT checked"
end

Then /^[Uu]ncheck Settings dialog store import new orders$/ do

  pending
  #stamps.orders.marketplace.store_settings.auto_import_new_orders.uncheck
end

Then /^[Ee]xpect Settings dialog store import new orders is Unchecked$/ do

  pending
  #expect(stamps.orders.marketplace.store_settings.auto_import_new_orders.checked?).not_to be(true), "Automatically import new orders is NOT unchecked"
end

Then /^[Cc]heck Store Settings dialog Automatically add new products to the [Pp]roducts page$/ do

  pending
  #stamps.orders.marketplace.store_settings.auto_add_to_products_page.check
end

Then /^[Uu]ncheck Store Settings dialog Automatically add new products to the [Pp]roducts page$/ do

  pending
  #stamps.orders.marketplace.store_settings.auto_add_to_products_page.uncheck
end

Then /^[Ee]xpect Store Settings dialog Automatically add new products to the [Pp]roducts page is checked$/ do

  pending
  #expect(stamps.orders.marketplace.store_settings.auto_add_to_products_page.checked?).to be(true), "Automatically add new products to the Products page is NOT checked"
end

Then /^[Ee]xpect Store Settings dialog Automatically add new products to the [Pp]roducts page is unchecked$/ do

  pending
  #expect(stamps.orders.marketplace.store_settings.auto_add_to_products_page.checked?).not_to be(true), "Automatically add new products to the Products page is NOT unchecked"
end

Then /^[Ss]elect [Uu]niquely [Ii]dentify [Pp]roducts by SKU$/ do
  pending
  ##The default selected radio button on this page is sku, and in its initial default state the class name for sku is different than when it is selected by the user, making the StampsRadio validation fail.
  #Therefore, product_listing_name needs to be selected first so that the when sku is selected, its class name can be used for validation.
  # stamps.orders.marketplace.store_settings.product_listing_name.select
  # stamps.orders.marketplace.store_settings.sku.select
end

Then /^[Ss]elect [Uu]niquely [Ii]dentify [Pp]roducts by [Pp]roduct [Ll]isting [Nn]ame$/ do
  pending
  #stamps.orders.marketplace.store_settings.product_listing_name.select
end

Then /^[Cc]lick [Ss]ave in [Ss]tore [Ss]ettings modal$/ do
  pending
  #stamps.orders.marketplace.store_settings.save.click
end


Then /^[Ee]xpect [Mm]arketplace [Mm]odal is [Pp]resent$/ do

  pending
  #expect(stamps.orders.modals.orders_settings_modal).to be_present, "Marketplace modal is NOT present"
end

Then /^Marketplace: Expect store selection modal contains (.*)$/ do |expectation|

  pending
  #stamps.orders.modals.orders_settings_modal.stores_tab
  # expect(stamps.orders.marketplace.add_your_store_modal.contains(expectation)).to eql(expectation)
end

Then /^[Ss]earch [Mm]arketplace for [Ss]tore [Nn]ame (.*)$/ do |str|

  pending
  #step "validate store name #{str}"
  # step "expect Marketplace modal is present"
  # stamps.orders.marketplace.add_your_store_modal.search_by_name.set(TestData.hash[:store_name]=str)
end

Then /^[Cc]onnect [Mm]arketplace [Ss]tore (.*)$/ do |str|

  pending
  #step "validate store name #{str}"
  # step "expect Marketplace modal is present"
  # expect(stamps.orders.marketplace.add_your_store_modal.dataview.add_store(str)).to eql("Connect Your #{str} Store")
end

Then /^[Cc]click on [Mm]arketplace [Ss]tore (.*)$/ do |str|

end

Then /^[Aa]dd [Mm]arketplace [Ss]hip[Ss]tation [Ss]tore (.*)$/ do |str|

  pending
  #step "validate store name #{str}"
  # step "expect Marketplace modal is present"
  # expect(stamps.orders.marketplace.add_your_store_modal.dataview.add_advanced_feature(str)).to eql("Add Advanced Shipping Features!")
end

Then /^validate store name (.*)$/ do |str|

  pending
  #expect(data_for(:supported_stores, {}).keys.to_a).to include(str.downcase)
end


Then /^[Ee]xpect [Mm]arketplace [Dd]ataview [Cc]ount is (greater|less|equal) (?:than|to) (\d+)$/ do |operator, count|

  pending
  #step "expect Marketplace modal is present"
  # case(operator)
  #   when /greater/
  #     expect(stamps.orders.marketplace.add_your_store_modal.dataview.store_count).to be > count.to_i
  #   when /less/
  #     expect(stamps.orders.marketplace.add_your_store_modal.dataview.store_count).to be < count.to_i
  #   when /equal/
  #     expect(stamps.orders.marketplace.add_your_store_modal.dataview.store_count).to eql count.to_i
  #   else
  #     # ignore
  # end
end

Then /^[Ss]elect PayPal on Marketplace modal$/ do

  pending
  #
  # step "expect PayPal is on Marketplace modal"
  # stamps.orders.marketplace.add_your_store_modal.paypal.click
end

Then /^[Ee]xpect PayPal is on Marketplace modal$/ do

  pending
  #expect(stamps.orders.marketplace.add_your_store_modal.paypal_store).to be_present, "PayPal is not on Marketplace modal"
end

Then /^Marketplace: Select Big Commerce$/ do

  pending
  #@store=stamps.orders.marketplace.add_your_store_modal.big_commerce
end

Then /^Marketplace: Select Amazon$/ do

  pending
  #stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  #@store=stamps.orders.marketplace.add_your_store_modal.amazon
end

Then /^Marketplace: Select Volusion$/ do

  pending
  #stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  #@store=stamps.orders.marketplace.add_your_store_modal.volusion
end

Then /^Marketplace: Select Rakuten$/ do

  pending
  #stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  #@store=stamps.orders.marketplace.add_your_store_modal.rakuten
end

Then /^Marketplace: Select Etsy$/ do

  pending
  #stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  #@store=stamps.orders.marketplace.add_your_store_modal.etsy
end

Then /^Marketplace: Select Ebay$/ do

  pending
  #stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  #@store=stamps.orders.marketplace.add_your_store_modal.ebay
end

Then /^Marketplace: Select Shopify$/ do

  pending
  #stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  #@store=stamps.orders.marketplace.add_your_store_modal.shopify
end

Then /^Marketplace: Select 3dcart$/ do

  pending
  #stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  #@store=stamps.orders.marketplace.add_your_store_modal.three_d_cart
end

Then /^Marketplace: Select Yahoo$/ do

  pending
  #stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  #@store=stamps.orders.marketplace.add_your_store_modal.yahoo
end

Then /^Marketplace: Close Modal$/ do

  pending
  #stamps.orders.marketplace.add_your_store_modal.close
end

Then /^[Ee]xpect [Mm]arketplace [Mm]odal [Rr]equires [Ff]ree [Uu]pgrade [Mm]essage [Pp]resent in (.*)$/ do |str|

  pending
  #expect(stamps.orders.marketplace.add_your_store_modal.dataview.requires_upgrade_msg(str)).to be_present, " Requires Free Upgrade Message is NOT present"
end

Then /^[Ee]xpect [Mm]arketplace [Mm]odal [Aa]vailable in [Ss]hipStation [Mm]essage [Pp]resent in (.*)$/ do |str|

  pending
  #expect(stamps.orders.marketplace.add_your_store_modal.dataview.available_shipstation_msg(str)).to be_present, " Available in ShipStation Message is NOT present"
end


#Looking for shipstation? dialog Step Definitions
Then /^[Ee]xpect [Oo]rders [Pp]age [Ll]ooking for [Ss]hip[Ss]tation[?] dialog is present$/ do
  pending
  #expect(stamps.orders.marketplace.shipstation.looking_for_shipstation.title.present?).to be(true), "Looking for ShipStation? dialog does not present"
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog header contain (.*)$/ do |str|
  pending
  #expect(stamps.orders.marketplace.shipstation.looking_for_shipstation.header.text).to eql(str), "Text does not match with UI in Looking for ShipStation? dialog "
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog [Cc]heckBox is present$/ do
  pending
  # expect(stamps.orders.marketplace.shipstation.looking_for_shipstation.checkbox.present?).to be(true), "Check box does not present in Looking for ShipStation? dialog"
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog [Ss]ign in to [Ss]hip[Ss]tation [Bb]utton exists$/ do
  pending
  # expect(stamps.orders.marketplace.shipstation.looking_for_shipstation.sign_in_to_shipstation.present?).to be(true), "'Sign in to shipstation' Button does not present in Looking for ShipStation? dialog"
end

Then /^[Ee]xpect in [Ll]ooking for [Ss]hip[Ss]tation[?] dialog Close [Bb]utton exists$/ do
  pending
  # expect(stamps.orders.marketplace.shipstation.looking_for_shipstation.close.present?).to be(true), "'Close' Button does not present in Looking for ShipStation? dialog"
end

Then /^[Cc]heck [Ll]ooking for [Ss]hip[Ss]tation[?] dialog don't show checkbox$/ do
  pending
  #  stamps.orders.marketplace.shipstation.looking_for_shipstation.checkbox.click
end

Then /^[Uu]n-[Cc]heck [Ll]ooking for [Ss]hip[Ss]tation[?] dialog don't show [Cc]heckbox$/ do
  pending
  #  stamps.orders.marketplace.shipstation.looking_for_shipstation.checkbox.click
end

Then /^[Cc]lick on [Ss]ign in to [Ss]hip[Ss]tation [Bb]utton$/ do
  pending
  # stamps.orders.marketplace.shipstation.looking_for_shipstation.sign_in_to_shipstation.click
end

Then /^[Cc]lick on [Cc]lose [Bb]utton$/ do
  pending
  #  stamps.orders.marketplace.shipstation.looking_for_shipstation.close.click
end


# Add advanced shipping features dialog Step Definitions
Then /^[Ee]xpect [Oo]rders [Pp]age [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog is present$/ do
  pending
  # expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.dialog_header.present?).to be(true), "Add Advanced Shipping Features! dialog does not present"
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog [Ss]hip[Ss]tation logo exists$/ do
  pending
  # expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.shipstation_logo.present?).to be(true), "Shipstation logo does not exists"
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog body contain (.*)$/ do |str|
  pending
  # expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.body.text).to eql(str), "Add Advanced Shipping Features! dialog does not contain text"
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog content heading contain (.*)$/ do |str|
  pending
  # expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.content_heading.text).to eql(str), "Add Advanced Shipping Features! dialog does not contain or match content heading text"
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog contain all content list$/ do
  pending
  # expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.li_1.text).to eql("Includes core app for shipping on the go")
  # expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.li_2.text).to eql("Connect to 75+ marketplaces and channels")
  # expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.li_3.text).to eql("One-stop rate shopping saves you money")
  # expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.li_4.text).to eql("Real-time geo-tracking for all your shipments in one place")
  # expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.li_5.text).to eql("Self-service returns portal for your customers")
  # expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.li_6.text).to eql("Best-in-class shipping automation tools")
end

Then /^[Ee]xpect in [Aa]dd [Aa]dvanced [Ss]hipping [Ff]eatures[!] dialog [Aa]dd [Ff]eatures [Nn]ow Button exists$/ do
  pending
  #expect(stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.add_features_now.present?).to be(true), "Add Advanced Shipping Features! dialog does not have 'Add features now' button"
end

Then /^[Cc]lick on [Aa]dd [Ff]eatures [Nn]ow [Bb]utton$/ do
  pending
  # stamps.orders.marketplace.shipstation.add_advanced_shipping_feature.add_features_now.click
end

# Activate your new features dialog Step Definitions
Then /^[Ee]xpect [Oo]rders [Pp]age [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog is present$/ do
  pending
  #  stamps.orders.marketplace.shipstation.activate_your_new_features.header.wait_until_present(7)
  # expect(stamps.orders.marketplace.shipstation.activate_your_new_features.header.present?).to be(true), "Activate Your New Features dialog does not present"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog body contain (.*)$/ do |str|
  pending
  # expect(stamps.orders.marketplace.shipstation.activate_your_new_features.body.text).to include(str), "Activate Your New Features dialog does not have matching text"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Uu]sername exists$/ do
  pending
  #  expect(stamps.orders.marketplace.shipstation.activate_your_new_features.username.present?).to be(true), "Activate Your New Features dialog does not have Username textbox"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword exists$/ do
  pending
  # expect(stamps.orders.marketplace.shipstation.activate_your_new_features.password.present?).to be(true), "Activate Your New Features dialog does not have Password textbox"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions checkbox exists$/ do
  pending
  # expect(stamps.orders.marketplace.shipstation.activate_your_new_features.checkbox.present?).to be(true), "Activate Your New Features dialog does not have checkbox"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Ll]ogin Button exists$/ do
  pending
  # expect(stamps.orders.marketplace.shipstation.activate_your_new_features.login.present?).to be(true), "Activate Your New Features dialog does not have Login Button"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Uu]sername is (?:correct|(.*))$/ do |str|
  pending
  # expect(stamps.orders.marketplace.shipstation.activate_your_new_features.username.text).to eql(TestData.hash[:username]), "Username does not correct"
end

Then /^[Ss]et in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword to (?:random value|(.*))$/ do |str|
  pending
  #  stamps.orders.marketplace.shipstation.activate_your_new_features.password.set(TestData.hash[:password]=(str.nil?)?"pass111":str)
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword is (?:correct|(.*))$/ do |str|
  pending
  # expect(stamps.orders.marketplace.shipstation.activate_your_new_features.password.text).to eql(TestData.hash[:password]), "Password does not correct"
end

Then /^[Cc]heck in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions checkbox$/ do
  pending
  # stamps.orders.marketplace.shipstation.activate_your_new_features.checkbox.click
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions is checked$/ do
  pending
  # expect(stamps.orders.marketplace.shipstation.activate_your_new_features.checkbox.checked?).to be(false), "Checkbox does not checked"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Pp]assword tooltip to be (.*)$/ do |str|
  pending
  # expect(stamps.orders.marketplace.shipstation.activate_your_new_features.password_tooltip.text).to eql(str), "Activate Your New Features dialog Password toltip does not match or present"
end

Then /^[Ee]xpect in [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog [Tt]erms [Aa]nd [Cc]onditions tooltip to be (.*)$/ do |str|
  pending
  # expect(stamps.orders.marketplace.shipstation.activate_your_new_features.terms_tooltip.text).to eql(str), "Activate Your New Features dialog Terms toltip does not match or present"
end

Then /^[Cc]lick on [Ll]ogin Button$/ do
  pending
  # stamps.orders.marketplace.shipstation.activate_your_new_features.login.click
end

Then /^[Cc]lose [Aa]ctivate [Yy]our [Nn]ew [Ff]eatures dialog$/ do
  pending
  # stamps.orders.marketplace.shipstation.activate_your_new_features.close_x.click
end

















