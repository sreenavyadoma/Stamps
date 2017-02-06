
Feature:  Update International Orders to ShipStation

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipstation_updates_international
  Scenario:  Update ShipStation
    Then in Orders Toolbar, click Add button
    Then on Order Details form, blur out
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name          | company          | street_address_1  | street_address_2 | city   | province | postal_code | country | phone         |  email            |
      | Customer Name | Customer Company | Street Address 1  | Street Address 2 | City   | Province | PostalCode  | France  | 415-411-1111  | rtest@stamps.com  |
    Then on Order Details form, set Weight to 2 lb 2 oz
    Then on Order Details form, select service PMI Package
    Then on Order Details form, set Insure-For to $100.25
    Then on Order Details form, set Reference Number to Reference #123
    Then on Order Details form, Add Item 1, Qty 1, ID ID 1, Description Description 1
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
    Then on Customs form, add Associated Item 1, Description Item 1, Qty 1, Price 3, Origin United States, Tariff 2
    Then on Customs form, add Associated Item 2, Description Item 1, Qty 2, Price 4, Origin United States, Tariff 2
    Then on Customs form, add Associated Item 3, Description Item 1, Qty 3, Price 5, Origin United States, Tariff 2
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button

    Then Pause for 2 seconds
    Then on Order Details form, blur out 3 times
    Then Pause for 3 seconds

    Then In Orders Grid, uncheck saved Order ID
    Then Pause for 5 seconds

    Then Refresh the browser

    Then Pause for 7 seconds
    Then In Orders Grid, check saved Order ID
    Then Pause for 2 seconds

    Then on Order Details form, expect Ship-From saved value is the same
    Then on Order Details form, expect Ship-To Country is France
    Then on Order Details form, expect International Ship-To Name is Customer Name
    Then on Order Details form, expect International Ship-To Company is Customer Company
    Then on Order Details form, expect International Ship-To Address 1 is Street Address 1
    Then on Order Details form, expect International Ship-To Address 2 is Street Address 2
    Then on Order Details form, expect International Ship-To City is City
    Then on Order Details form, expect International Ship-To Province is Province
    Then on Order Details form, expect International Ship-To Postal Code is PostalCode
    Then on Order Details form, expect International Ship-To Phone is 415-411-1111
    Then on Order Details form, expect International Ship-To Email is rtest@stamps.com

    Then on Order Details form, expect Reference Number is Reference #123

    Then on Order Details form, expect service is PMI Package
    #Then on Order Details form, expect service Cost saved value is the same

    Then on Order Details form, expect Item 1 Qty is 1
    Then on Order Details form, expect Item 1 ID is ID 1
    Then on Order Details form, expect Item 1 Description is Description 1
    Then on Order Details form, expect Pounds is 2
    Then on Order Details form, expect Ounces is 2
    Then on Order Details form, expect Insure-For is $100.25
    Then on Order Details form, expect Insure-For Cost saved value is the same
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
    Then on Customs form, expect Associated Item 1 Unit Price is 3.00
    Then on Customs form, expect Associated Item 1 Origin Country is United States
    Then on Customs form, expect Associated Item 1 Tariff is 2
    Then on Customs form, expect I agree to the USPS Privacy Act Statement is checked
    Then on Customs form, expect Total saved value is the same
    Then on Customs form, click Close button

    Then In Orders Grid, expect Recipient is Customer Name
    Then In Orders Grid, expect Company is Customer Company
    Then In Orders Grid, expect Country is France
    Then In Orders Grid, expect Address is Street Address 1 Street Address 2
    Then In Orders Grid, expect City is City
    Then In Orders Grid, expect State is Province
    Then In Orders Grid, expect Zip is PostalCode
    Then In Orders Grid, expect Phone is 415-411-1111
    Then In Orders Grid, expect Email is rtest@stamps.com
    Then In Orders Grid, expect Qty. is 1
    Then In Orders Grid, expect Item SKU is ID 1
    Then In Orders Grid, expect Item Name is Description 1
    Then In Orders Grid, expect service is Priority Mail International
    Then In Orders Grid, expect Weight is 2 lb. 2 oz.
    Then In Orders Grid, expect Insured Value is $100.25
    Then In Orders Grid, expect Order Status is Awaiting Shipment

    Then Pause for 2 second
    Then Sign out



