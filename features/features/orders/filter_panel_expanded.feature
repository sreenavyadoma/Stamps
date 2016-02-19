
Feature: As a batch shipper, I want to be able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in to Orders

   @filters
  Scenario: User Changes filters

    When Expect system displays expanded filters panel

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To address to
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Ounces to 1

    Then Filter Panel - Awaiting Shipment
    Then Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter

    Then Order Details: Expect Order ID equals Grid order ID
    Then Orders Grid: Expect Recipient to be James Test
    Then Orders Grid: Expect Company to be Domestic Company
    Then Orders Grid: Expect Address to be 600 Front St Apt 220
    Then Orders Grid: Expect City to be San Diego
    Then Orders Grid: Expect State to be CA
    Then Orders Grid: Expect Zip to be 92101
    Then Orders Grid: Expect Phone to be 8885551212
    Then Orders Grid: Expect Email to be test@stamps.com

    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print

    Then Filter Panel - Shipped
    Then Expect system selects Shipped Filter Panel - and deselects the previous filter

    Then Orders Grid: Expect Recipient to be James Test
    Then Orders Grid: Expect Company to be Domestic Company
    Then Orders Grid: Expect Address to be 600 Front St Apt 220
    Then Orders Grid: Expect City to be San Diego
    Then Orders Grid: Expect State to be CA
    Then Orders Grid: Expect Zip to be 92101
    Then Orders Grid: Expect Phone to be 8885551212
    Then Orders Grid: Expect Email to be test@stamps.com


    Then Add New Order
    Then Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter


    Then Sign out

