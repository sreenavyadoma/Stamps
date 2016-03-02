Then /^Volusion New Customers: Click continue$/ do
  @volusion_registration = volusion.continue
end


Then /^Volusion New to Stamps: Set email address to (.*)$/ do |email|
  @volusion_email = email
  @volusion_registration.email.set @volusion_email
end

Then /^Volusion New to Stamps: Type email address again$/ do
  @volusion_registration.email_again.set @volusion_email
end

Then /^Volusion New to Stamps: Set new password to (.*)$/ do |password|
  @volusion_password = password
  @volusion_registration.password.set @volusion_password
end

Then /^Volusion New to Stamps: Type new password again$/ do
  @volusion_registration.password_again.set @volusion_password
end

Then /^Volusion New to Stamps: Check receive newsletter$/ do
  @volusion_registration.receive_newsletter.check
end

Then /^Volusion New to Stamps: Uncheck receive newsletter$/ do
  @volusion_registration.receive_newsletter.uncheck
end

Then /^Volusion New to Stamps: Click Continue$/ do
  @volusion_address = @volusion_registration.continue
end

Then /^Volusion Address: Set First Name to (.*)$/ do |value|
  @volusion_address.first_name.set value
end

Then /^Volusion Address: Set Last Name to (.*)$/ do |value|
  @volusion_address.last_name.set value
end

Then /^Volusion Address: Set Company to (.*)$/ do |value|
  @volusion_address.company.set value
end

Then /^Volusion Address: Set Address 1 to (.*)$/ do |value|
  @volusion_address.address_1.set value
end

Then /^Volusion Address: Set Address 2 to (.*)$/ do |value|
  @volusion_address.address_2.set value
end

Then /^Volusion Address: Set City to (.*)$/ do |value|
  @volusion_address.city.set value
end

Then /^Volusion Address: Set Country to (.*)$/ do |value|
  @volusion_address.country.select value
end

Then /^Volusion Address: Set State to (.*)$/ do |value|
  @volusion_address.state.set value
end

Then /^Volusion Address: Set Zip Code to (.*)$/ do |value|
  @volusion_address.zip_code.set value
end

Then /^Volusion Address: Set Phone Number to (.*)$/ do |value|
  @volusion_address.phone.set value
end

Then /^Volusion Address: Type of address - residential$/ do
  @volusion_address.type_of_address.residential
end

Then /^Volusion Address: Type of address - business$/ do
  @volusion_address.type_of_address.business
end

Then /^Volusion Address: Type of address - Yes$/ do
  @volusion_address.billing_address.yes
end

Then /^Volusion Address: Type of address - No$/ do
  @volusion_address.billing_address.no
end

Then /^Volusion Address: Click Continue$/ do
  @account_page = @volusion_address.continue
end

Then /^Volusion Account: Click My Account$/ do
  @account_page.my_account
end

Then /^Volusion Account: Click CATEGORY ONE$/ do
  @category_one = @account_page.category_one
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
  @volusion_cart = @volusion_product.cart
end

Then /^Volusion Cart: Proceed to checkout$/ do
  @checkout_page = @volusion_cart.proceed_to_checkout
end

Then /^Volusion Checkout: Select My Saved Billing Address (.*)$/ do |address|
  @checkout_page.select address
end

Then /^Volusion Checkout: Set Address Type to Residential$/ do
  @checkout_page.address_type.residential
end


Then /^Volusion Checkout: Set Address Type to Business$/ do
  @checkout_page.address_type.business
end


Then /^Volusion Checkout: Place Order$/ do
  @checkout_page.place_order
end



