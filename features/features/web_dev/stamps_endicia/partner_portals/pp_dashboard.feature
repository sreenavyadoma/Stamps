Feature: PP-MVP: Dashboard Page

  Background:
    Given PP: A valid user is signed into Partner Portal

  @pp_dashboard_single_contract_ui_validaiton
  Scenario: PP: Dashboard Page Single Contract UI Validation

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
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions $ Chart has X-axis to be labeled with month abbreviations
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions $ Chart Y-axis to start at 0
    #Then PP: expect dashboard page the Preferred Rates Qualified Transactions Chart $ legends to exist
    #Then PP: expect dashboard page the Preferred Rates Qualified Transactions $ Units of Representation to be in USD ($).

    # Preferred Rates Qualified Transactions #of packages
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart to exist
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart title to be Preferred Rates Qualified Transactions
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart Y-axis label to be # of packages
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart has X-axis to be labeled with month abbreviations
    Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Chart Y-axis to start at 0
    #Then PP: expect dashboard page the Preferred Rates Qualified Transactions # legends to exist
    #Then PP: expect dashboard page the Preferred Rates Qualified Transactions # Units of Representation to be in # packages

   # Active Customers
    Then PP: expect dashboard page the Active Customers Chart to exist
    Then PP: expect dashboard page the Active Customers Chart title to be Active Customers
    Then PP: expect dashboard page the Active Customers Chart Y-axis label to be # of customers
    Then PP: expect dashboard page the Active Customers Chart has X-axis to be labeled with month abbreviations
    Then PP: expect dashboard page the Active Customers Chart Y-axis to start at 0
    #Then PP: expect dashboard page the Active Customers Chart legends to exist
    #Then PP: expect dashboard page the PActive Customers Chart Units of Representation to be in # customers

    # Revenue Share
    Then PP: expect dashboard page the Revenue Share Chart to exist
    Then PP: expect dashboard page the Revenue Share Chart to title to be Revenue Share
    Then PP: expect dashboard page the Revenue Share Chart Y-axis label to be USD ($)
    Then PP: expect dashboard page the Revenue Share Chart has X-axis to be labeled with month abbreviations
    Then PP: expect dashboard page the Revenue Share Chart Y-axis to start at 0
#    Then PP: expect dashboard page the Revenue Share Chart legends to exist
#    Then PP: expect dashboard page the Revenue Share Chart Units of Representation to be in USD ($)

    # Export Data
    Then PP: expect dashboard page the Export Data label to exist
    Then PP: expect dashboard page the Export Data label to be Export Data
    Then PP: expect dashboard page the Select a date range label to exist
    Then PP: expect dashboard page the Select a date range label to be
    """
    Select a date range to export transaction level data as a CVS file.
    """

    # From
    Then PP: expect dashboard page the From label to be From:
    Then PP: expect dashboard page the From field to exist
    Then PP: expect dashboard page the Form field placehoder to show MM/DD/YY
    Then PP: expect dashboard page the From Date field the Calendar button to exist

    # To
    Then PP: expect dashboard page the To field to exist
    Then PP: expect dashboard page the To field placehoder to show MM/DD/YY
    Then PP: expect dashboard page the To field the Calendar button to exist
    Then PP: set dashboard page the From field to 123456
    Then PP: expect the To field to be 12/34/56
    Then PP: dashboard page the To field Tab
    Then PP: expect dashboard page the To field error message to be Valid date required

    Then PP: set set dashboard page the From field to 010218
    Then PP: set set dashboard page the To field to 010217
    Then PP: expect dashboard page error message to be To Date must be after From Date.
    Then PP: expect dashboard page the Dowload button to exist