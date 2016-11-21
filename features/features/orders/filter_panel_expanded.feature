
Feature: As a batch shipper, I want is able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in to Orders

   @filters
  Scenario: User Changes filters

    When Left Panel: Expect system displays expanded filters panel

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to domestic address
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 1

    Then Left Panel: Select Awaiting Shipment
    Then Left Panel: Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter

    Then Details: Expect Order ID equals Grid order ID
    Then Grid: Expect Recipient is James Test
    Then Grid: Expect Company is Domestic Company
    Then Grid: Expect Address is 600 Front St Apt 220
    Then Grid: Expect City is San Diego
    Then Grid: Expect State is CA
    Then Grid: Expect Zip is 92101
    Then Grid: Expect Phone is 8885551212
    Then Grid: Expect Email is test@stamps.com

    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print

    Then Left Panel: Select Shipped
    Then Left Panel: Expect system selects Shipped Filter Panel - and deselects the previous filter

    Then Grid: Expect Recipient is James Test
    Then Grid: Expect Company is Domestic Company
    Then Grid: Expect Address is 600 Front St Apt 220
    Then Grid: Expect City is San Diego
    Then Grid: Expect State is CA
    Then Grid: Expect Zip is 92101
    Then Grid: Expect Phone is 8885551212
    Then Grid: Expect Email is test@stamps.com


    Then Toolbar: Add
    Then Left Panel: Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter


    Then Sign out

