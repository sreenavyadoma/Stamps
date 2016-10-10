Feature:  Order Details Form Placeholder default values
  ORDERS-33 Item Row Quantity Field should have "Qty" Placeholder Text

  Background:
    Given I am signed in to Orders

  @details_placeholders
  Scenario:  Order Details Form Placeholder default values
    Then Toolbar: Add
    Then Details: Expect Ship-To Address Placeholder is Address
    Then Details: Expect Ship-To Phone Placeholder is Phone
    Then Details: Expect Ship-To Email Placeholder is Email
    Then Details: Expect Service Placeholder is Select a Service ...

    Then Details: Add Item 1

    Then Details: Expect Item 1 Qty Placeholder is Qty
    Then Details: Expect Item 1 ID Placeholder is ID #
    Then Details: Expect Item 1 Description Placeholder is Description

    Then Details: Set Ship-To Country to Curacao

    Then Details: Expect International Ship-To Name Placeholder is Name
    Then Details: Expect International Ship-To Company Placeholder is Company
    Then Details: Expect International Ship-To Address 1 Placeholder is Address 1
    Then Details: Expect International Ship-To Address 2 Placeholder is Address 2
    Then Details: Expect International Ship-To City Placeholder is City
    Then Details: Expect International Ship-To Province Placeholder is Province
    Then Details: Expect International Ship-To Postal Code Placeholder is Postal Code
    Then Details: Expect International Ship-To Phone Placeholder is Phone
    Then Details: Expect International Ship-To Email Placeholder is Email

    Then Sign out



