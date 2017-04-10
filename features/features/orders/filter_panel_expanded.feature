
Feature: As a batch shipper, I want is able to Filter Panel - orders by status [B-01621]

  Background:
    Given a valid user is signed in to Web Apps

   @filters
  Scenario: User Changes filters

    When In left Filter Panel, expect system displays expanded filters panel

    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo
    Then set Order Details form Ship-To to Domestic Address
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1

    Then In left Filter Panel, select Awaiting Shipment
    Then In left Filter Panel, expect selected filter is Awaiting Shipment

    Then expect Order Details form Order ID equals Grid Oder ID in row 1
    Then expect Orders Grid Recipient is James Test
    Then expect Orders Grid Company is Domestic Company
    Then expect Orders Grid Address is 600 Front St Apt 220
    Then expect Orders Grid City is San Diego
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 92101
    Then expect Orders Grid Phone is 8885551212
    Then expect Orders Grid Email is test@stamps.com

    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then in Print modal, click Print button

    Then In left Filter Panel, select Shipped
    Then In left Filter Panel, expect selected filter is Shipped

    Then expect Orders Grid Recipient is James Test
    Then expect Orders Grid Company is Domestic Company
    Then expect Orders Grid Address is 600 Front St Apt 220
    Then expect Orders Grid City is San Diego
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 92101
    Then expect Orders Grid Phone is 8885551212
    Then expect Orders Grid Email is test@stamps.com


    Then click Orders Toolbar Add button
    Then In left Filter Panel, expect selected filter is Awaiting Shipment


    Then Sign out

