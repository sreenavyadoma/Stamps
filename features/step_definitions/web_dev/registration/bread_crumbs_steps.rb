Then /^[Ee]xpect [Pp]rofile bread crumbs is (.*)$/ do |str|
  registration.bread_crumbs.bread_crumb_profile.wait_until_present(7)
  expect(registration.bread_crumbs.bread_crumb_profile.text.strip).to eql(str), "Bread crumb Profile does not exist "
end

Then /^[Ee]xpect [Mm]embership bread crumbs is (.*)$/ do |str|
  registration.bread_crumbs.bread_crumb_membership.wait_until_present(7)
  expect(registration.bread_crumbs.bread_crumb_membership.text.strip).to eql(str), "Bread crumb Membership does not exist "
end

#Then /^[Ee]xpect Registration bread crumbs is Special Offer$/ do
#  registration.bread_crumbs.bread_crumb_special_offer.wait_until_present(7)
#  expect(registration.bread_crumbs.bread_crumb_special_offer.text).to eql("Special Offer"), "Bread crumb Special Offer does not exist"
#end

