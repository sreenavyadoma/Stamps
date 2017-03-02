
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

    Then in Orders Grid, uncheck saved Order ID
    Then Pause for 5 seconds

    Then Refresh the browser

    Then Pause for 7 seconds
    Then in Orders Grid, check saved Order ID
    Then Pause for 2 seconds

    #Verify Single Order Details form was saved in ShipStation
    Then on Order Details form, expect Ship-From and Ship-From saved values are the same

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

    #Then on Order Details form, expect Service Cost and saved Service Cost values are the same
    Then on Order Details form, expect service is PM Package
    Then on Order Details form, expect Service Cost and saved Service Cost values are the same

    Then on Order Details form, expect Insure-For is $100.00
    Then on Order Details form, expect Insure-For Cost and saved Insure-For Cost values are the same

    Then on Order Details form, expect Tracking is Signature Required
    Then on Order Details form, expect Tracking Cost and saved Tracking Cost values are the same

    Then on Order Details form, expect Reference Number is Update Orders To ShipStation

    #Verify Orders Grid data was saved in ShipStation
    Then expect Orders Grid Store is Manual Orders
    Then expect Orders Grid Order ID is the same as Details Form Order ID
    Then expect Orders Grid Ship Cost is the same as Details Form Ship Cost
    Then expect Orders Grid Age is < 24 hours
    Then expect Orders Grid Order Date is populated

    Then expect Orders Grid Recipient is correct
    Then expect Orders Grid Company is Company Name
    Then expect Orders Grid Address is 777 N Orange Ave Apt 100
    Then expect Orders Grid City is Orlando
    Then expect Orders Grid State is FL
    Then expect Orders Grid Zip is 32801-1175
    Then expect Orders Grid Phone is 888-888-8888
    Then expect Orders Grid Email is rtest@stamps.com

    Then expect Orders Grid Qty. is 1
    Then expect Orders Grid Item SKU is Item 1 SKU
    Then expect Orders Grid Item Name is Item 1 Description

    Then expect Orders Grid service is Priority Mail

    Then expect Orders Grid Weight is 1 lb. 1 oz.

    Then expect Orders Grid Tracking service is Signature Required

    Then expect Orders Grid Order Status is Awaiting Shipment

    Then expect Orders Grid Pounds is 1
    Then expect Orders Grid Ounces is 1

    Then expect Orders Grid Insured Value is $100.00

    Then in Orders Toolbar, click Print button
    Then in Print modal, click Close button

    Then Sign out

