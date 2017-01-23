
Feature:  Update Order to ShipStation

  Background:
    Given I am signed in to Orders

  @bvt_shipstation_updates_domestic
  Scenario:  Update ShipStation
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address
      | name       | company      | street_address   | street_address_2| city    | state | zip    | country       |
      | First Last | Company Name | 777 N Orange Ave | Apt 100         | Orlando | FL    | 32801  | United States |

    #Then Order Details: Set Phone to 888-888-8888
    #Then Order Details: Set Email to rtest@stamps.com
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1

    Then Order Details: Select Service PM Package

    Then Order Details: Set Insure-For to $100.00

    Then Order Details: Set Tracking to Signature Required

    Then Order Details: Set Length to 1
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1

    Then Order Details: Set Reference Number to Update Orders To ShipStation

    Then Order Details: Add Item 1, Qty 1, ID Item 1 SKU, Description Item 1 Description

    Then Pause for 2 seconds
    Then Order Details: Blur out
    Then Order Details: Blur out
    Then Order Details: Blur out
    Then Pause for 3 seconds

    Then Orders Grid: Uncheck Saved Order ID
    Then Pause for 5 seconds

    Then Refresh Browser

    Then Pause for 7 seconds
    Then Orders Grid: Check saved Order ID
    Then Pause for 2 seconds

    #Verify Single Order Details form was saved in ShipStation
    Then Order Details: Expect Ship-From saved value is the same

    Then Order Details: Expect Ship-To Name is First Last
    Then Order Details: Expect Ship-To Company Name is Company Name
    Then Order Details: Expect Ship-To Cleansed Street Address is 777 N Orange Ave Apt 100
    Then Order Details: Expect Ship-To Cleansed City is Orlando
    Then Order Details: Expect Ship-To Cleansed State is FL
    Then Order Details: Expect Ship-To Cleansed Zip Plus 4 Code is 32801-1175
    Then Order Details: Expect Ship-To Cleansed Zip Code is 32801
    #Then Order Details: Expect Ship-To Phone is 888-888-8888
    #Then Order Details: Expect Ship-To Email is rtest@stamps.com

    Then Order Details: Expect Pound is 1
    Then Order Details: Expect Ounce is 1

    Then Order Details: Expect Length is 1
    Then Order Details: Expect Width is 1
    Then Order Details: Expect Height is 1

    #Then Order Details: Expect Service Cost saved value is the same
    Then Order Details: Expect Service is PM Package
    Then Order Details: Expect Service Cost saved value is the same

    Then Order Details: Expect Insure-For is $100.00
    Then Order Details: Expect Insure-For Cost saved value is the same

    Then Order Details: Expect Tracking is Signature Required
    Then Order Details: Expect Tracking Cost saved value is correct

    Then Order Details: Expect Reference Number is Update Orders To ShipStation

    #Verify Orders Grid data was saved in ShipStation
    Then Orders Grid: Expect Store is Manual Orders
    Then Orders Grid: Expect Order ID is the same as Details Form Order ID
    Then Orders Grid: Expect Ship Cost is the same as Details Form Ship Cost
    Then Orders Grid: Expect Age is < 24 hours
    Then Orders Grid: Expect Order Date is populated

    Then Orders Grid: Expect Recipient is First Last
    Then Orders Grid: Expect Company is Company Name
    Then Orders Grid: Expect Address is 777 N Orange Ave Apt 100
    Then Orders Grid: Expect City is Orlando
    Then Orders Grid: Expect State is FL
    Then Orders Grid: Expect Zip is 32801-1175
    #Then Orders Grid: Expect Phone is 888-888-8888
    #Then Orders Grid: Expect Email is rtest@stamps.com

    Then Orders Grid: Expect Qty. is 1
    Then Orders Grid: Expect Item SKU is Item 1 SKU
    Then Orders Grid: Expect Item Name is Item 1 Description

    Then Orders Grid: Expect Service is Priority Mail

    Then Orders Grid: Expect Weight is 1 lb. 1 oz.

    Then Orders Grid: Expect Tracking Service is Signature Required

    Then Orders Grid: Expect Order Status is Awaiting Shipment

    Then Orders Grid: Expect Pounds is 1
    Then Orders Grid: Expect Ounces is 1

    Then Orders Grid: Expect Insured Value is $100.00

    Then Print Modal: Open Print Modal
    Then Print Modal: Close Print Modal

    Then Sign out

