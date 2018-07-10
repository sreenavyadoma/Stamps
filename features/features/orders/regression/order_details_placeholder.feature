Feature:  Order Details Form Placeholder default values
  ORDERS-33 Item Row Quantity Field should have "Qty" Placeholder Text

  Background:
    Given a valid user is signed in to Web Apps

  @details_placeholders
  Scenario:  Order Details Form Placeholder default values
    Then add new order
    Then expect Order Details Ship-To Address Placeholder is Address
    Then expect Order Details Ship-To Phone Placeholder is Phone
    Then expect Order Details Ship-To Email Placeholder is Email
    Then expect Order Details service Placeholder is Select a service ...

    Then add order details item 1

    Then expect order details associated item 1 qty placeholder is Qty
    Then expect order details associated item 1 ID Placeholder is ID #
    Then expect order details associated item 1 Description Placeholder is Description

    Then set order details domestic ship-to country to Curacao

    Then expect Order Details Ship-To Name Placeholder is Name
    Then expect Order Details Ship-To Company Placeholder is Company
    Then expect Order Details Ship-To Address 1 Placeholder is Address 1
    Then expect Order Details Ship-To Address 2 Placeholder is Address 2
    Then expect Order Details Ship-To City Placeholder is City
    Then expect Order Details Ship-To Province Placeholder is Province
    Then expect Order Details Ship-To Postal Code Placeholder is Postal Code
    Then expect Order Details Ship-To Phone Placeholder is Phone
    Then expect Order Details Ship-To Email Placeholder is Email

    Then sign out



