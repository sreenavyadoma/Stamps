
Feature: Printing total cost

  Background:
    Given I am signed in to Orders using ff

  @details_total_cost
  Scenario: B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Expect Service Cost to be $0.00
    Then Details: Expect Insurance Cost to be $0.00
    Then Details: Expect Tracking Cost to be $0.00
    Then Details: Expect Total to be $0.00

    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Insure For to $10.00
    Then Details: Set Tracking to "Signature Required"
    Then Pause for 1 second
    Then Details: Expect Total is corect
    Then Sign out
