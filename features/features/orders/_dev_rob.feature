
Feature: Test Development
  Background:
    Given I am signed in to Orders

  @rob_dev
  Scenario:
    Then Grid: Sort Order ID in Ascending Order

  Scenario:
    Then Toolbar: Add
    Then Details: Set Ship-To to random address in Zone 1
    Then Details: Set Ship-To to random address in Zone 2
    Then Details: Set Ship-To to random address in Zone 3
    Then Details: Set Ship-To to random address in Zone 4
    Then Details: Set Ship-To to random address in Zone 5
    Then Details: Set Ship-To to random address in Zone 6
    Then Details: Set Ship-To to random address in Zone 7
    Then Details: Set Ship-To to random address in Zone 8
    Then Sign out

  Scenario:
    Then Filter: Select Awaiting Shipment
    Then Toolbar: Move to Shipped
    Then Filter: Select Shipped
    Then Filter: Expect order moved to Shipped

    Then Toolbar: Move to Canceled
    Then Filter: Expect order moved to Canceled

    Then Filter: Move order to Awaiting Shipment
    Then Filter: Expect order moved to Awaiting Shipment

    Then Toolbar: Add
    Then Filter: Select Shipped
    Then Filter: Select Cancelled
    Then Filter: Select Awaiting Shipment
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 5 through 8
    Then Details: Set Email to random
    Then Details: Set Phone to random
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1
    Then Details: Set Height to 1
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Tracking to Signature Required
    Then Details: Set Insure-For to $50.25
    Then Details: Add Item 1, Qty 1, ID random, Description random

  Scenario:
    Then Toolbar: Add
    Then Filter: Select Awaiting Shipment
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address text area to Eight Zone,377 Santa Rosa Blvd,Fort Walton Beach, FL 32548
    Then Details: Set Email to random
    Then Details: Set Phone to random
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1
    Then Details: Set Height to 1
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Tracking to Signature Required
    Then Details: Set Tracking to USPS Tracking
    Then Details: Set Insure-For to $50.25
    Then Details: Add Item 1, Qty 1, ID random, Description random

  Scenario:
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Set Ounces to 5
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Tracking to USPS Tracking
    Then Print: Print
    Then Filter: Select Shipped
    Then Grid: Expect Tracking Number is populated
    Then Grid: Expect Order Status to be Shipped

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Set Ounces to 5
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Tracking to Signature Required
    Then Print: Print
    Then Filter: Select Shipped
    Then Grid: Expect Tracking Number is populated
    Then Grid: Expect Order Status to be Shipped

    Then Sign out


  Scenario:

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Print: Open Modal
    Then Print: Set Ship Date to today plus 1
    Then Print: Print
    Then Filter: Expect Shipped Tab Date Printed to be today
    Then Print: Set Ship Date to today plus 3

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Print: Open Modal
    Then Print: Set Ship Date to today plus 2
    Then Print: Print
    Then Filter: Expect Shipped Tab Date Printed to be today
    Then Filter: Expect Shipped Tab Ship Date to be today plus 2

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Print: Open Modal
    Then Print: Set Ship Date to today plus 3
    Then Print: Print
    Then Filter: Expect Shipped Tab Date Printed to be today
    Then Filter: Expect Shipped Tab Ship Date to be today plus 3

  Scenario:
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Print: Open Modal
    Then Print: Select left-side label
    Then Print: Expect left-side label selected

    Then Print: Select right-side label
    Then Print: Expect right-side label selected

    Then Print: Set Ship Date to today
    Then Print: Print
    Then Filter: Expect Shipped Tab Date Printed to be today
    Then Filter: Expect Shipped Tab Ship Date to be today

  @rob_dev2
  Scenario:
    Then List all Grid column values for row 1
    Then List all Grid column values for row 2

    Then Filter: Select Cancelled
    Then Filter: Select Awaiting Shipment
    Then Filter: Select Cancelled
    Then Filter: Select Shipped
    Then Filter: Select Cancelled
    Then Filter: Select Cancelled
    Then Filter: Select Awaiting Shipment
    Then Filter: Select Shipped
    Then Filter: Select Awaiting Shipment
    Then Filter: Select Shipped
    Then Filter: Select Cancelled
    Then Filter: Select Awaiting Shipment
    Then Filter: Select Shipped
    Then Filter: Select Cancelled

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Select Service First-Class Mail Large Envelope/Flat

    Then Print: Print

    Then Expect Awaiting Shipment count to be less by 1
    Then Expect printed Order ID is in Shipped tab

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Grid: Check row 1
    Then Print: Print
    Then Expect printed Order ID is not in Awaiting Shipment tab
    Then Expect printed Order ID is in Shipped tab

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Select Service First-Class Mail Large Envelope/Flat

    Then Toolbar: Add second order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Select Service First-Class Mail Large Envelope/Flat

    Then Toolbar: Add third order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope

    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Grid: Check row 3

    Then Print: Print

    Then Expect all printed Order IDs not in Awaiting Shipment tab
    Then Expect all printed Order IDs are in Shipped tab

  @rob_grid
  Scenario:
    Then List all Grid column values for row 1
    Then List all Grid column values for row 2
    Then List all Grid column values for row 3

  @rob_dev_customs_form_dropdowns
  Scenario: Syria Internal Transaction Number Required
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |

    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Details: Select Service Priority Mail International Flat Rate Envelope

  #Then Details: Select Service First-Class Mail International Large Envelope/Flat
    Then Details: Edit Customs Form
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    Then Customs: Add Item 1, Description random, Qty 1, Price 3000, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set ITN Number to "random"
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Sign out

  @_dev_rob
  Scenario: Domestic FPO Address
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Details: Set Ounces to 5
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs: Close Modal
    Then Print: Print

  @rob_dev_int
  Scenario:
    # International
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 2
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 100.50, Origin United States, Tariff 100
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Details: Select Service First-Class Mail International Large Envelope/Flat

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 2
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 100.50, Origin United States, Tariff 100
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Details: Select Service Priority Mail International Flat Rate Envelope
