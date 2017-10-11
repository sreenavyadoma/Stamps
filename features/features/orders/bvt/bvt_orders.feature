
@bvt_all_tests
Feature:  BVT tests for Orders

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_ambigious_address
  Scenario: BVT Ambigious Address
    Then add new order
    Then set Order Details form Ship-To to ambiguous address
      | full_name       | company  | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Betfair  | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect Exact Address Not Found module to appear
    Then In Exact Address Not Found module, select row 2
    Then set Order Details form service to PM Package
    Then Pause for 2 seconds
    Then expect Orders Grid Recipient is Joseph Balancio
    Then expect Orders Grid Company is Betfair
    Then expect Orders Grid City is San Francisco
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 94102
    Then Sign out


  @bvt_address_cleansing
  Scenario: BVT Address Cleansing
    Then add new order
    Then set Order Details form Ship-To Domestic address to
      | full_name     | company | street_address     | street_address_2| city          | state | zip | country       | phone          |  email           |
      | Euan Davidson | Betfair | 1350 Market Street |                 | San Francisco | CA    |     | United States | (415) 123-5555 | rtest@stamps.com |
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1
    Then blur out on Order Details form
    Then Pause for 2 seconds
    Then expect Orders Grid Recipient is Euan Davidson
    Then expect Orders Grid Company is Betfair
    Then expect Orders Grid Address is 1350 Market Street
    Then expect Orders Grid City is San Francisco
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 94102
    Then Sign out


  @bvt_bulk_update
  Scenario: BVT Bulk Update International

  # Order #1 (Domestic)
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1
    Then Pause for 1 second

  # Order #2 (International)
    Then add new order
    Then set Order Details Ship-To International address to
      | full_name     | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country | phone        |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | France  | Random phone | Random email  |
    Then set Order Details form Weight to 2 lb 2 oz
    Then set Order Details form international service to PMEI Package
    Then blur out on Order Details form 2 times

  # Check 1st two orders
    Then Pause for 1 second
    Then check orders grid cached order id 1
    Then Pause for 1 second
    Then check orders grid cached order id 2
    Then Pause for 1 seconds

  # Updating order details
    Then expect multi order details form is present
    Then blur out on multi order details form
    Then set Multi Order Details Form Ship From to default
    Then set multi order details form domestic service to PM Large Package
    Then set Multi Order Details Form International service to PMI Package
    Then click Multi Order Form Update Order button

  # Uncheck both orders
    Then Pause for 1 second
    Then uncheck orders grid cached order id 1
    Then Pause for 1 second
    Then uncheck orders grid cached order id 2
    Then Pause for 1 second

  # verify fields in 1st order
    Then check orders grid cached order id 1
    Then expect Order Details form Ship From is correct
    Then expect Order Details form service is correct
    Then Pause for 1 second
    Then uncheck orders grid cached order id 1
    Then Pause for 1 second

  # verify fields in 2nd order
    Then check orders grid cached order id 2
    Then expect Order Details form Ship From is correct
    Then expect Order Details form international service is correct
    Then uncheck orders grid cached order id 2
    Then Sign out


  @bvt_international_shipping
  Scenario: BVT International Shipping
    Then add new order
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set Order Details form Ounces to 4
    Then set Order Details form service to FCMI Large Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 4, Made In Japan, Tariff 1
    Then set Customs form Package Contents to Commercial Sample
    Then set Customs form Package Contents to Gift
    Then set Customs form Package Contents to Document
    Then set Customs form Package Contents to Humanitarian Donation
    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Not required
    Then set Customs form More Info to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then in Print modal, click Close button
    Then Sign out


  @bvt_new_order
  Scenario:  BVT Add a new order
    Then add new order
    Then set Order Details form Ship-To to random address between zone 9
    Then set Order Details form service to PM Package
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1
    Then set Order Details form Insure-For to $1.00
    Then set Order Details form Length to 1
    Then set Order Details form Width to 1
    Then set Order Details form Height to 1
  # Orders Grid Operations
    Then uncheck Orders Grid row 1
    Then expect Orders Grid Pounds is 1
    Then expect Orders Grid Ounces is 1
    Then expect Orders Grid Weight is 1 lb. 1 oz.
    Then expect Orders Grid Insured Value is $1.00
    Then Sign out


  @bvt_printing
  Scenario:  BVT Printing
    Then add new order
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1
    Then set Order Details form Width to 1
    Then set Order Details form Length to 1
    Then set Order Details form Height to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then click print modal print button
    Then Sign out


  @bvt_purchasing
  Scenario: BVT Purchasing $10
    Then on Add Funds modal, purchase 10
    Then on Add Funds modal, click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $10.00 postage purchase.
    Then Buy Mail Confirm Transction: Click Confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your fund request for $10.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $10
    Then Sign out


  @bvt_shipping_address_management
  Scenario: BVT Shipping Address
    Then add new order
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name  | company    | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan  | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then on Manage Shipping Address modal, delete all addresses
    Then set Order Details form Ship-From to San Francisco, CA
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then Sign out


  @bvt_shipstation_search
  Scenario: Search shipstation orders
    Then add new order
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form Email to random
    Then set Order Details form Phone to random
    Then set Order Details form service to PM Package
    Then set Order Details form Weight to 1 lb 1 oz

    Then uncheck orders grid cached order id

    Then Pause for 3 seconds
    Then Refresh the browser
    Then Pause for 5 seconds

  # Search for new order
    Then check orders grid cached order id
    Then search filtered Orders for cached Order ID
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1

  #Then check orders grid cached order id
    Then expect Order Details form Order ID equals Grid Oder ID in row 1
    Then expect Order Details form Order ID is the same as saved Order ID

    Then expect Filter Panel search result count is greater than 0
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present

    Then Sign out


  @bvt_shipstation_updates_domestic
  Scenario: Update ShipStation for Domestic
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
    Then blur out on Order Details form 5 times
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


  @bvt_shipstation_updates_international
  Scenario:  Update ShipStation for International
    Then add new order
    Then blur out on Order Details form
    Then set Order Details Ship-To International address to
      | full_name     | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country| phone         |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | India  | Random phone  | Random email  |

    Then expect Order Details form Ship-To Country is correct
    Then set Order Details form Weight to 2 lb 2 oz
    Then set Order Details form service to PMI Package
    Then set Order Details form Insure-For to $100.25
    Then set Order Details form Reference Number to Some random string
    Then on Order Details form, Add Item 1, Qty 1, ID ID 1, Description Description 1
    Then on Order Details form, Add Item 2, Qty 2, ID random string, Description random string
    Then on Order Details form, Add Item 3, Qty 3, ID ID 3, Description random string

    Then expect Orders Grid service is Priority Mail
    Then expect Orders Grid service is PM Package
    Then expect Orders Grid service is correct

  # Edit the customs form
    Then click Order Details form Edit Form button
    Then expect Customs form I agree to the USPS Privacy Act Statement is unchecked

    Then set Customs form Package Contents to Document
    Then set Customs form More Info to some random string

    Then set Customs form Package Contents to Commercial Sample
    Then expect Customs form Package Contents is Commercial Sample
    Then set Customs form License Number to a random string
    Then expect Customs form License Number is correct
    Then set Customs form Certificate Number to some random string
    Then expect Customs form Certificate Number is correct
    Then set Customs form Invoice Number to a random string
    Then expect Customs form Invoice Number is correct

    Then set Customs form Non-Delivery Options to Treat as abandoned
    Then expect Customs form Non-Delivery Options is Treat as abandoned

    Then set Customs form Internal Transaction Number to Required
    Then expect Customs form Internal Transaction Number is Required

    Then set Customs form ITN Number to ITN123

    Then add Customs form Associated Item 1, Description Item 1, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 2, Description Item 2, Qty 2, Price 2, Made In Japan, Tariff 2
    Then add Customs form Associated Item 3, Description Random String, Qty 3, Price 3, Made In Canada, Tariff 3

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then Pause for 1 second
    Then blur out on Order Details form 3 times
    Then uncheck orders grid cached order id
   #Then Refresh the browser
    Then Pause for 3 seconds
    Then check orders grid cached order id
    Then Pause for 2 seconds

    Then expect Order Details form International Ship-To Name is correct
    Then expect Order Details form International Ship-To Company is correct
    Then expect Order Details form International Ship-To Address 1 is correct
    Then expect Order Details form International Ship-To Address 2 is correct
    Then expect Order Details form International Ship-To City is correct
    Then expect Order Details form International Ship-To Province is correct
    Then expect Order Details form International Ship-To Postal Code is correct
    Then expect Order Details form International Ship-To Phone is correct
    Then expect Order Details form International Ship-To Email is correct

    Then expect Order Details form Reference Number is correct
    Then expect Order Details form Service Cost is correct

    Then expect Order Details form Pounds is 2
    Then expect Order Details form Ounces is 2

    Then expect Order Details form Associated Item 1 Qty is 1
    Then expect Order Details form Associated Item 1 ID is ID 1
    Then expect Order Details form Associated Item 1 Description is Description 1

    Then expect Order Details form Associated Item 2 Qty is 2
    Then expect Order Details form Associated Item 2 ID is correct
    Then expect Order Details form Associated Item 2 Description is correct


    Then expect Order Details form Associated Item 3 Qty is 3
    Then expect Order Details form Associated Item 3 ID is ID 3
    Then expect Order Details form Associated Item 3 Description is correct

    Then expect Order Details form Insure-For is correct
    Then expect Order Details form Insure-For Cost is correct
    Then click Order Details form Edit Form button
    Then Pause for 2 second
    Then expect Customs form Package Contents is Commercial Sample
    Then expect Customs form License Number is correct
    Then expect Customs form Certificate Number is correct
    Then expect Customs form Invoice Number is correct

   #Then expect Customs form Non-Delivery Options is Treat as abandoned
   #Then expect Customs form Internal Transaction Number is Required
   #Then expect Customs form ITN Number is correct

    Then expect Customs form Associated Item 1 Description is correct
    Then expect Customs form Associated Item 1 Quantity is correct
    Then expect Customs form Associated Item 1 Unit Price is correct
    Then expect Customs form Associated Item 1 Made In is correct
    Then expect Customs form Associated Item 1 Tariff is correct

    Then expect Customs form Associated Item 2 Description is correct
    Then expect Customs form Associated Item 2 Quantity is correct
    Then expect Customs form Associated Item 2 Unit Price is correct
    Then expect Customs form Associated Item 2 Made In is correct

    Then expect Customs form Associated Item 3 Description is correct
    Then expect Customs form Associated Item 3 Quantity is correct
    Then expect Customs form Associated Item 3 Unit Price is correct
    Then expect Customs form Associated Item 3 Made In is correct
    Then expect Customs form Associated Item 3 Tariff is correct

   #Then expect Customs form I agree to the USPS Privacy Act Statement is checked
    Then expect Customs form Total Value is correct
    Then close Customs Information form

    Then expect Orders Grid Recipient is correct
    Then expect Orders Grid Company is correct
    Then expect Orders Grid Country is correct
    Then expect Orders Grid Address is correct
    Then expect Orders Grid City is correct
    Then expect Orders Grid State is correct
    Then expect Orders Grid Zip is correct
   #Then expect Orders Grid Phone is correct
   #Then expect Orders Grid Email is correct

    Then expect Orders Grid Qty. is 6
    Then expect Orders Grid Item SKU is Multiple
    Then expect Orders Grid Item Name is Multiple

    Then expect Orders Grid service is Priority Mail International
    Then expect Orders Grid Pounds is correct
    Then expect Orders Grid Ounces is correct
    Then expect Order Details form Insure-For is correct
    Then expect Orders Grid Order Status is Awaiting Shipment

    Then Pause for 2 second
    Then Sign out
