Then /^[Ee]xpect [Rr]egistration bread crumbs is Profile$/ do
  expect(registration.bread_crumbs.bread_crumb_profile).to eql('Profile'), "Bread crumb Profile does not exist "
end

Then /^[Ee]xpect Registration bread crumbs is Membership$/ do
  expect(registration.bread_crumbs.bread_crumb_membership).to eql('Membership'), "Profile header Membership does not exist "
end

Then /^[Ee]xpect Registration bread crumbs is Choose Supplies$/ do
  expect(registration.bread_crumbs.bread_crumb_choose_supplies).to eql('Choose Supplies'), "Profile header Choose Supplies does not exist "
end