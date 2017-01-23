
Feature:  Changing Print Date Causes Page to get Stuck on "Verifying Mail Rates"Steps
  Open Print dialogger.
  Change Ship Date to a new value.
  Page gets stuck on "Verifying Mail Rates" forever. User has to reload the page. Note that the newly-selected value is correctly saved.
  Test Strategy
  Only test in one browser/OS.
  Open Print dialog
  Change Ship Date value
  Verify that the page does NOT get stuck on "Verifying Mail Rates" forever.
  Close the Print dialog
  Re-open the Print dialog
  Verify that Ship Date still shows the value you selected.

  Background:
    Given I am signed in to Orders

  @print_dialog_change_date
  Scenario: Change Print Date
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Set Ounces to 2

    Then Print Modal: Open Print Modal
    Then Print Modal: Set Ship Date to today plus 1
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Set Ship Date to today plus 2
    Then Pause for 2 seconds
    Then Print Modal: Print
    Then Pause for 1 second
    Then Sign out


