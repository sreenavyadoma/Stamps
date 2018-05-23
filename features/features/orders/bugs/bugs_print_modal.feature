Feature: Orders print Modal Bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_print_modal
  Scenario: ORDERSAUTO-3506 New Sprint 12/6/17 WEBAPPS-7078 Order is blocked after printing Sample label
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PM Regional Rate Box A
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then In Print modal, click Print button Sample
    Then in print modal, click close button
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then sign out
