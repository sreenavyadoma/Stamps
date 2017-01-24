Then /^Shopify Store: Set Shopify Domain to (.*)$/ do |url|
  #logger.step "Shopify Store: Set Shopify Domain to #{url}"
  raise "Shopify Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.shopify_domain.set url
end

Then /^Shopify Store: Connect using Email (.*) and password (.*)$/ do |username, password|
  #logger.step "Shopify Store: Connect using Email #{username} and password #{password}"
  raise "Shopify Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @shopify_result = @store.connect

  case @shopify_result
    when Orders::Stores::ShopifySettings
      @store_settings = @shopify_result
    when Orders::Stores::ShopifyPage
      @shopify_page = @shopify_result
      @shopify_page.username.set username
      @shopify_page.password.set password
      @store_settings = @shopify_page.landing_page
    else
      raise "Unable to connect Shopify Store, something went wrong.  Check your test."
  end
end

Then /^Shopify Store: Reconnect$/ do
  #logger.step "Shopify Store: Reconnect"
  raise "Shopify Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings = @store.reconnect
end





