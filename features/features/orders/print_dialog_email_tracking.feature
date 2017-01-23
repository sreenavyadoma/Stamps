Feature: Select Email Tracking for order when printing

  Background:
    Given I am signed in to Orders

  @print_dialog_email_tracking
  Scenario: Email Tracking

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then Order Details: Select Service MM Package
    Then Order Details: Set Ounces to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Check Email Tracking Details to Recipients
    Then Print Modal: Print
    Then Sign out