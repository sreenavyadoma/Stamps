Then /^[Ee]xpect [Rr]egistration bread crumbs is Profile$/ do
  registration.bread_crumbs.bread_crumb_profile.wait_until_present(7)
  expect(registration.bread_crumbs.bread_crumb_profile.text).to eql("Profile"), "Bread crumb Profile does not exist "
end

Then /^[Ee]xpect Registration bread crumbs is Membership$/ do
  registration.bread_crumbs.bread_crumb_membership.wait_until_present(7)
  expect(registration.bread_crumbs.bread_crumb_membership.text).to eql("Membership"), "Bread crumb Membership does not exist "
end

#Then /^[Ee]xpect Registration bread crumbs is Special Offer$/ do
#  registration.bread_crumbs.bread_crumb_special_offer.wait_until_present(7)
#  expect(registration.bread_crumbs.bread_crumb_special_offer.text).to eql("Special Offer"), "Bread crumb Special Offer does not exist"
#end

