Feature:  Order Details Form Placeholder default values
  ORDERS-33 Item Row Quantity Field should have "Qty" Placeholder Text

  Background:
    Given I am signed in to Orders

  @order_details_placeholder
  Scenario:  Order Details Form Placeholder default values
    Then Add New Order
    Then Order Details: Expect Ship-To Address Placeholder to be Address
    Then Order Details: Expect Ship-To Phone Placeholder to be Phone
    Then Order Details: Expect Ship-To Email Placeholder to be Email
    Then Order Details: Expect Service Placeholder to be Select a Service ...

    Then Order Details: Add Item 1

    Then Order Details: Expect Item Qty Placeholder to be Qty
    Then Order Details: Expect Item ID# Placeholder to be ID #
    Then Order Details: Expect Item Description Placeholder to be Description

    Then Order Details: Set Ship-To Country to Curacao

    Then Order Details: Expect International Ship-To Name Placeholder to be Name
    Then Order Details: Expect International Ship-To Company Placeholder to be Company
    Then Order Details: Expect International Ship-To Address 1 Placeholder to be Address 1
    Then Order Details: Expect International Ship-To Address 2 Placeholder to be Address 2
    Then Order Details: Expect International Ship-To City Placeholder to be City
    Then Order Details: Expect International Ship-To Province Placeholder to be Province
    Then Order Details: Expect International Ship-To Postal Code Placeholder to be Postal Code
    Then Order Details: Expect International Ship-To Phone Placeholder to be Phone
    Then Order Details: Expect International Ship-To Email Placeholder to be Email

    #Then Order Details: Set Ship-From to default
    #Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    #Then Order Details: Set Ounces to 1
    #Then Order Details: Set Service to "Priority Mail Package"

    #Then Order Details: Expect Item Qty to be 0
    #Then Order Details: Expect Item ID# to be ID#
    #Then Order Details: Expect Item Description to be Description

    Then Sign out
    #As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]



