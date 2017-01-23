
Feature:  Update International Orders to ShipStation

  Background:
    Given I am signed in to Orders

  @bvt_shipstation_updates_international
  Scenario:  Update ShipStation

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name          | company          | street_address_1  | street_address_2 | city   | province | postal_code | country | phone         |  email            |
      | Customer Name | Customer Company | Street Address 1  | Street Address 2 | City   | Province | PostalCode  | France  | 415-411-1111  | rtest@stamps.com  |
    Then Order Details: Set Weight to 2 lb 2 oz
    Then Order Details: Select Service PMI Package
    Then Order Details: Set Insure-For to $100.25
    Then Order Details: Set Reference Number to Reference #123
    Then Order Details: Add Item 1, Qty 1, ID ID 1, Description Description 1
    # Edit the customs form
    Then Order Details: Edit Customs Form
    Then Customs Form: Expect I agree to the USPS Privacy Act Statement is unchecked
    Then Customs Form: Set Package Contents to Commercial Sample
    Then Customs Form: Set License Number to "a12346"
    Then Customs Form: Set Certificate Number to "certno1"
    Then Customs Form: Set Invoice Number to "Invoice123"
    Then Customs Form: Set Non-Delivery Options to Treat as abandoned
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set ITN Number to "ITN123"
    Then Customs Form: Add Item 1, Description Item 1, Qty 1, Price 20, Origin United States, Tariff 10
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form

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

    Then Order Details: Expect Ship-From saved value is the same
    Then Order Details: Expect Ship-To Country is France
    Then Order Details: Expect International Ship-To Name is Customer Name
    Then Order Details: Expect International Ship-To Company is Customer Company
    Then Order Details: Expect International Ship-To Address 1 is Street Address 1
    Then Order Details: Expect International Ship-To Address 2 is Street Address 2
    Then Order Details: Expect International Ship-To City is City
    Then Order Details: Expect International Ship-To Province is Province
    Then Order Details: Expect International Ship-To Postal Code is PostalCode
    Then Order Details: Expect International Ship-To Phone is 415-411-1111
    Then Order Details: Expect International Ship-To Email is rtest@stamps.com

    Then Order Details: Expect Reference Number is Reference #123

    Then Order Details: Expect Service is PMI Package
    #Then Order Details: Expect Service Cost saved value is the same

    Then Order Details: Expect Item 1 Qty is 1
    Then Order Details: Expect Item 1 ID is ID 1
    Then Order Details: Expect Item 1 Description is Description 1
    Then Order Details: Expect Pounds is 2
    Then Order Details: Expect Ounces is 2
    Then Order Details: Expect Insure-For is $100.25
    Then Order Details: Expect Insure-For Cost saved value is the same
    Then Order Details: Edit Customs Form
    Then Pause for 1 second
    Then Customs Form: Expect Package Contents is Commercial Sample
    Then Customs Form: Expect License Number is a12346
    Then Customs Form: Expect Certificate Number is certno1
    Then Customs Form: Expect Invoice Number is Invoice123

    Then Customs Form: Expect Non-Delivery Options is Treat as abandoned
    Then Customs Form: Expect Internal Transaction Number is Required
    Then Customs Form: Expect ITN Number is ITN123
    Then Customs Form: Expect Item 1 Description is Item 1
    Then Customs Form: Expect Item 1 Quantity is 1
    Then Customs Form: Expect Item 1 Unit Price is 20.00
    Then Customs Form: Expect Item 1 Origin Country is United States
    Then Customs Form: Expect Item 1 Tariff is 10
    Then Customs Form: Expect I agree to the USPS Privacy Act Statement is checked
    Then Customs Form: Expect Total saved value is the same
    Then Customs Form: Close Customs Form

    Then Orders Grid: Expect Recipient is Customer Name
    Then Orders Grid: Expect Company is Customer Company
    Then Orders Grid: Expect Country is France
    Then Orders Grid: Expect Address is Street Address 1 Street Address 2
    Then Orders Grid: Expect City is City
    Then Orders Grid: Expect State is Province
    Then Orders Grid: Expect Zip is PostalCode
    Then Orders Grid: Expect Phone is 415-411-1111
    Then Orders Grid: Expect Email is rtest@stamps.com
    Then Orders Grid: Expect Qty. is 1
    Then Orders Grid: Expect Item SKU is ID 1
    Then Orders Grid: Expect Item Name is Description 1
    Then Orders Grid: Expect Service is Priority Mail International
    Then Orders Grid: Expect Weight is 2 lb. 2 oz.
    Then Orders Grid: Expect Insured Value is $100.25
    Then Orders Grid: Expect Order Status is Awaiting Shipment

    Then Pause for 2 second
    Then Sign out



