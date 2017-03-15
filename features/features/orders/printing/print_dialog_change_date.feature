
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
    Given a valid user is signed in to Web Apps

  @print_dialog_change_date
  Scenario: Change Print Date
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Large Envelope
    Then set Order Details form Ounces to 2

    Then in Orders Toolbar, click Print button
    Then set Print modal Ship Date to today plus 1
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then set Print modal Ship Date to today plus 2
    Then Pause for 2 seconds
    Then in Print modal, click Print button
    Then Pause for 1 second
    Then Sign out


