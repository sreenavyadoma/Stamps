
Feature:  Update Order to ShipStation

  Background:
    Given I am signed in to Orders

  @shipstation_updates_domestic
  Scenario:  Update ShipStation
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to domestic address
      | name       | company      | street_address   | street_address_2| city    | state | zip    | country       | phone        |  email           |
      | First Last | Company Name | 777 N Orange Ave | Apt 100         | Orlando | FL    | 32801  | United States | 888-888-8888 | rtest@stamps.com |

    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1

    Then Details: Select Service Priority Mail Package

    Then Details: Set Insure-For to $1.00

    Then Details: Set Tracking to Signature Required

    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1

    Then Details: Set Reference Number to Update Orders To ShipStation

    Then Details: Add Item 1, Qty 1, ID Item 1 SKU, Description Item 1 Description

    Then Pause for 2 seconds
    Then Details: Blur out

    Then Grid: Uncheck Saved Order ID
    Then Pause for 5 seconds

    Then Refresh Browser

    Then Pause for 2 seconds
    Then Grid: Check Saved Order ID
    Then Pause for 2 seconds

    #Verify Single Order Details form was saved in ShipStation
    Then Details: Expect Ship-To Name to be First Last
    Then Details: Expect Ship-To Company Name to be Company Name
    Then Details: Expect Ship-To Cleansed Street Address to be 777 N Orange Ave Apt 100
    Then Details: Expect Ship-To Cleansed City to be Orlando
    Then Details: Expect Ship-To Cleansed State to be FL
    Then Details: Expect Ship-To Cleansed Zip Plus 4 Code to be 32801-1175
    Then Details: Expect Ship-To Cleansed Zip Code to be 32801
    Then Details: Expect Ship-To Phone to be 888-888-8888
    Then Details: Expect Ship-To Email to be rtest@stamps.com

    Then Details: Hide Ship-To fields
    Then Details: Expect Pounds to be 1
    Then Details: Expect Ounces to be 1

    Then Details: Expect Length to be 1
    Then Details: Expect Width to be 1
    Then Details: Expect Height to be 1

    Then Details: Expect Service to be Priority Mail Package
    Then Details: Expect Service Cost is the same as saved value

    Then Details: Expect Reference Number to be Update Orders To ShipStation

    Then Details: Expect Tracking to be Signature Required

    #Verify Orders Grid data was saved in ShipStation
    Then Grid: Expect Store to be Manual Orders
    Then Grid: Expect Order ID is the same as Details Form Order ID
    Then Grid: Expect Ship Cost is the same as Details Form Ship Cost
    Then Grid: Expect Age to be < 24 hours
    Then Grid: Expect Order Date is populated

    Then Grid: Expect Recipient to be First Last
    Then Grid: Expect Company to be Company Name
    Then Grid: Expect Address to be 777 N Orange Ave Apt 100
    Then Grid: Expect City to be Orlando
    Then Grid: Expect State to be FL
    Then Grid: Expect Zip to be 32801-1175
    Then Grid: Expect Phone to be 888-888-8888
    Then Grid: Expect Email to be rtest@stamps.com

    Then Grid: Expect Qty. to be 1
    Then Grid: Expect Item SKU to be Item 1 SKU
    Then Grid: Expect Item Name to be Item 1 Description

    Then Grid: Expect Service to be Priority Mail

    Then Grid: Expect Weight to be 1 lbs. 1 oz.

    Then Grid: Expect Tracking Service to be Signature Required

    Then Grid: Expect Order Status to be Awaiting Shipment

    Then Grid: Expect Pounds to be 1
    Then Grid: Expect Ounces to be 1

    Then Grid: Expect Insured Value to be $1.00

    Then Print: Open Modal
    Then Print: Close Modal

    Then Sign out

