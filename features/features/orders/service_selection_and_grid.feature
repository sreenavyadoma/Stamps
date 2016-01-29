Feature:  Service Selection & Order Grid Values

  Background:
    Given I am signed in to Orders

  @parcel_select
  Scenario:  Rename Parcel Select
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Service to "Parcel Select Ground Package"
    Then Order Details: Set Ounces to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print
    Then Filter Panel - Shipped
    Then Orders Grid: Expect Service to be Parcel Select Ground

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Order Details: Set Ounces to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print
    Then Filter Panel - Shipped
    Then Orders Grid: Expect Service to be Parcel Select Ground

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Service to "Parcel Select Ground Oversized Package"
    Then Order Details: Set Ounces to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print
    Then Filter Panel - Shipped
    Then Orders Grid: Expect Service to be Parcel Select Ground

    And Sign out

    #todo - rob