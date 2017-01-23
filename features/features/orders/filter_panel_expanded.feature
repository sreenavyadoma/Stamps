
Feature: As a batch shipper, I want is able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in to Orders

   @filters
  Scenario: User Changes filters

    When Filter Panel: Expect system displays expanded filters panel

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then Order Details: Select Service PM Package
    Then Order Details: Set Ounces to 1

    Then Filter Panel: Select Awaiting Shipment
    Then Filter Panel: Expect selected filter is Awaiting Shipment

    Then Order Details: Expect Order ID equals Grid Oder ID in row 1
    Then Orders Grid: Expect Recipient is James Test
    Then Orders Grid: Expect Company is Domestic Company
    Then Orders Grid: Expect Address is 600 Front St Apt 220
    Then Orders Grid: Expect City is San Diego
    Then Orders Grid: Expect State is CA
    Then Orders Grid: Expect Zip is 92101
    Then Orders Grid: Expect Phone is 8885551212
    Then Orders Grid: Expect Email is test@stamps.com

    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print

    Then Filter Panel: Select Shipped
    Then Filter Panel: Expect selected filter is Shipped

    Then Orders Grid: Expect Recipient is James Test
    Then Orders Grid: Expect Company is Domestic Company
    Then Orders Grid: Expect Address is 600 Front St Apt 220
    Then Orders Grid: Expect City is San Diego
    Then Orders Grid: Expect State is CA
    Then Orders Grid: Expect Zip is 92101
    Then Orders Grid: Expect Phone is 8885551212
    Then Orders Grid: Expect Email is test@stamps.com


    Then Orders Toolbar: Add
    Then Filter Panel: Expect selected filter is Awaiting Shipment


    Then Sign out

