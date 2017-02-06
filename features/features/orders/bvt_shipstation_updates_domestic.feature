
Feature:  Update Order to ShipStation

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipstation_updates_domestic
  Scenario:  Update ShipStation
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address
      | name       | company      | street_address   | street_address_2| city    | state | zip    | country       |
      | First Last | Company Name | 777 N Orange Ave | Apt 100         | Orlando | FL    | 32801  | United States |

    Then on Order Details form, set Phone to 888-888-8888
    Then on Order Details form, set Email to rtest@stamps.com
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Insure-For to $100.00
    Then on Order Details form, set Tracking to Signature Required
    Then on Order Details form, set Length to 1
    Then on Order Details form, set Width to 1
    Then on Order Details form, set Height to 1

    Then on Order Details form, set Reference Number to Update Orders To ShipStation
    Then on Order Details form, Add Item 1, Qty 1, ID Item 1 SKU, Description Item 1 Description

    Then Pause for 2 seconds
    Then on Order Details form, blur out
    Then on Order Details form, blur out
    Then on Order Details form, blur out
    Then Pause for 3 seconds

    Then In Orders Grid, uncheck saved Order ID
    Then Pause for 5 seconds

    Then Refresh the browser

    Then Pause for 7 seconds
    Then In Orders Grid, check saved Order ID
    Then Pause for 2 seconds

    #Verify Single Order Details form was saved in ShipStation
    Then on Order Details form, expect Ship-From saved value is the same

    Then on Order Details form, expect Ship-To Name is First Last
    Then on Order Details form, expect Ship-To Company Name is Company Name
    Then on Order Details form, expect Ship-To Cleansed Street Address is 777 N Orange Ave Apt 100
    Then on Order Details form, expect Ship-To Cleansed City is Orlando
    Then on Order Details form, expect Ship-To Cleansed State is FL
    Then on Order Details form, expect Ship-To Cleansed Zip Plus 4 Code is 32801-1175
    Then on Order Details form, expect Ship-To Cleansed Zip Code is 32801
    Then on Order Details form, expect Ship-To Phone is 888-888-8888
    Then on Order Details form, expect Ship-To Email is rtest@stamps.com

    Then on Order Details form, expect Pound is 1
    Then on Order Details form, expect Ounce is 1

    Then on Order Details form, expect Length is 1
    Then on Order Details form, expect Width is 1
    Then on Order Details form, expect Height is 1

    #Then on Order Details form, expect service Cost saved value is the same
    Then on Order Details form, expect service is PM Package
    Then on Order Details form, expect service Cost saved value is the same

    Then on Order Details form, expect Insure-For is $100.00
    Then on Order Details form, expect Insure-For Cost saved value is the same

    Then on Order Details form, expect Tracking is Signature Required
    Then on Order Details form, expect Tracking Cost saved value is correct

    Then on Order Details form, expect Reference Number is Update Orders To ShipStation

    #Verify Orders Grid data was saved in ShipStation
    Then In Orders Grid, expect Store is Manual Orders
    Then In Orders Grid, expect Order ID is the same as Details Form Order ID
    Then In Orders Grid, expect Ship Cost is the same as Details Form Ship Cost
    Then In Orders Grid, expect Age is < 24 hours
    Then In Orders Grid, expect Order Date is populated

    Then In Orders Grid, expect Recipient is First Last
    Then In Orders Grid, expect Company is Company Name
    Then In Orders Grid, expect Address is 777 N Orange Ave Apt 100
    Then In Orders Grid, expect City is Orlando
    Then In Orders Grid, expect State is FL
    Then In Orders Grid, expect Zip is 32801-1175
    Then In Orders Grid, expect Phone is 888-888-8888
    Then In Orders Grid, expect Email is rtest@stamps.com

    Then In Orders Grid, expect Qty. is 1
    Then In Orders Grid, expect Item SKU is Item 1 SKU
    Then In Orders Grid, expect Item Name is Item 1 Description

    Then In Orders Grid, expect service is Priority Mail

    Then In Orders Grid, expect Weight is 1 lb. 1 oz.

    Then In Orders Grid, expect Tracking service is Signature Required

    Then In Orders Grid, expect Order Status is Awaiting Shipment

    Then In Orders Grid, expect Pounds is 1
    Then In Orders Grid, expect Ounces is 1

    Then In Orders Grid, expect Insured Value is $100.00

    Then in Orders Toolbar, click Print button
    Then in Print modal, click Close button

    Then Sign out

