Feature: Orders print Modal Bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_print_modal
  Scenario: ORDERSAUTO-3506 New Sprint 12/6/17 WEBAPPS-7078 Order is blocked after printing Sample label
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Regional Rate Box A
    Then set Order Details form Ounces to 1
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then In Print modal, click Print button Sample
    Then In Print modal, click Close Button
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then Sign out
