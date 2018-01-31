Then /^[Ee]xpect [Ss]quare [Ss]tore modal present$/ do
  expect(stamps.orders.marketplace.square.present?).to be(true), "Sqaure Store is not present"
end

Then /^[Ee]xpect [Ss]quare logo present$/ do
  expect(stamps.orders.marketplace.square.store_icon.present?).to be(true), "Sqaure logo is not present"
end

Then /^[Ee]xpect [Ss]quare [Aa]uthorize [Bb]utton present$/ do
  expect(stamps.orders.marketplace.square.authorize_btn.present?).to be(true), "Sqaure Authorize Button is not present"
end

Then /^[Cc]lick [Ss]quare [Aa]uthorize [Bb]utton$/ do
  stamps.orders.marketplace.square.authorize_btn.click
end

