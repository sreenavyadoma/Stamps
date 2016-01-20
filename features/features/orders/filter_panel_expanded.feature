
Feature: As a batch shipper, I want to be able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in to Orders

   @filters
  Scenario: User Changes filters

    When Expect system displays expanded filters panel

    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To Country to United States
    Then Order Details - Set Ship-To address to
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 1

    Then Filter Panel - Awaiting Shipment
    And Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter

    And Expect Order Details Order ID equals Grid order ID
    Then Expect Grid Recipient to be James Test
    Then Expect Grid Company to be Domestic Company
    Then Expect Grid Address to be 600 Front St Apt 220
    Then Expect Grid City to be San Diego
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 92101
    Then Expect Grid Phone to be 8885551212
    Then Expect Grid Email to be test@stamps.com

    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal - Set Printer to "factory"
    Then Toolbar - Print

    Then Filter Panel - Shipped
    And Expect system selects Shipped Filter Panel - and deselects the previous filter

    Then Expect Grid Recipient to be James Test
    Then Expect Grid Company to be Domestic Company
    Then Expect Grid Address to be 600 Front St Apt 220
    Then Expect Grid City to be San Diego
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 92101
    Then Expect Grid Phone to be 8885551212
    Then Expect Grid Email to be test@stamps.com


    Then Add New Order
    And Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter


    Then Sign out

