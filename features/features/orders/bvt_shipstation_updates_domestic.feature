
Feature:  Update Order to ShipStation

  Background:
    Given I am signed in to Orders

  @bvt_shipstation_updates_domestic
  Scenario:  Update ShipStation
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Domestic Address
      | name       | company      | street_address   | street_address_2| city    | state | zip    | country       |
      | First Last | Company Name | 777 N Orange Ave | Apt 100         | Orlando | FL    | 32801  | United States |

    #Then Details: Set Phone to 888-888-8888
    #Then Details: Set Email to rtest@stamps.com
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1

    Then Details: Select Service Priority Mail Package

    #Then Details: Set Insure-For to $100.00

    Then Details: Set Tracking to Signature Required

    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1

    Then Details: Set Reference Number to Update Orders To ShipStation

    Then Details: Add Item 1, Qty 1, ID Item 1 SKU, Description Item 1 Description

    Then Pause for 2 seconds
    Then Details: Blur out
    Then Details: Blur out
    Then Details: Blur out
    Then Pause for 3 seconds

    Then Grid: Uncheck Saved Order ID
    Then Pause for 5 seconds

    Then Refresh Browser

    Then Pause for 2 seconds
    Then Grid: Check Saved Order ID
    Then Pause for 2 seconds

    #Verify Single Order Details form was saved in ShipStation
    Then Details: Expect Ship-From saved value is the same

    Then Details: Expect Ship-To Name is First Last
    Then Details: Expect Ship-To Company Name is Company Name
    Then Details: Expect Ship-To Cleansed Street Address is 777 N Orange Ave Apt 100
    Then Details: Expect Ship-To Cleansed City is Orlando
    Then Details: Expect Ship-To Cleansed State is FL
    Then Details: Expect Ship-To Cleansed Zip Plus 4 Code is 32801-1175
    Then Details: Expect Ship-To Cleansed Zip Code is 32801
    #Then Details: Expect Ship-To Phone is 888-888-8888
    #Then Details: Expect Ship-To Email is rtest@stamps.com

    Then Details: Expect Pound is 1
    Then Details: Expect Ounce is 1

    Then Details: Expect Length is 1
    Then Details: Expect Width is 1
    Then Details: Expect Height is 1

    #Then Details: Expect Service Cost saved value is the same
    Then Details: Expect Service is Priority Mail Package

    #Then Details: Expect Insure-For is $100.00
    #Then Details: Expect Insure-For Cost saved value is the same

    Then Details: Expect Tracking is Signature Required
    Then Details: Expect Tracking Cost saved value is correct

    Then Details: Expect Reference Number is Update Orders To ShipStation

    #Verify Orders Grid data was saved in ShipStation
    Then Grid: Expect Store is Manual Orders
    Then Grid: Expect Order ID is the same as Details Form Order ID
    Then Grid: Expect Ship Cost is the same as Details Form Ship Cost
    Then Grid: Expect Age is < 24 hours
    Then Grid: Expect Order Date is populated

    Then Grid: Expect Recipient is First Last
    Then Grid: Expect Company is Company Name
    Then Grid: Expect Address is 777 N Orange Ave Apt 100
    Then Grid: Expect City is Orlando
    Then Grid: Expect State is FL
    Then Grid: Expect Zip is 32801-1175
    #Then Grid: Expect Phone is 888-888-8888
    #Then Grid: Expect Email is rtest@stamps.com

    Then Grid: Expect Qty. is 1
    Then Grid: Expect Item SKU is Item 1 SKU
    Then Grid: Expect Item Name is Item 1 Description

    Then Grid: Expect Service is Priority Mail

    Then Grid: Expect Weight is 1 lbs. 1 oz.

    Then Grid: Expect Tracking Service is Signature Required

    Then Grid: Expect Order Status is Awaiting Shipment

    Then Grid: Expect Pounds is 1
    Then Grid: Expect Ounces is 1

    #Then Grid: Expect Insured Value is $100.00

    Then Print: Open Modal
    Then Print: Close Modal

    Then Sign out

