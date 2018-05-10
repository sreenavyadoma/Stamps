
Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age header exist$/ do
   PartnerPortal.dashboard_page.dashboard_header.wait_until_present(timeout: 10)
   expect(PartnerPortal.dashboard_page.dashboard_header).to be_present, 'Dashboard header DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect dashboard header on left panel exists$/ do
  expect(PartnerPortal.dashboard_page.panel_dashboard).to be_present 'Dashboard header on left panel  DOES NOT exist on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age the [Cc]ontract header exists$/ do
  PartnerPortal.dashboard_page.contract_header.wait_until_present(timeout: 5)
  expect(PartnerPortal.dashboard_page.contract_header).to be_present, 'Contract header DOES NOT exist on dashboard page'
end


Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age the correct contract is being displayed for (?:user|(.*))$/ do |user|
  contract_header= PartnerPortal.dashboard_page.contract_header
  TestData.hash[:contract_display_name_actual] = contract_header.text_value.split(':').last.strip

  step 'establish partner portal db connection'
  TestData.hash[:partner_account_id] = PartnerPortal.common_page.user_table_query(((user.nil?) ? (SdcEnv.usr) :user), 'PartnerAccountId')
  TestData.hash[:contract_display_name] = PartnerPortal.common_page.contract_table_query(TestData.hash[:partner_account_id], 'DisplayName')
  step 'Close partner portal db connection'

  expect(TestData.hash[:contract_display_name]).to eql(TestData.hash[:contract_display_name_actual])
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age the Last updated on: field to be present$/ do
  expect(PartnerPortal.dashboard_page.contract_last_updated_on). to be_present, 'Last updated on DOES NOT exist on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age the Last updated on: field displays correct date for (?:user|(.*))$/ do |user|
  last_update_on= PartnerPortal.dashboard_page.contract_last_updated_on
  actual_date = last_update_on.text_value.split(':').last.strip
  TestData.hash[:last_update_on_actual]=  Date.strptime(actual_date, '%m/%d/%Y')

  step 'establish partner portal db connection'
  TestData.hash[:partner_account_id] = PartnerPortal.common_page.user_table_query(((user.nil?) ? (SdcEnv.usr) :user), 'PartnerAccountId')
  TestData.hash[:last_update_on] = PartnerPortal.common_page.contract_table_query(TestData.hash[:partner_account_id], 'DateLastUpdated')
  step 'Close partner portal db connection'

  expect(TestData.hash[:last_update_on].to_date).to eql(TestData.hash[:last_update_on_actual])
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions USD Chart to exist$/ do
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart).to be_present 'Preferred Rates Qualified Transactions USD(S) chart DOES NOT exist on dashboard page'
end


Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions USD Chart title to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_title.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions USD Chart Y-axis label to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_y_axis.text_value.strip). to eql(str)
end


Then /^[Pp]P: [Cc]lick submit in dashboard page$/ do
  PartnerPortal.dashboard_page.submit.send_keys(:enter)
end

