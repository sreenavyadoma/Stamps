
Then /^Volusion: Visit Page$/ do
  step "I launched default browser" if config.browser.nil?
  volusion.visit
end

Then /^Volusion Login:  New Customers - Continue$/ do
  @volusion_reg = volusion.continue
end

Then /^Volusion Login:  Set Email Address to (.*)$/ do |email|
  volusion.email.set email
end

Then /^Volusion Login:  Set Password to (.*)$/ do |password|
  volusion.password.set password
end

Then /^Volusion New to Mail Stamps: Set email address to (.*)$/ do |email|
  @volusion_email = (email.downcase == 'random')? "#{helper.random_alpha_numeric}@mailinator.com":email
  @volusion_reg.email.set @volusion_email
end

Then /^Volusion New to Mail Stamps: Type email address again$/ do
  @volusion_reg.email_again.set @volusion_email
end

Then /^Volusion New to Mail Stamps: Set new password to (.*)$/ do |password|
  @volusion_password = password
  @volusion_reg.password.set @volusion_password
end

Then /^Volusion New to Mail Stamps: Type new password again$/ do
  @volusion_reg.password_again.set @volusion_password
end

Then /^Volusion New to Mail Stamps: Check receive newsletter$/ do
  @volusion_reg.receive_newsletter.check
end

Then /^Volusion New to Mail Stamps: Uncheck receive newsletter$/ do
  @volusion_reg.receive_newsletter.uncheck
end

Then /^Volusion New to Mail Stamps: Click Continue$/ do
  @volusion_shipping_address = @volusion_reg.continue
end

Then /^Volusion Shipping Address: Set First Name to (.*)$/ do |value|
  @volusion_shipping_address.first_name.set(value.downcase == 'random')?(helper.random_full_name):value
end

Then /^Volusion Shipping Address: Set Last Name to (.*)$/ do |value|
  @volusion_shipping_address.last_name.set(value.downcase == 'random')?(helper.random_full_name):value
end

Then /^Volusion Shipping Address: Set Company to (.*)$/ do |value|
  @volusion_shipping_address.company.set(value.downcase == 'random')?(helper.random_full_name):value
end

Then /^Volusion Shipping Address: Set Address 1 to (.*)$/ do |value|
  @volusion_shipping_address.address_1.set(value)
end

Then /^Volusion Shipping Address: Set Address 2 to (.*)$/ do |value|
  @volusion_shipping_address.address_2.set(value)
end

Then /^Volusion Shipping Address: Set City to (.*)$/ do |value|
  @volusion_shipping_address.city.set(value)
end

Then /^Volusion Shipping Address: Set Country to (.*)$/ do |value|
  @volusion_shipping_address.country.select(value)
end

Then /^Volusion Shipping Address: Set State to (.*)$/ do |value|
  @volusion_shipping_address.state.select(value)
end

Then /^Volusion Shipping Address: Set Zip Code to (.*)$/ do |value|
  @volusion_shipping_address.zip_code.set(value)
end

Then /^Volusion Shipping Address: Set Phone Number to (.*)$/ do |value|
  @volusion_shipping_address.phone_number.set(value.downcase == 'random')?(helper.random_phone):value
end

Then /^Volusion Shipping Address: Type of address - residential$/ do
  @volusion_shipping_address.type_of_address.residential
end

Then /^Volusion Shipping Address: Type of address - business$/ do
  @volusion_shipping_address.type_of_address.business
end

Then /^Volusion Shipping Address: Type of address - Yes$/ do
  @volusion_shipping_address.is_this_your_billing_address.yes
end

Then /^Volusion Shipping Address: Type of address - No$/ do
  @volusion_shipping_address.is_this_your_billing_address.no
end

Then /^Volusion Shipping Address: Click Continue$/ do
  @my_account_page = @volusion_shipping_address.continue
end

Then /^Volusion Account: Click My Account$/ do
  @my_account_page.my_account
end

Then /^Volusion Account: Click CATEGORY ONE$/ do
  @category_one = @my_account_page.category_one
end

Then /^Volusion Category One: Click SAMPLE PRODUCT ONE$/ do
  @volusion_product = @category_one.sample_product_one
end

Then /^Volusion Product: Set Quantity to (\d+)$/ do |qty|
  @volusion_product.qty qty
end

Then /^Volusion Product: Click ADD TO BAG$/ do
  @volusion_product.add_to_bag
end

Then /^Volusion Product: Visit Cart$/ do
  @volusion_cart = @my_account_page.cart
end

Then /^Volusion Cart: Proceed to checkout$/ do
  @checkout_page = @volusion_cart.proceed_to_checkout
end

Then /^Volusion Checkout: Select My Saved Billing Address (.*)$/ do |address|
  @checkout_page.my_saved_billing_address address
end

Then /^Volusion Checkout: Set Address Type to Residential$/ do
  @checkout_page.address_type.residential
end

Then /^Volusion Checkout: Set Address Type to Business$/ do
  @checkout_page.address_type.business
end

Then /^Volusion Checkout: Select Shipping Method - USPS Priority Mail Flat Rate Envelope$/ do
  @checkout_page.shipping_method.select "USPS Priority Mail Flat Rate Envelope"
end

Then /^Volusion Checkout: Select Payment Method - Cash$/ do
  @checkout_page.payment_method.select "Cash"
end

Then /^Volusion Checkout: Place Order$/ do
  @volusion_order_number = @checkout_page.place_order
end

Then /^Volusion Account: Sign out$/ do
  @volusion_login_page = @my_account_page.log_out
end



