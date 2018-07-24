
Then /^navigate to contacts$/ do

end

Then /^navigate to orders$/ do

end

Then /^navigate to mail$/ do

end

Then /^save balance amount$/ do
  TestData.hash[:old_balance] = SdcWebsite.navigation.balance.amount.text_value.dollar_amount_str.to_f
end

Then /^on add funds modal, purchase 10$/ do
  SdcWebsite.navigation.balance.add_funds.buy_10.select
end

Then /^on add funds modal, purchase 25$/ do
  pending
  SdcWebsite.navigation.balance.add_funds.buy_25.select
end

Then /^on add funds modal, purchase 50$/ do
  pending
  SdcWebsite.navigation.balance.add_funds.buy_50.select
end

Then /^on add funds modal, purchase 100$/ do
  pending
  SdcWebsite.navigation.balance.add_funds.buy_100.select
end

Then /^on add funds modal, purchase other amount (\d+)$/ do |amount|
  pending
  SdcWebsite.navigation.balance.add_funds.buy_other.select
  SdcWebsite.navigation.balance.add_funds.buy_other_amount.set(amount)
end

Then /^on add funds modal, click purchase button$/ do
  SdcWebsite.navigation.balance.add_funds.purchase.click
  expect(SdcWebsite.navigation.balance.confirm_transaction.title).to be_present
end

Then /^buy mail confirm transction: click confirm button$/ do
  pending
  SdcWebsite.navigation.balance.confirm_transaction.confirm.click
  SdcWebsite.navigation.balance.processing_purchase.title.wait_while_present(timeout: 15)
  expect(SdcWebsite.navigation.balance.transaction_complete.title).to be_present
end

Then /^buy mail confirm purchase: expect text area contains, please confirm your \$(.*) postage purchase.$/ do |amount|
  str = "Please confirm that you wish to add $#{amount} to your account balance"
  result = SdcWebsite.navigation.balance.confirm_transaction.body.text_value
  expect(result).to include(str)
end

Then /^buy mail purchase approved: expect text area contains, your fund request for \$(.*) has been approved.$/ do |amount|
  str = "Your fund request for $#{amount} has been approved."
  result = SdcWebsite.navigation.balance.transaction_complete.body.text_value
  expect(result).to eql(str)
end

Then /^buy mail purchase approved: click ok button$/ do
  SdcWebsite.navigation.balance.transaction_complete.ok_btn.click
  expect(SdcWebsite.navigation.balance.transaction_complete.title).not_to be_present
end

Then /^buy mail: expect customer balance increased by \$(\d+)$/ do |str|
  str = str.to_f.round(2)
  value = SdcWebsite.navigation.balance.amount.text_value.dollar_amount_str.to_f
  result = (value - TestData.hash[:old_balance].to_f).round(2)
  expect(result).to eql(str)
end