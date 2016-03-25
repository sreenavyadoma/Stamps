
Feature: Printing total cost

  Background:
    Given I am signed in to Orders using ff

  @details_panel_total_cost @details_panel_total_cost_dev
  Scenario: B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Expect Service Cost to be $0.00
    #Then Order Details: Expect Insurance Cost to be $0.00
    Then Order Details: Expect Tracking Cost to be $0.00
    Then Order Details: Expect Total to be $0.00

    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Hide Ship-To fields
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Insure For to $10.00
    Then Order Details: Set Tracking to "Signature Required"
    Then Expect Total amount equals Service Cost, Insurance Cost and Tracking Cost
    Then Sign out
