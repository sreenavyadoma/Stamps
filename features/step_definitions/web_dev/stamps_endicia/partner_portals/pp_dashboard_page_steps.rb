
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
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart).to be_present, 'Preferred Rates Qualified Transactions USD(S) chart DOES NOT exist on dashboard page'
end


Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions USD Chart title to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_title.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions USD Chart Y-axis label to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_y_axis.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions USD Chart has X-axis to be labeled with month abbreviations$/ do |str|
   actual_month = str.split(',')
   expected_month = PartnerPortal.dashboard_page.x_axis_month_abbreviations
   expect(expected_month[0]). to eql( actual_month)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions Chart USD legends to exist$/ do
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_legends).to be_present, 'Preferred Rates Qualified Transactions Chart USD legends DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions Chart USD previous year legend to be last year date$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  previous_year = last_update_date - 1.year
  legends = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[0].to_i).to eql(previous_year.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Preferred Rates Qualified Transactions Chart USD current year legends to be current year$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  legends  = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[1].to_i).to eql(last_update_date.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Preferred Rates Qualified Transactions Chart USD Current Month legends to be (.*)$/ do |str|
  legends  = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_usd_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  current_month = [] << legends[2] + " " + legends[3]
  expect(current_month[0].to_s).to eql(str)
end

Then /^PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart to exist$/ do
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart).to be_present, 'Preferred Rates Qualified Transactions # of packages chart DOES NOT exist on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Preferred Rates Qualified Transactions # Chart title to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_title.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions # Chart Y-axis label to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_y_axis.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions # Chart has X-axis to be labeled with month abbreviations$/ do |str|
  actual_month = str.split(',')
  expected_month = PartnerPortal.dashboard_page.x_axis_month_abbreviations
  expect(expected_month[1]). to eql( actual_month)
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions # legends to exist$/ do
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_legends).to be_present, 'Preferred Rates Qualified Transactions # Chart legends DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect [Dd]ashboard page the Preferred Rates Qualified Transactions # previous year legend to be last year date$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  previous_year = last_update_date - 1.year
  legends = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[0].to_i).to eql(previous_year.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Preferred Rates Qualified Transactions # current year legends to be current year$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  legends  = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[1].to_i).to eql(last_update_date.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Preferred Rates Qualified Transactions # Current Month legends to be (.*)$/ do |str|
  legends  = PartnerPortal.dashboard_page.preferred_rates_qualified_transactions_packages_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  current_month = [] << legends[2] + " " + legends[3]
  expect(current_month[0].to_s).to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Active Customers Chart to exist$/ do
  expect(PartnerPortal.dashboard_page.active_customers_customers_chart).to be_present, 'Active Customers chart DOES NOT exist on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Active Customers Chart title to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.active_customers_customers_chart_title.text_value.strip). to eql(str)
end


Then /^[Pp]P: expect [Dd]ashboard page the Active Customers Chart Y-axis label to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.active_customers_customers_chart_y_axis.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Active Customers Chart has X-axis to be labeled with month abbreviations$/ do |str|
  actual_month = str.split(',')
  expected_month = PartnerPortal.dashboard_page.x_axis_month_abbreviations
  expect(expected_month[2]). to eql( actual_month)
end

Then /^[Pp]P: expect [Dd]ashboard page the Active Customers Chart legends to exist$/ do
  expect(PartnerPortal.dashboard_page.active_customers_customers_chart_legends).to be_present, ' Active Customers chart LEGENDS DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect [Dd]ashboard page the Active Customers Chart previous year legend to be last year date$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  previous_year = last_update_date - 1.year
  legends = PartnerPortal.dashboard_page.active_customers_customers_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[0].to_i).to eql(previous_year.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Active Customers Chart current year legends to be current year$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  legends  = PartnerPortal.dashboard_page.active_customers_customers_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[1].to_i).to eql(last_update_date.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Active Customers Chart Current Month legends to be (.*)$/ do |str|
  legends  = PartnerPortal.dashboard_page.active_customers_customers_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  current_month = [] << legends[2] + " " + legends[3]
  expect(current_month[0].to_s).to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Revenue Share [Cc]hart to exist$/ do
  expect(PartnerPortal.dashboard_page.revenue_share_chart).to be_present, 'Revenue Share chart DOES NOT exist on dashboard page'
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Revenue Share Chart to title to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.revenue_share_chart_title.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Revenue Share Chart Y-axis label to be (.*)$/ do |str|
  expect(PartnerPortal.dashboard_page.revenue_share_chart_y_axis.text_value.strip). to eql(str)
end

Then /^[Pp]P: expect [Dd]ashboard page the Revenue Share Chart has X-axis to be labeled with month abbreviations$/ do |str|
  actual_month = str.split(',')
  expected_month = PartnerPortal.dashboard_page.x_axis_month_abbreviations
  expect(expected_month[3]). to eql( actual_month)
end

Then /^[Pp]P: expect [Dd]ashboard page the Revenue Share [Cc]hart legends to exist$/ do
  expect(PartnerPortal.dashboard_page.revenue_share_chart_legends).to be_present, ' Revenue Share chart LEGENDS DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect [Dd]ashboard page the Revenue Share Chart previous year legend to be last year date$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  previous_year = last_update_date - 1.year
  legends = PartnerPortal.dashboard_page.revenue_share_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[0].to_i).to eql(previous_year.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Revenue Share Chart current year legends to be current year$/ do
  last_update_on = PartnerPortal.dashboard_page.contract_last_updated_on
  last_update_date = Date.strptime(last_update_on.text_value.split(':').last.strip, '%m/%d/%Y')
  legends  = PartnerPortal.dashboard_page.revenue_share_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  expect(legends[1].to_i).to eql(last_update_date.year)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the Revenue Share Chart Current Month legends to be (.*)$/ do |str|
  legends  = PartnerPortal.dashboard_page.revenue_share_chart_legends.text_value.gsub(/\P{ASCII}/, '').strip.split
  current_month = [] << legends[2] + " " + legends[3]
  expect(current_month[0].to_s).to eql(str)
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard page the (.*) chart previous year chart data to be correct$/ do |chart|
 previous_year_data = PartnerPortal.common_page.chart_data_window

 step 'establish partner portal db connection'
puts  previous_year_data_expected = PartnerPortal.common_page.chart_data_query(SdcEnv.usr, chart, '2017', 'Amount' )
 step 'Close partner portal db connection'
end



Then /^[Pp]P: [Cc]lick submit in dashboard page$/ do
  PartnerPortal.dashboard_page.submit.send_keys(:enter)
end

