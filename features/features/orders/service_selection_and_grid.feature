Feature:  Service Selection & Order Grid Values

  Background:
    Given I am signed in to Orders

  @parcel_select
  Scenario:  Rename Parcel Select
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope

    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Filter: Select Shipped
    Then Grid: Expect Service to be Parcel Select Ground

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Filter: Select Shipped
    Then Grid: Expect Service to be Parcel Select Ground

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Filter: Select Shipped
    Then Grid: Expect Service to be Parcel Select Ground

    Then Sign out

