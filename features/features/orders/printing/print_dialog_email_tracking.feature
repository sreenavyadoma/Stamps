Feature: Select Email Tracking for order when printing

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_email_tracking
  Scenario: Email Tracking

    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo
    Then set Order Details form Ship-To to MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then set Order Details form service to MM Package
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, check Email Tracking Details to Recipients
    Then in Print modal, click Print button
    Then Sign out