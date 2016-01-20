
Feature: Test Development

  Background:
    Given I am signed in to Orders

  Scenario:
    When Add New Order

    Then Filter Awaiting Shipment
    Then Move order to Shipped
    Then Filter Shipped
    Then Expect order moved to Shipped

    Then Move order to Canceled
    Then Expect order moved to Canceled

    Then Move order to Awaiting Shipment
    Then Expect order moved to Awaiting Shipment

  @rand_ship_to_zone_5_8
  Scenario:
    When Add New Order
    Then Filter Shipped
    Then Filter Cancelled
    Then Filter Awaiting Shipment
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to random zrtone 5 through 8
    Then Order Details - Set Email to random
    Then Order Details - Set Phone to random
    Then Order Details - Set Service to "Priority Mail Large Package"
    Then Order Details - Set Pounds to 1
    Then Order Details - Set Ounces to 1
    Then Order Details - Set Height to 1
    Then Order Details - Set Length to 1
    Then Order Details - Set Width to 1
    Then Order Details - Set Tracking to "Signature Required"
    Then Order Details - Set Insure For to $50.25
    Then Order Details - Add Item 1 - Qty 1, ID random, Description random

  Scenario:
    When Add New Order
    Then Filter Awaiting Shipment
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to Eight Zone,377 Santa Rosa Blvd,Fort Walton Beach, FL 32548
    Then Order Details - Set Email to random
    Then Order Details - Set Phone to random
    Then Order Details - Set Service to "Priority Mail Large Package"
    Then Order Details - Set Pounds to 1
    Then Order Details - Set Ounces to 1
    Then Order Details - Set Height to 1
    Then Order Details - Set Length to 1
    Then Order Details - Set Width to 1
    And Order Details - Set Tracking to "Signature Required"
    Then Order Details - Set Tracking to "USPS Tracking"
    Then Order Details - Set Insure For to $50.25
    Then Order Details - Add Item 1 - Qty 1, ID random, Description random

  Scenario:
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    And Order Details - Set Tracking to "USPS Tracking"
    Then Print
    Then Filter Shipped
    Then Expect Grid Tracking Number is populated
    Then Expect Order Status to be "Shipped"

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    And Order Details - Set Tracking to "Signature Required"
    Then Print
    Then Filter Shipped
    Then Expect Grid Tracking Number is populated
    Then Expect Order Status to be "Shipped"

    Then Sign out


  Scenario:

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    Then Print
    Then Expect Grid Ship Date for this order to be today
    Then Expect Grid Date Printed for this order to be today

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Print Modal - Set Ship Date to today plus 1
    Then Print
    Then Expect Grid Date Printed for this order to be today
    Then Expect Grid Ship Date for this order to be today plus 1

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Print Modal - Set Ship Date to today plus 2
    Then Print
    Then Expect Grid Date Printed for this order to be today
    Then Expect Grid Ship Date for this order to be today plus 2

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Print Modal - Set Ship Date to today plus 3
    Then Print
    Then Expect Grid Date Printed for this order to be today
    Then Expect Grid Ship Date for this order to be today plus 3
  Scenario:

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Length to 1
    Then Order Details - Set Height to 1
    Then Order Details - Set Width to 1
    Then Open Print Modal
    Then Print Modal - Set Ship Date to today plus 1
    And Print
    Then Expect Shipped Tab Date Printed to be today
    Then Print Modal - Set Ship Date to today plus 3

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Length to 1
    Then Order Details - Set Height to 1
    Then Order Details - Set Width to 1
    Then Open Print Modal
    Then Print Modal - Set Ship Date to today plus 2
    And Print
    Then Expect Shipped Tab Date Printed to be today
    Then Expect Shipped Tab Ship Date to be today plus 2

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Length to 1
    Then Order Details - Set Height to 1
    Then Order Details - Set Width to 1
    Then Open Print Modal
    Then Print Modal - Set Ship Date to today plus 3
    And Print
    Then Expect Shipped Tab Date Printed to be today
    Then Expect Shipped Tab Ship Date to be today plus 3

  Scenario:
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Length to 1
    Then Order Details - Set Height to 1
    Then Order Details - Set Width to 1
    Then Open Print Modal
    And Print Modal - Select left-side label
    Then Expect Print Modal left-side label selected

    And Print Modal - Select right-side label
    Then Expect Print Modal right-side label selected

    Then Print Modal - Set Ship Date to today
    And Print
    Then Expect Shipped Tab Date Printed to be today
    Then Expect Shipped Tab Ship Date to be today

  @rob_dev2
  Scenario:
    And List all Grid column values for row 1
    And List all Grid column values for row 2

    Then Filter Cancelled
    Then Filter Awaiting Shipment
    Then Filter Cancelled
    Then Filter Shipped
    Then Filter Cancelled
    Then Filter Cancelled
    Then Filter Awaiting Shipment
    Then Filter Shipped
    Then Filter Awaiting Shipment
    Then Filter Shipped
    Then Filter Cancelled
    Then Filter Awaiting Shipment
    Then Filter Shipped
    Then Filter Cancelled

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "First-Class Mail Large Envelope/Flat"

    Then Print

    Then Expect Awaiting Shipment count to be less by 1
    Then Expect printed Order ID is in Shipped tab

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "First-Class Mail Large Envelope/Flat"
    Then Orders Grid - Check row 1
    Then Print
    Then Expect printed Order ID is not in Awaiting Shipment tab
    Then Expect printed Order ID is in Shipped tab

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "First-Class Mail Large Envelope/Flat"

    And I Add a second order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "First-Class Mail Large Envelope/Flat"

    And I Add a third order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Media Mail Package"

    Then Orders Grid - Check row 1
    Then Orders Grid - Check row 2
    Then Orders Grid - Check row 3

    Then Print

    Then Expect all printed Order IDs not in Awaiting Shipment tab
    Then Expect all printed Order IDs are in Shipped tab

  @rob_grid
  Scenario:
    Then List all Grid column values for row 1
    Then List all Grid column values for row 2
    Then List all Grid column values for row 3

  @rob_dev_customs_form_dropdowns
  Scenario: Syria Internal Transaction Number Required
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |

    Then Order Details - Set Ounces to 5
    Then Order Details - Set Length to 1
    Then Order Details - Set Height to 1
    Then Order Details - Set Width to 1
    Then Order Details - Set Service to "Priority Mail International Flat Rate Envelope"

  #Then Order Details - Set Service to "First-Class Mail International Large Envelope/Flat"
    And Open Customs Form
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    And Customs Form - Add Item 1 - Description random, Qty 1, Price 3000, Lbs 1, Oz 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs Form - Set ITN# to "random"
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    And Sign out

  @_dev_rob
  Scenario: Domestic FPO Address
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To Country to United States
    Then Order Details - Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Length to 1
    Then Order Details - Set Height to 1
    Then Order Details - Set Width to 1
    Then Order Details - Set Service to "Priority Mail Package"
    And Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    And Customs Form - Add Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Close Customs Form
    Then Print

  @rob_dev_int
  Scenario:
    # International
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then Order Details - Set Ounces to 2
    And Order Details - Set Pounds to 2
    And Open Customs Form
    And Customs Form - Add Item 1 - Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Order Details - Set Service to "First-Class Mail International Large Envelope/Flat"

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    And Order Details - Set Ounces to 2
    And Order Details - Set Pounds to 2
    And Open Customs Form
    And Customs Form - Add Item 1 - Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Order Details - Set Service to "Priority Mail International Flat Rate Envelope"
