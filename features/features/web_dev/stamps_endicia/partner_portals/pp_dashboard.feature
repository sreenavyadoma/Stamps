Feature: PP-MVP: Dashboard Page

  Background:
    Given PP: A valid user is signed into Partner Portal

  @pp_dashboard_single_contract_validaiton
  Scenario: PP: Dashboard Page Single Contract Validation

    # Verify  all content and fields are present
    Then PP: expect dashboard page header exist
    Then PP: expect left panel to expand for browser
    Then PP: expect dashboard page footer to exist
    Then PP: expect dashboard page the Contract drop-down does not exist
    Then PP: expect dashboard page the 'Last updated on' field to be present

    # Preferred Rates Qualified Transactions $
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions $ Chart to exist
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions $ Chart title to be Preferred Rates Qualified Transactions
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions $ Chart Y-axis label to be USD ($)
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions $ Chart has X-axix to be labeled with month abbreviations
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions $ Chart Y-axis to start at 0
    #Then PP: expect dashboard page the Preferred Rates Qualified Transactions Chart $ legends to exist
    #Then PP: expect dashboard page the Preferred Rates Qualified Transactions $ Units of Representation to be in USD ($).

    # Preferred Rates Qualified Transactions #of packages
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart to exist
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart title to be Preferred Rates Qualified Transactions
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart Y-axis lable to be # of packages
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart has X-axix to be labeled with month abbreviations
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart Y-axis to start at 0
    #Then PP: expect dashboard page the Preferred Rates Qualified Transactions # legends to exist
    #Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Units of Representation to be in # packages

   # Active Customers
    Then PP: expect dashboard page the Active Customers Chart to exist
    Then PP: expect dashboard page the Active Customers Chart title to be Active Customers
    Then PP: expect dashboard page the Active Customers Chart Y-axis label to be # of customers
    Then PP: expect dashboard page the Active Customers Chart has X-axix to be labeled with month abbreviations
    Then PP: expect dashboard page the Active Customers Chart Y-axis to start at 0
    #Then PP: expect dashboard page the Active Customers Chart legends to exist
    #Then PP: expect dashboard page the PActive Customers Chart Units of Representation to be in # customers