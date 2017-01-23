Feature:  Order Details Form Placeholder default values
  ORDERS-33 Item Row Quantity Field should have "Qty" Placeholder Text

  Background:
    Given I am signed in to Orders

  @details_placeholders
  Scenario:  Order Details Form Placeholder default values
    Then Orders Toolbar: Add
    Then Order Details: Expect Ship-To Address Placeholder is Address
    Then Order Details: Expect Ship-To Phone Placeholder is Phone
    Then Order Details: Expect Ship-To Email Placeholder is Email
    Then Order Details: Expect Service Placeholder is Select a Service ...

    Then Order Details: Add Item 1

    Then Order Details: Expect Item 1 Qty Placeholder is Qty
    Then Order Details: Expect Item 1 ID Placeholder is ID #
    Then Order Details: Expect Item 1 Description Placeholder is Description

    Then Order Details: Set Ship-To Country to Curacao

    Then Order Details: Expect International Ship-To Name Placeholder is Name
    Then Order Details: Expect International Ship-To Company Placeholder is Company
    Then Order Details: Expect International Ship-To Address 1 Placeholder is Address 1
    Then Order Details: Expect International Ship-To Address 2 Placeholder is Address 2
    Then Order Details: Expect International Ship-To City Placeholder is City
    Then Order Details: Expect International Ship-To Province Placeholder is Province
    Then Order Details: Expect International Ship-To Postal Code Placeholder is Postal Code
    Then Order Details: Expect International Ship-To Phone Placeholder is Phone
    Then Order Details: Expect International Ship-To Email Placeholder is Email

    Then Sign out



