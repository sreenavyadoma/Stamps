Then /^click mail statusbar print (?:postage|label|stamps|envelope)$/ do
  SdcMail.statusbar.print.click
  expect(SdcMail.modals.print.title).to be_present
end
