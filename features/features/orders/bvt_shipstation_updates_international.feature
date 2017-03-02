
Feature:  Update International Orders to ShipStation

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipstation_updates_international
  Scenario:  Update ShipStation
    Then in Orders Toolbar, click Add button
    Then on Order Details form, blur out
    Then on Order Details form, set Ship-From to default
    Then set Order Details Ship-To International address to
      | name          | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country | phone         |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | France  | Random phone  | Random email  |
    Then on Order Details form, set Weight to 2 lb 2 oz
    Then on Order Details form, select service PMI Package
    Then on Order Details form, set Insure-For to $100.25
    Then on Order Details form, set Reference Number to Some random string
    Then on Order Details form, Add Item 1, Qty 1, ID ID 1, Description Description 1
    Then on Order Details form, Add Item 2, Qty 2, ID ID 2, Description Description 2
    Then on Order Details form, Add Item 3, Qty 3, ID ID 3, Description Description 3

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

    Then add Customs form Associated Item 1, Description Item 1, Qty 1, Price 1, Made In is United States, Tariff 1
    Then add Customs form Associated Item 2, Description Item 2, Qty 2, Price 2, Made In is Japan, Tariff 2
    Then add Customs form Associated Item 3, Description Random String, Qty 3, Price 3, Made In is Canada, Tariff 3

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button

    Then Pause for 2 seconds
    Then on Order Details form, blur out 3 times
    Then Pause for 3 seconds

    Then in Orders Grid, uncheck saved Order ID
    Then Pause for 2 seconds

    Then Refresh the browser

    Then Pause for 4 seconds
    Then in Orders Grid, check saved Order ID
    Then Pause for 1 second

    Then expect Order Details form Ship-To Country is correct
    Then expect Order Details form Ship-To Name is correct
    Then expect Order Details form Ship-To Company is correct
    Then expect Order Details form Ship-To Address 1 is correct
    Then expect Order Details form Ship-To Address 2 is correct
    Then expect Order Details form Ship-To City is correct
    Then expect Order Details form Ship-To Province is correct
    Then expect Order Details form Ship-To Postal Code is correct
    Then expect Order Details form Ship-To Phone is correct
    Then expect Order Details form Ship-To Email is correct
    Then on Order Details form, expect Reference Number and saved Reference Number are the same

    Then on Order Details form, expect service is PMI Package
    Then on Order Details form, expect Service Cost and saved Service Cost values are the same

    Then on Order Details form, expect Pounds is 2
    Then on Order Details form, expect Ounces is 2

    Then on Order Details form, expect Item 1 Qty is 1
    Then on Order Details form, expect Item 1 ID is ID 1
    Then on Order Details form, expect Item 1 Description is Description 1

    Then on Order Details form, expect Item 2 Qty is 2
    Then on Order Details form, expect Item 2 ID is ID 2
    Then on Order Details form, expect Item 2 Description is Description 2


    Then on Order Details form, expect Item 3 Qty is 3
    Then on Order Details form, expect Item 3 ID is ID 3
    Then on Order Details form, expect Item 3 Description is Description 3

    Then on Order Details form, expect Insure-For and saved Insure-For values are the same
    Then on Order Details form, expect Insure-For Cost and saved Insure-For Cost values are the same
    Then click Order Details form Edit Form button
    Then Pause for 1 second
    Then expect Customs form Package Contents is Commercial Sample
    Then expect Customs form License Number is correct
    Then expect Customs form Certificate Number is correct
    Then expect Customs form Invoice Number is correct

    Then expect Customs form Non-Delivery Options is Treat as abandoned
    Then expect Customs form Internal Transaction Number is Required
    Then expect Customs form ITN Number is correct

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

    Then expect Customs form I agree to the USPS Privacy Act Statement is checked
    Then expect Customs form Total Value is correct
    Then click Customs form Close button

    Then expect Orders Grid Recipient is correct
    Then expect Orders Grid Company is correct
    Then expect Orders Grid Country is correct
    Then expect Orders Grid Address is correct
    Then expect Orders Grid City is correct
    Then expect Orders Grid State is correct
    Then expect Orders Grid Zip is correct
    Then expect Orders Grid Phone is correct
    Then expect Orders Grid Email is correct

    Then expect Orders Grid Qty. is 6
    Then expect Orders Grid Item SKU is Multiple
    Then expect Orders Grid Item Name is Multiple

    Then expect Orders Grid service is Priority Mail International
    Then expect Orders Grid Pounds is correct
    Then expect Orders Grid Ounces is correct
    Then on Order Details form, expect Insure-For and saved Insure-For values are the same
    Then expect Orders Grid Order Status is Awaiting Shipment

    Then Pause for 2 second
    Then Sign out



