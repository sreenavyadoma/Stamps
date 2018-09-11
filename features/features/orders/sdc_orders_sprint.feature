Feature:  Orders defects from Sprints

  Background:
    Given Start test driver

  @multiple_contact_email_not_required
  Scenario WEBAPPS-10482 Print button becomes disabled when uncheck the order
    Then sign-in to orders
    Then expect Print button is enabled in Orders toolbar
    Then click Print button in Orders toolbar
    Then expect "no orders are selected" modal is present
    Then click cancel in "no orders are selected" modal
    Then expect "no orders are selected" modal is not present
    Then select the first order in the grid
    Then expect Print button is enabled in Orders toolbar
    Then unselect the first order in the grid
    Then uncheck grid order id 1
    Then expect Print button is enabled in Orders toolbar
    Then click Print button in Orders toolbar
    Then expect "no orders are selected" modal is present
    Then click cancel on "no orders are selected" modal
    Then expect "no orders are selected" modal is not present
    Then sign out