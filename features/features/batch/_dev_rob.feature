
Feature: Test Development

  Background:
    Given I am signed in as a batch shipper

  @rob_dev1
  Scenario:
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    And Set Order Details Form Tracking to "USPS Tracking"
    Then Print
    Then Filter Shipped Orders
    Then Expect Grid Tracking Number is populated
    Then Expect Order Status to be "Shipped"

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    And Set Order Details Form Tracking to "Signature Required"
    Then Print
    Then Filter Shipped Orders
    Then Expect Grid Tracking Number is populated
    Then Expect Order Status to be "Shipped"

    Then Sign out


  Scenario:

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    Then Print
    Then Expect Grid Ship Date to be today
    Then Expect Grid Date Printed to be today

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Set Print Modal Ship Date to today plus 1
    Then Print
    Then Expect Grid Date Printed to be today
    Then Expect Grid Ship Date to be today plus 1

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Set Print Modal Ship Date to today plus 2
    Then Print
    Then Expect Grid Date Printed to be today
    Then Expect Grid Ship Date to be today plus 2

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Set Print Modal Ship Date to today plus 3
    Then Print
    Then Expect Grid Date Printed to be today
    Then Expect Grid Ship Date to be today plus 3
  Scenario:

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Length to 1
    Then Set Order Details Form Height to 1
    Then Set Order Details Form Width to 1
    And Open Print Modal
    Then Set Print Modal Ship Date to today plus 1
    And Print
    Then Expect Shipped Tab Date Printed to be today
    Then Set Print Modal Ship Date to today plus 3

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Length to 1
    Then Set Order Details Form Height to 1
    Then Set Order Details Form Width to 1
    And Open Print Modal
    Then Set Print Modal Ship Date to today plus 2
    And Print
    Then Expect Shipped Tab Date Printed to be today
    Then Expect Shipped Tab Ship Date to be today plus 2

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Length to 1
    Then Set Order Details Form Height to 1
    Then Set Order Details Form Width to 1
    And Open Print Modal
    Then Set Print Modal Ship Date to today plus 3
    And Print
    Then Expect Shipped Tab Date Printed to be today
    Then Expect Shipped Tab Ship Date to be today plus 3

  Scenario:
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Length to 1
    Then Set Order Details Form Height to 1
    Then Set Order Details Form Width to 1
    And Open Print Modal
    And Select Print Modal left-side label
    Then Expect Print Modal left-side label selected

    And Select Print Modal right-side label
    Then Expect Print Modal right-side label selected

    Then Set Print Modal Ship Date to today
    And Print
    Then Expect Shipped Tab Date Printed to be today
    Then Expect Shipped Tab Ship Date to be today

  @rob_dev2
  Scenario:
    And List all Grid column values for row 1
    And List all Grid column values for row 2

    Then Filter Cancelled Orders
    Then Filter Awaiting Shipment Orders
    Then Filter Cancelled Orders
    Then Filter Shipped Orders
    Then Filter Cancelled Orders
    Then Filter Cancelled Orders
    Then Filter Awaiting Shipment Orders
    Then Filter Shipped Orders
    Then Filter Awaiting Shipment Orders
    Then Filter Shipped Orders
    Then Filter Cancelled Orders
    Then Filter Awaiting Shipment Orders
    Then Filter Shipped Orders
    Then Filter Cancelled Orders

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "First-Class Mail Large Envelope/Flat"

    Then Print

    Then Expect Awaiting Shipment count to be less by 1
    Then Expect printed Order ID is in Shipped tab

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "First-Class Mail Large Envelope/Flat"
    Then Edit row 1 on the order grid
    Then Print
    Then Expect printed Order ID is not in Awaiting Shipment tab
    Then Expect printed Order ID is in Shipped tab

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "First-Class Mail Large Envelope/Flat"

    And I Add a second order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "First-Class Mail Large Envelope/Flat"

    And I Add a third order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Media Mail Package"

    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Edit row 3 on the order grid

    Then Print

    Then Expect all printed Order IDs not in Awaiting Shipment tab
    Then Expect all printed Order IDs are in Shipped tab

  @rob_grid
  Scenario:
    Then List all Grid column values for row 1
    Then List all Grid column values for row 2
    Then List all Grid column values for row 3

  @rob_dev_customs_form_dropdowns
  Scenario: Syria - Internal Transaction # Required
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |

    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Length to 1
    Then Set Order Details Form Height to 1
    Then Set Order Details Form Width to 1
    Then Set Order Details Form Service to "Priority Mail International Package"

  #Then Set Order Details Form Service to "First-Class Mail International Large Envelope/Flat"
    And Open customs form
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form
    And Sign out

  @_dev_rob
  Scenario: Domestic FPO Address
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To country to United States
    Then Set Order Details Form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set Order Details Form Ounces to 5
    Then Set Order Details Form Length to 1
    Then Set Order Details Form Height to 1
    Then Set Order Details Form Width to 1
    Then Set Order Details Form Service to "Priority Mail Package"
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Print

  @rob_dev_int
  Scenario:
    # International
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then Add Order Details Form Item - Quantity 1, ID random, Description random
    Then Set Order Details Form Ounces to 2
    And Set Order Details Form Pounds to 2
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 100
    Then Set customs form I agree to true
    Then Close customs form
    Then Set Order Details Form Service to "First-Class Mail International Large Envelope/Flat"

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then Add Order Details Form Item - Quantity 1, ID random, Description random
    And Set Order Details Form Ounces to 2
    And Set Order Details Form Pounds to 2
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 100
    Then Set customs form I agree to true
    Then Close customs form
    Then Set Order Details Form Service to "Priority Mail International Flat Rate Envelope"
