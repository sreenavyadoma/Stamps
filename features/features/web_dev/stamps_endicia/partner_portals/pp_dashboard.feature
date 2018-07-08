
Feature: PP-MVP: Dashboard Page Single Contract

  Background:
    Given PP: A valid user is signed into Partner Portal

  @pp_dashboard_single_contract_ui_validaiton
  Scenario: PP: Dashboard Page Single Contract UI Validation

    # Verify  all content and fields are present
    Then PP: expect global header exists
    Then PP: expect dashboard page header exist
    Then PP: expect left panel to expand for browser
    Then PP: expect footer to exists
    Then PP: expect dashboard page the Contract header exists
    Then PP: expect dashboard page the correct contract is being displayed for user
    Then PP: expect dashboard page the Last updated on: field to be present
    Then PP: expect dashboard page the Last updated on: field displays correct date for user

    # Preferred Rates Qualified Transactions $
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions USD Chart to exist
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions USD Chart title to be Preferred Rates Qualified Transactions
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions USD Chart Y-axis label to be USD ($)
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions USD Chart has X-axis to be labeled with month abbreviations
     """
     Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
     """
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions Chart USD legends to exist
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions Chart USD previous year legend to be last year date
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions Chart USD current year legends to be current year
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions Chart USD Current Month legends to be Current Month


    # Preferred Rates Qualified Transactions #of packages
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart to exist
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart title to be Preferred Rates Qualified Transactions
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart Y-axis label to be # of packages
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart has X-axis to be labeled with month abbreviations
     """
     Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
     """
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # legends to exist
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # previous year legend to be last year date
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # current year legends to be current year
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Current Month legends to be Current Month

   # Active Customers
    Then PP: expect dashboard page the Active Customers Chart to exist
    Then PP: expect dashboard page the Active Customers Chart title to be Active Customers
    Then PP: expect dashboard page the Active Customers Chart Y-axis label to be # of customers
    Then PP: expect dashboard page the Active Customers Chart has X-axis to be labeled with month abbreviations
     """
     Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
     """
    Then PP: expect dashboard page the Active Customers Chart legends to exist
    Then PP: expect dashboard page the Active Customers Chart previous year legend to be last year date
    Then PP: expect dashboard page the Active Customers Chart current year legends to be current year
    Then PP: expect dashboard page the Active Customers Chart Current Month legends to be Current Month

   # Revenue Share
    Then PP: expect dashboard page the Revenue Share Chart to exist
    Then PP: expect dashboard page the Revenue Share Chart to title to be Revenue Share
    Then PP: expect dashboard page the Revenue Share Chart Y-axis label to be USD ($)
    Then PP: expect dashboard page the Revenue Share Chart has X-axis to be labeled with month abbreviations
     """
     Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
     """
    Then PP: expect dashboard page the Revenue Share Chart legends to exist
    Then PP: expect dashboard page the Revenue Share Chart previous year legend to be last year date
    Then PP: expect dashboard page the Revenue Share Chart current year legends to be current year
    Then PP: expect dashboard page the Revenue Share Chart Current Month legends to be Current Month

  #Verify Last Updated On is not present
    Then PP: navigate back to previous page
    Then PP: set login page email to webdevauto3@stamps.com
    Then PP: set login page password to password1
    Then PP: User clicks Log In
    Then PP: expect dashboard page the Last updated on: field to be not present

  @pp_dashboard_single_contract_chart_data_validation
  Scenario: PP: Dashboard Page Single Contract Data Validation
    # Preferred Rates Qualified Transactions USD($)
    Then PP: expect dashboard page the Preferred Rates Qualified Postage Amount USD chart previous year chart data to be correct
    Then PP: expect dashboard page the Preferred Rates Qualified Postage Amount USD chart current year chart data to be correct

    # Preferred Rates Qualified Transactions #of packages
    Then PP: expect dashboard page the Preferred Rates Qualified Postage Count # chart previous year chart data to be correct
    Then PP: expect dashboard page the Preferred Rates Qualified Postage Count # chart current year chart data to be correct

    # Active Customer #of customers
    Then PP: expect dashboard page the Active Customers # chart previous year chart data to be correct
    Then PP: expect dashboard page the Active Customers # chart current year chart data to be correct

    # Revenue Share USD($)
    Then PP: expect dashboard page the Revenue Share USD chart previous year chart data to be correct
    Then PP: expect dashboard page the Revenue Share USD chart current year chart data to be correct

  @pp_dashboard_single_contract_export_data_ui_validation
  Scenario: PP: Dashboard Page Single Contract Export Data UI Validation
    #verify UI
    Then PP: expect export data header to exists
    Then PP: expect export data content to be Select a date range to export transaction level data as a CSV file.
    Then PP: expect export from date label to be From:
    Then PP: expect dashboard page from date field exists
    Then PP: expect dashboard page from data field placeholder to be MM/DD/YY
    Then PP: expect dashboard page from date date picker exists
    Then PP: expect export to date label to be To:
    Then PP: expect dashboard page to date field exists
    Then PP: expect dashboard page to date field place holder to be MM/DD/YY
    Then PP: expect dashboard page to date picker exists
    Then PP: expect dashboard page download button exists

   #validate different error messages of the from date and to date fields
    Then PP: click on the dashboard page download button
    Then PP: expect dashboard page from date field error message index 1 to be This field is required.
    Then PP: expect dashboard page to date field error message index 1 to be This field is required.
    Then PP: set dashboard page from date field to 25/25/25
    Then PP: set dashboard page to date field to 25/25/25
    Then PP: blur out on dashboard page
    Then PP: expect dashboard page from date field error message index 1 to be This field is required.
    Then PP: expect dashboard page to date field error message index 1 to be This field is required.
    Then PP: set dashboard page from date field to 2/2/18
    Then PP: set dashboard page to date field to 2/2/17
    Then PP: blur out on dashboard page
    Then PP: expect dashboard page from date field error message index 1 to be To Date must be after From Date.
    Then PP: expect dashboard page to date field error message index 1 to be To Date must be after From Date.

    #verify functionality export of data
    Then PP: set dashboard page from date field to 02/16/17
    Then PP: set dashboard page to date field to 02/18/18
    Then PP: delete existing csv file
    Then PP: click on the dashboard page download button
    Then PP: expect dashboard page download modal exists
    Then PP: expect dashboard page download modal header to be Downloading Report
    Then PP: expect dashboard page download modal paragraph index 1 to be
     """
     Your report is being downloaded now. This may take a while for larger data sets.
     """
    Then PP: expect dashboard page download modal paragraph index 2 to be
      """
      In the meantime, you can close this window and continue to use the portal.
      """
    Then PP: click on the dashboard page download modal ok button
    Then PP: expect from date and to date are cleared
    Then PP: Expect a record of Log Type 3 event is added in Audit Records for user
    Then PP: expect CSV file to be downloaded with correct file name
    Then PP: delete existing csv file

   #Then PP: dashboard page export data for 10 dates ranges

  @pp_dashboard_single_contract_export_data_validation
  Scenario: PP: Dashboard Page Single Contract Export Date Data Validation
    Then PP: set dashboard page from date field to 07/01/17
    Then PP: set dashboard page to date field to 07/15/17
    Then PP: delete existing csv file
    Then PP: click on the dashboard page download button
    Then PP: click on the dashboard page download modal ok button
    Then PP: expect from date and to date are cleared
    Then PP: Expect a record of Log Type 3 event is added in Audit Records for user
    #Then PP: expect CSV file to be downloaded with correct file name
    #Then PP: dashboard page export data expect csv file transaction data matches database transaction data
   # Then PP: delete existing csv file

  #Then PP: dashboard page export data data validation for 10 dates ranges
