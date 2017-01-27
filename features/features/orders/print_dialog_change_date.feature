
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
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Large Envelope
    Then On Order Details form, set Ounces to 2

    Then In Orders Toolbar, click Print button
    Then In Print modal, set Ship Date to today plus 1
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, set Ship Date to today plus 2
    Then Pause for 2 seconds
    Then In Print modal, click Print button
    Then Pause for 1 second
    Then Sign out


