
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

#    # Revenue Share
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

  @pp_dashboard_single_contract_chart_data_validation
  Scenario: PP: Dashboard Page Single Contract UI Validation
    # Preferred Rates Qualified Transactions $
