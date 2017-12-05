Then /^[Ee]xpect [Ss]quare [Ss]tore modal present$/ do
  expect(stamps.orders.marketplace.square_store.present?).to be(true), "Sqaure Store is not present"
end

Then /^[Ee]xpect [Ss]quare logo present$/ do
  expect(stamps.orders.marketplace.square_store.store_icon.present?).to be(true), "Sqaure logo is not present"
end

Then /^[Ee]xpect [Ss]quare [Aa]uthorize [Bb]utton present$/ do
  expect(stamps.orders.marketplace.square_store.authorize_btn.present?).to be(true), "Sqaure Authorize Button is not present"
end