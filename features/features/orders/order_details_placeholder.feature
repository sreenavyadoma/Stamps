Feature:  Order Details Form Placeholder default values
  ORDERS-33 Item Row Quantity Field should have "Qty" Placeholder Text

  Background:
    Given a valid user is signed in to Web Apps

  @details_placeholders
  Scenario:  Order Details Form Placeholder default values
    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Ship-To Address Placeholder is Address
    Then on Order Details form, expect Ship-To Phone Placeholder is Phone
    Then on Order Details form, expect Ship-To Email Placeholder is Email
    Then on Order Details form, expect service Placeholder is Select a service ...

    Then on Order Details form, Add Item 1

    Then on Order Details form, expect Item 1 Qty Placeholder is Qty
    Then on Order Details form, expect Item 1 ID Placeholder is ID #
    Then on Order Details form, expect Item 1 Description Placeholder is Description

    Then on Order Details form, set Ship-To Country to Curacao

    Then on Order Details form, expect International Ship-To Name Placeholder is Name
    Then on Order Details form, expect International Ship-To Company Placeholder is Company
    Then on Order Details form, expect International Ship-To Address 1 Placeholder is Address 1
    Then on Order Details form, expect International Ship-To Address 2 Placeholder is Address 2
    Then on Order Details form, expect International Ship-To City Placeholder is City
    Then on Order Details form, expect International Ship-To Province Placeholder is Province
    Then on Order Details form, expect International Ship-To Postal Code Placeholder is Postal Code
    Then on Order Details form, expect International Ship-To Phone Placeholder is Phone
    Then on Order Details form, expect International Ship-To Email Placeholder is Email

    Then Sign out



