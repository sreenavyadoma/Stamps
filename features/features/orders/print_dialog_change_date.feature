
Feature:  Changing Print Date Causes Page to get Stuck on "Verifying Postage Rates"Steps
  Open Print dialog.
  Change Ship Date to a new value.
  Page gets stuck on "Verifying Postage Rates" forever. User has to reload the page. Note that the newly-selected value is correctly saved.
  Test Strategy
  Only test in one browser/OS.
  Open Print dialog
  Change Ship Date value
  Verify that the page does NOT get stuck on "Verifying Postage Rates" forever.
  Close the Print dialog
  Re-open the Print dialog
  Verify that Ship Date still shows the value you selected.

  Background:
    Given I am signed in to Orders

  @print_dialog_change_date
  Scenario: Change Print Date
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Ounces to 2

    Then Print: Open Modal
    Then Print: Set Ship Date to today plus 1
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Set Ship Date to today plus 2
    Then Pause for 2 seconds
    Then Print: Print
    Then Pause for 1 second
    Then Sign out


