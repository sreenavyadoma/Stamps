Feature:  Order Details Form Placeholder default values
  ORDERS-33 Item Row Quantity Field should have "Qty" Placeholder Text

  Background:
    Given I am signed in to Orders

  @details_placeholders
  Scenario:  Order Details Form Placeholder default values
    Then Add New Order
    Then Details: Expect Ship-To Address Placeholder to be Address
    Then Details: Expect Ship-To Phone Placeholder to be Phone
    Then Details: Expect Ship-To Email Placeholder to be Email
    Then Details: Expect Service Placeholder to be Select a Service ...

    Then Details: Add Item 1

    Then Details: Expect Item 1 Qty Placeholder to be Qty
    Then Details: Expect Item 1 ID Placeholder to be ID #
    Then Details: Expect Item 1 Description Placeholder to be Description

    Then Details: Set Ship-To Country to Curacao

    Then Details: Expect International Ship-To Name Placeholder to be Name
    Then Details: Expect International Ship-To Company Placeholder to be Company
    Then Details: Expect International Ship-To Address 1 Placeholder to be Address 1
    Then Details: Expect International Ship-To Address 2 Placeholder to be Address 2
    Then Details: Expect International Ship-To City Placeholder to be City
    Then Details: Expect International Ship-To Province Placeholder to be Province
    Then Details: Expect International Ship-To Postal Code Placeholder to be Postal Code
    Then Details: Expect International Ship-To Phone Placeholder to be Phone
    Then Details: Expect International Ship-To Email Placeholder to be Email

    Then Sign out



