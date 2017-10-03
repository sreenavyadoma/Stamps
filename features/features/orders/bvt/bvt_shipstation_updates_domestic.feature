
Feature:  Update Order to ShipStation

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipstation_updates_domestic
  Scenario: Update ShipStation
    Then add new order
    Then set Order Details form Ship-To Domestic address to
      | full_name       | company      | street_address   | street_address_2| city    | state | zip    | country  |
      | First Last | Company Name | 777 N Orange Ave | Apt 100         | Orlando | FL    | 32801  | United States |

    Then set Order Details form Phone to 888-888-8888
    Then set Order Details form Email to rtest@stamps.com
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Insure-For to $100.00
    Then set Order Details form Tracking to Signature Required
    Then set Order Details form Length to 1
    Then set Order Details form Width to 1
    Then set Order Details form Height to 1

    Then expect Orders Grid service is Priority Mail
    Then expect Orders Grid service is PM Package
    Then expect Orders Grid service is correct

    Then set Order Details form Reference Number to Update Orders To ShipStation
    Then on Order Details form, Add Item 1, Qty 1, ID Item 1 SKU, Description Item 1 Description

    Then Pause for 2 seconds
    Then blur out on Order Details form 10 times
    Then Pause for 2 seconds

    Then uncheck orders grid cached order id

    Then Pause for 2 seconds
    Then check orders grid cached order id
    Then Pause for 2 seconds
    Then blur out on Order Details form 20 times

    #Verify Single Order Details form was saved in ShipStation
    Then expect Order Details form Ship-From and Ship-From saved values are the same

    Then expect Order Details form Ship-To Name is First Last
    Then expect Order Details form Ship-To Company Name is Company Name
    Then expect Order Details form Ship-To Cleansed Street Address is 777 N Orange Ave Apt 100
    Then expect Order Details form Ship-To Cleansed City is Orlando
    Then expect Order Details form Ship-To Cleansed State is FL
    Then expect Order Details form Ship-To Cleansed Zip Plus 4 Code is 32801-1175
    Then expect Order Details form Ship-To Cleansed Zip Code is 32801
    Then expect Order Details form Ship-To Phone is 888-888-8888
    Then expect Order Details form Ship-To Email is rtest@stamps.com

    Then expect Order Details form Pound is 1
    Then expect Order Details form Ounce is 1

    Then expect Order Details form Length is 1
    Then expect Order Details form Width is 1
    Then expect Order Details form Height is 1

    Then expect Order Details form service is correct
    Then expect Order Details form Service Cost is correct

    Then expect Order Details form Insure-For is 100.00
    Then expect Order Details form Insure-For Cost is correct

    Then expect Order Details form Tracking is correct
    Then expect Order Details form Tracking Cost is correct

    Then expect Order Details form Reference Number is correct

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

