Feature:  Service Selection & Order Grid Values

  Background:
    Given I am signed in to Orders

  @parcel_select
  Scenario:  Rename Parcel Select
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Parcel Select Ground Package"
    Then Details: Set Ounces to 1
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Toolbar: Print
    Then Filter: Select Shipped
    Then Grid: Expect Service to be Parcel Select Ground

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Details: Set Ounces to 1
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Toolbar: Print
    Then Filter: Select Shipped
    Then Grid: Expect Service to be Parcel Select Ground

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Details: Set Ounces to 1
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Toolbar: Print
    Then Filter: Select Shipped
    Then Grid: Expect Service to be Parcel Select Ground

    Then Sign out

