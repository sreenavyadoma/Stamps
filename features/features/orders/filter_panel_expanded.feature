
Feature: As a batch shipper, I want is able to Filter Panel - orders by status [B-01621]

  Background:
    Given a valid user is signed in to Web Apps

   @filters
  Scenario: User Changes filters

    When In left Filter Panel, expect system displays expanded filters panel

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Ounces to 1

    Then In left Filter Panel, select Awaiting Shipment
    Then In left Filter Panel, expect selected filter is Awaiting Shipment

    Then on Order Details form, expect Order ID equals Grid Oder ID in row 1
    Then in Orders Grid, expect Recipient is James Test
    Then in Orders Grid, expect Company is Domestic Company
    Then in Orders Grid, expect Address is 600 Front St Apt 220
    Then in Orders Grid, expect City is San Diego
    Then in Orders Grid, expect State is CA
    Then in Orders Grid, expect Zip is 92101
    Then in Orders Grid, expect Phone is 8885551212
    Then in Orders Grid, expect Email is test@stamps.com

    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button

    Then In left Filter Panel, select Shipped
    Then In left Filter Panel, expect selected filter is Shipped

    Then in Orders Grid, expect Recipient is James Test
    Then in Orders Grid, expect Company is Domestic Company
    Then in Orders Grid, expect Address is 600 Front St Apt 220
    Then in Orders Grid, expect City is San Diego
    Then in Orders Grid, expect State is CA
    Then in Orders Grid, expect Zip is 92101
    Then in Orders Grid, expect Phone is 8885551212
    Then in Orders Grid, expect Email is test@stamps.com


    Then in Orders Toolbar, click Add button
    Then In left Filter Panel, expect selected filter is Awaiting Shipment


    Then Sign out

