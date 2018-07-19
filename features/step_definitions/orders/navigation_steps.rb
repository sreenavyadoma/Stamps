Then /^save balance amount$/ do
  TestData.hash[:old_balance] = SdcWebsite.navigation.balance.amount.text_value.dollar_amount_str.to_f
end

Then /^on add funds modal, purchase 10$/ do
  SdcWebsite.navigation.balance.add_funds.buy_10.select
end

Then /^on add funds modal, purchase 25$/ do
  pending
  #TestData.hash[:old_balance] = stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  SdcWebsite.navigation.balance.add_funds.buy_25.select
end

Then /^on add funds modal, purchase 50$/ do
  pending
  #TestData.hash[:old_balance] = stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  SdcWebsite.navigation.balance.add_funds.buy_50.select
end

Then /^on add funds modal, purchase 100$/ do
  pending
  #TestData.hash[:old_balance] = stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  SdcWebsite.navigation.balance.add_funds.buy_100.select
end

Then /^on add funds modal, purchase other amount (\d+)$/ do |amount|
  pending
  #TestData.hash[:old_balance] = stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  SdcWebsite.navigation.balance.add_funds.buy_other.select
  SdcWebsite.navigation.balance.add_funds.buy_other_amount.set(amount)
end

Then /^on add funds modal, click purchase button$/ do
  SdcWebsite.navigation.balance.add_funds.purchase.click
  expect(SdcWebsite.navigation.balance.confirm_transaction.title).to be_present, "Confirm Transaction modal is not present!"
end

Then /^buy mail confirm transction: click confirm button$/ do
  SdcWebsite.navigation.balance.confirm_transaction.confirm.click
  SdcWebsite.navigation.balance.processing_purchase.title.wait_while_present(timeout: 15)
  expect(SdcWebsite.navigation.balance.transaction_complete.title).to be_present, "Transaction Complete modal is not present!"
end

Then /^buy mail confirm purchase: expect text area contains, please confirm your \$(.*) postage purchase.$/ do |amount|
  expect(SdcWebsite.navigation.balance.confirm_transaction.body.text_value).to eql("Please confirm that you wish to add $#{amount} to your account balance. Once you click the Confirm button, the amount will be added to your account and cannot be refunded.")
end

Then /^buy mail purchase approved: expect text area contains, your fund request for \$(.*) has been approved.$/ do |amount|
  expect(SdcWebsite.navigation.balance.transaction_complete.body.text_value).to eql("Your fund request for $#{amount} has been approved.")
end

Then /^buy mail purchase approved: click ok button$/ do
  SdcWebsite.navigation.balance.transaction_complete.ok_btn.click
  expect(SdcWebsite.navigation.balance.transaction_complete.title).not_to be_present, "Transaction Complete modal is still present!"
end

Then /^buy mail: expect customer balance increased by \$(\d+)$/ do |purchase_amount|
  expect((SdcWebsite.navigation.balance.amount.text_value.dollar_amount_str.to_f - TestData.hash[:old_balance].to_f).round(2)).to eql(purchase_amount.to_f.round(2))
end