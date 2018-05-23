Feature: click print modal print button Sample - Priority Mail Regional Rate Box A

  Background:
    Given a valid user is signed in to Web Apps

  @print_sample_pm_regional_rate_box_a
  Scenario:  Priority Mail Regional Rate Box A
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PM Regional Rate Box A
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button Sample
    Then sign out
