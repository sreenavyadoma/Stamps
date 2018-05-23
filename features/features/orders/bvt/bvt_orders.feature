@mobile_orders_smoke_test
@bvt_all_tests
Feature:  BVT tests for Orders

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_ambigious_address
  Scenario: BVT Ambigious Address
    Then add new order
    Then set Order Details Ship-To ambiguous address to
      | full_name       | company  | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Juan Dela Cruz | Betfair  | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect Exact Address Not Found module to appear
    Then In Exact Address Not Found module, select row 2
    Then set order details service to PM Package
    Then pause for 2 seconds
    Then expect orders grid recipient is Juan Dela Cruz
    Then expect orders grid company is Betfair
    Then expect orders grid city is San Francisco
    Then expect orders grid state is CA
    Then expect orders grid zip is 94102
    Then sign out

  @bvt_address_cleansing
  Scenario: BVT Address Cleansing
    Then add new order
    Then set order details ship-to domestic address to
      | full_name     | company | street_address     | street_address_2| city          | state | zip | country       | phone          |  email           |
      | Euan Davidson | Betfair | 1350 Market Street |                 | San Francisco | CA    |     | United States | (415) 123-5555 | rtest@stamps.com |
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then blur out on order details form
    Then pause for 2 seconds
    Then expect orders grid recipient is Euan Davidson
    Then expect orders grid company is Betfair
    Then expect orders grid address is 1350 Market Street
    Then expect orders grid city is San Francisco
    Then expect orders grid state is CA
    Then expect orders grid zip is 94102
    Then sign out


  @bvt_bulk_update
  Scenario: BVT Bulk Update International

  # Order #1 (Domestic)
    Then in Orders Grid, Sort Order Date in Descending Order
    Then add order 1
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then pause for 1 second

  # Order #2 (International)
    Then add order 2
    Then set order details ship-to international address to
      | full_name     | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country | phone        |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | France  | Random phone | Random email  |
    Then set order details weight to 0 lb 1 oz
    Then set order details international service to PMEI Package/Flat/Thick Envelope
    Then blur out on order details form

  # Check 1st two orders
    Then pause for 1 second
    Then check order 1
    Then pause for 1 second
    Then check order 2
    Then pause for 1 seconds

  # Updating order details
    Then expect Bulk Update is present
    Then blur out on multi order details form
    Then set Bulk Update Ship From to default
    Then set Bulk Update domestic service to PM Large Package
    Then set Bulk Update International service to PMI Package/Flat/Thick Envelope
    Then click Bulk Update Update Order button

  # Uncheck both orders
    Then pause for 1 second
    Then uncheck order 1
    Then pause for 1 second
    Then uncheck order 2
    Then pause for 1 second

  # verify fields in 1st order
    Then check order 1
    Then expect Order Details Ship From is correct
    Then expect Order Details service is PM Large Package
    Then pause for 1 second
    Then uncheck order 1
    Then pause for 1 second

  # verify fields in 2nd order
    Then check order 2
    Then expect Order Details Ship From is correct
    Then expect Order Details international service is PMI Package/Flat/Thick Envelope
    Then uncheck order 2
    Then sign out

  @bvt_printing
  Scenario:  BVT Printing
    Then add new order
    Then set Order Details Ship-To to random address between zone 5 and 8
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then set order details width to 1
    Then set order details length to 1
    Then set order details height to 1
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then click print modal print button
    Then sign out


  @bvt_purchasing
  Scenario: BVT Purchasing $10
    Then on Add Funds modal, purchase 10
    Then on Add Funds modal, click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $10.00 postage purchase.
    Then Buy Mail Confirm Transction: Click Confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your fund request for $10.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $10
    Then sign out

  @bvt_shipstation_updates_international
  Scenario:  Update ShipStation for International
    Then add new order
    Then blur out on order details form
    Then set Order Details Ship-To International address to
      | full_name     | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country| phone         |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | India  | Random phone  | Random email  |

    Then expect Order Details Ship-To Country is correct
    Then set order details weight to 2 lb 2 oz
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details insure-for to $100.25
    Then set order details reference number to Some random string
    Then on order details form, add item 1, qty 1, id ID 1, description Description 1
    Then on order details form, add item 2, qty 2, id random string, description random string
    Then on order details form, add item 3, qty 3, id ID 3, description random string

    Then expect orders grid service is Priority Mail International
    Then expect orders grid service is PMI Package/Flat/Thick Envelope
    Then expect orders grid service is correct

  # Edit the customs form
    Then click Order Details form Customs Form button
    Then expect Customs I agree to the USPS Privacy Act Statement is unchecked

    Then set Customs Package Contents to Document

    Then set Customs Package Contents to Commercial Sample
    Then expect Customs Package Contents is Commercial Sample
    Then set Customs License Number to a random string
    Then expect Customs License Number is correct
    Then set Customs Certificate Number to some random string
    Then expect Customs Certificate Number is correct
    Then set Customs Invoice Number to a random string
    Then expect Customs Invoice Number is correct

    Then set Customs Non-Delivery Options to Treat as abandoned
    Then expect Customs Non-Delivery Options is Treat as abandoned

    Then set Customs Internal Transaction Number to Required
    Then expect Customs Internal Transaction Number is Required

    Then set Customs ITN Number to ITN123

    Then add Customs Associated Item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 2, description Item 2, qty 2, Price 2, Made In Japan, Tariff 2
    Then add Customs Associated Item 3, description Random String, qty 3, Price 3, Made In Canada, Tariff 3

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then pause for 1 second
    Then blur out on order details form
    Then uncheck orders grid order id cached
   #Then Refresh the driver
    Then pause for 3 seconds
    Then check orders grid order id cached
    Then pause for 2 seconds

    Then expect Order Details International Ship-To Name is correct
    Then expect Order Details International Ship-To Company is correct
    Then expect Order Details International Ship-To Address 1 is correct
    Then expect Order Details International Ship-To Address 2 is correct
    Then expect Order Details International Ship-To City is correct
    Then expect Order Details International Ship-To Province is correct
    Then expect Order Details International Ship-To Postal Code is correct
    Then expect Order Details International Ship-To Phone is correct
    Then expect Order Details International Ship-To Email is correct

    Then expect order details reference number is correct
    Then expect order details service cost is correct

    Then expect order details pounds is 2
    Then expect order details ounces is 2

    Then expect Order Details Associated Item 1 Qty is 1
    Then expect Order Details Associated Item 1 ID is ID 1
    Then expect Order Details Associated Item 1 Description is Description 1

    Then expect Order Details Associated Item 2 Qty is 2
    Then expect Order Details Associated Item 2 ID is correct
    Then expect Order Details Associated Item 2 Description is correct


    Then expect Order Details Associated Item 3 Qty is 3
    Then expect Order Details Associated Item 3 ID is ID 3
    Then expect Order Details Associated Item 3 Description is correct

    Then expect order details insure-for is correct
    Then click Order Details form Customs Form button
    Then pause for 2 second
    Then expect Customs Package Contents is Commercial Sample
    Then expect Customs License Number is correct
    Then expect Customs Certificate Number is correct
    Then expect Customs Invoice Number is correct

   #Then expect Customs Non-Delivery Options is Treat as abandoned
   #Then expect Customs Internal Transaction Number is Required
   #Then expect Customs ITN Number is correct

    Then expect Customs Associated Item 1 Description is correct
    Then expect Customs Associated Item 1 Quantity is correct
    Then expect Customs Associated Item 1 Unit Price is correct
    Then expect Customs Associated Item 1 Made In is correct
    Then expect Customs Associated Item 1 Tariff is correct

    Then expect Customs Associated Item 2 Description is correct
    Then expect Customs Associated Item 2 Quantity is correct
    Then expect Customs Associated Item 2 Unit Price is correct
    Then expect Customs Associated Item 2 Made In is correct

    Then expect Customs Associated Item 3 Description is correct
    Then expect Customs Associated Item 3 Quantity is correct
    Then expect Customs Associated Item 3 Unit Price is correct
    Then expect Customs Associated Item 3 Made In is correct
    Then expect Customs Associated Item 3 Tariff is correct

   #Then expect Customs I agree to the USPS Privacy Act Statement is checked
    Then expect Customs Total Value is correct
    Then close Customs Information form

    Then expect orders grid recipient is correct
    Then expect orders grid company is correct
    Then expect Orders Grid Country is correct
    Then expect orders grid address is correct
    Then expect orders grid city is correct
    Then expect orders grid state is correct
    Then expect orders grid zip is correct
   #Then expect orders grid phone is correct
   #Then expect orders grid email is correct

    Then expect orders grid qty. is 6
    Then expect orders grid item sku is Multiple
    Then expect orders grid item name is Multiple

    Then expect orders grid service is Priority Mail International
    Then expect orders grid pounds is correct
    Then expect orders grid ounces is correct
    Then expect order details insure-for is correct
    Then expect orders grid order status is Awaiting Shipment

    Then pause for 2 second
    Then sign out
