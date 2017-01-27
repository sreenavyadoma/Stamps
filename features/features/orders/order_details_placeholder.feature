Feature:  Order Details Form Placeholder default values
  ORDERS-33 Item Row Quantity Field should have "Qty" Placeholder Text

  Background:
    Given a valid user is signed in to Web Apps

  @details_placeholders
  Scenario:  Order Details Form Placeholder default values
    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Ship-To Address Placeholder is Address
    Then On Order Details form, expect Ship-To Phone Placeholder is Phone
    Then On Order Details form, expect Ship-To Email Placeholder is Email
    Then On Order Details form, expect service Placeholder is Select a service ...

    Then On Order Details form, Add Item 1

    Then On Order Details form, expect Item 1 Qty Placeholder is Qty
    Then On Order Details form, expect Item 1 ID Placeholder is ID #
    Then On Order Details form, expect Item 1 Description Placeholder is Description

    Then On Order Details form, set Ship-To Country to Curacao

    Then On Order Details form, expect International Ship-To Name Placeholder is Name
    Then On Order Details form, expect International Ship-To Company Placeholder is Company
    Then On Order Details form, expect International Ship-To Address 1 Placeholder is Address 1
    Then On Order Details form, expect International Ship-To Address 2 Placeholder is Address 2
    Then On Order Details form, expect International Ship-To City Placeholder is City
    Then On Order Details form, expect International Ship-To Province Placeholder is Province
    Then On Order Details form, expect International Ship-To Postal Code Placeholder is Postal Code
    Then On Order Details form, expect International Ship-To Phone Placeholder is Phone
    Then On Order Details form, expect International Ship-To Email Placeholder is Email

    Then Sign out



