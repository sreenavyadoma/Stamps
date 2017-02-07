
Feature:  Update International Orders to ShipStation

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipstation_updates_international
  Scenario:  Update ShipStation
    Then in Orders Toolbar, click Add button
    Then on Order Details form, blur out
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
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
    Then on Order Details form, click Edit Form button
    Then on Customs form, expect I agree to the USPS Privacy Act Statement is unchecked
    Then on Customs form, set Package Contents to Commercial Sample
    Then on Customs form, set License Number to "a12346"
    Then on Customs form, set Certificate Number to "certno1"
    Then on Customs form, set Invoice Number to "Invoice123"
    Then on Customs form, set Non-Delivery Options to Treat as abandoned
    Then on Customs form, set Internal Transaction Number to Required
    Then on Customs form, set ITN Number to "ITN123"

    Then on Customs form, add Associated Item 1, Description Item 1, Qty 1, Price 1, Origin United States, Tariff 1
    Then on Customs form, add Associated Item 2, Description Item 2, Qty 2, Price 2, Origin Japan, Tariff 2
    Then on Customs form, add Associated Item 3, Description Item 3, Qty 3, Price 3, Origin Canada, Tariff 3

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button

    Then Pause for 2 seconds
    Then on Order Details form, blur out 3 times
    Then Pause for 3 seconds

    Then in Orders Grid, uncheck saved Order ID
    Then Pause for 2 seconds

    Then Refresh the browser

    Then Pause for 4 seconds
    Then in Orders Grid, check saved Order ID
    Then Pause for 1 second

    Then on Order Details form, expect Ship-To Country and saved Country are the same
    Then on Order Details form, expect International Ship-To Name and saved Name are the same
    Then on Order Details form, expect International Ship-To Company and saved Company are the same
    Then on Order Details form, expect International Ship-To Address 1 and saved Address 1 are the same
    Then on Order Details form, expect International Ship-To Address 2 and saved Address 2 are the same
    Then on Order Details form, expect International Ship-To City and saved City are the same
    Then on Order Details form, expect International Ship-To Province and saved Province are the same
    Then on Order Details form, expect International Ship-To Postal Code and saved Postal Code are the same
    Then on Order Details form, expect International Ship-To Phone and saved Phone are the same
    Then on Order Details form, expect International Ship-To Email and saved Email are the same
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
    Then on Order Details form, click Edit Form button
    Then Pause for 1 second
    Then on Customs form, expect Package Contents is Commercial Sample
    Then on Customs form, expect License Number is a12346
    Then on Customs form, expect Certificate Number is certno1
    Then on Customs form, expect Invoice Number is Invoice123

    Then on Customs form, expect Non-Delivery Options is Treat as abandoned
    Then on Customs form, expect Internal Transaction Number is Required
    Then on Customs form, expect ITN Number is ITN123

    Then on Customs form, expect Associated Item 1 Description is Item 1
    Then on Customs form, expect Associated Item 1 Quantity is 1
    Then on Customs form, expect Associated Item 1 Unit Price is 1.00
    Then on Customs form, expect Associated Item 1 Origin Country is United States
    Then on Customs form, expect Associated Item 1 Tariff is 1

    Then on Customs form, expect Associated Item 2 Description is Item 2
    Then on Customs form, expect Associated Item 2 Quantity is 2
    Then on Customs form, expect Associated Item 2 Unit Price is 2.00
    Then on Customs form, expect Associated Item 2 Origin Country is Japan
    Then on Customs form, expect Associated Item 2 Tariff is 2

    Then on Customs form, expect Associated Item 3 Description is Item 3
    Then on Customs form, expect Associated Item 3 Quantity is 3
    Then on Customs form, expect Associated Item 3 Unit Price is 3.00
    Then on Customs form, expect Associated Item 3 Origin Country is Canada
    Then on Customs form, expect Associated Item 3 Tariff is 3

    Then on Customs form, expect I agree to the USPS Privacy Act Statement is checked
    Then on Customs form, expect Total saved value is the same
    Then on Customs form, click Close button

    Then in Orders Grid, expect Recipient and saved Recipient are the same
    Then in Orders Grid, expect Company and saved Company are the same
    Then in Orders Grid, expect Country and saved Country are the same
    Then in Orders Grid, expect Address and saved Address are the same
    Then in Orders Grid, expect City and saved City are the same
    Then in Orders Grid, expect State and saved State are the same
    Then in Orders Grid, expect Zip and saved Zip are the same
    Then in Orders Grid, expect Phone and saved Phone are the same
    Then in Orders Grid, expect Email and saved Email are the same

    Then in Orders Grid, expect Qty. is 6
    Then in Orders Grid, expect Item SKU is Multiple
    Then in Orders Grid, expect Item Name is Multiple

    Then in Orders Grid, expect service is Priority Mail International
    Then in Orders Grid, expect Pounds and saved Pounds are the same
    Then in Orders Grid, expect Ounces and saved Ounces are the same
    Then on Order Details form, expect Insure-For and saved Insure-For values are the same
    Then in Orders Grid, expect Order Status is Awaiting Shipment

    Then Pause for 2 second
    Then Sign out



