Feature: Select Email Tracking for order when printing

  Background:
    Given I am signed in to Orders

  @email_tracking
  Scenario: Email Tracking

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then Details: Set Service to "Media Mail Package"
    Then Details: Set Ounces to 1
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Email Tracking to Checked
    Then Toolbar: Print
    Then Sign out