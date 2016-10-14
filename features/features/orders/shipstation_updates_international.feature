
Feature:  Update International Orders to ShipStation

  Background:
    Given I am signed in to Orders

  @shipstation_updates_international
  Scenario:  Update ShipStation

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To to international address
      | name          | company          | street_address_1  | street_address_2 | city   | province | postal_code | country | phone         |  email            |
      | Customer Name | Customer Company | Street Address 1  | Street Address 2 | City   | Province | PostalCode  | France  | 415-411-1111  | rtest@stamps.com  |

    Then Details: Set Weight to 2 lbs 2 oz

    Then Details: Select Service Priority Mail International Package

    Then Details: Set Insure-For to $100.25

    Then Details: Set Reference Number to Reference #123

    Then Details: Add Item 1, Qty 1, ID ID 1, Description Description 1

    # Edit the customs form
    Then Details: Edit Customs Form

    Then Customs: Expect I agree to the USPS Privacy Act Statement is unchecked

    Then Customs: Set Package Contents to Commercial Sample
    Then Customs: Set License Number to "a12346"
    Then Customs: Set Certificate Number to "certno1"
    Then Customs: Set Invoice Number to "Invoice123"

    Then Customs: Set Non-Delivery Options to Treat as abandoned

    Then Customs: Set Internal Transaction Number to Required
    Then Customs: Set ITN Number to "ITN123"

    Then Customs: Add Item 1, Description Item 1, Qty 1, Price 20, Origin United States, Tariff 10

    Then Customs: Check I agree to the USPS Privacy Act Statement

    Then Customs: Close Modal

    Then Pause for 2 seconds
    Then Details: Blur out
    Then Details: Blur out
    Then Details: Blur out
    Then Pause for 3 seconds

    Then Grid: Uncheck Saved Order ID
    Then Pause for 2 seconds

    Then Refresh Browser

    Then Pause for 5 seconds
    Then Grid: Check Saved Order ID
    Then Pause for 2 seconds

    Then Details: Expect Ship-From saved value is the same
    Then Details: Expect Ship-To Country is France
    Then Details: Expect International Ship-To Name is Customer Name
    Then Details: Expect International Ship-To Company is Customer Company
    Then Details: Expect International Ship-To Address 1 is Street Address 1
    Then Details: Expect International Ship-To Address 2 is Street Address 2
    Then Details: Expect International Ship-To City is City
    Then Details: Expect International Ship-To Province is Province
    Then Details: Expect International Ship-To Postal Code is PostalCode
    Then Details: Expect International Ship-To Phone is 415-411-1111
    Then Details: Expect International Ship-To Email is rtest@stamps.com

    Then Details: Expect Reference Number is Reference #123

    Then Details: Expect Service is Priority Mail International Package
    Then Details: Expect Service Cost saved value is the same

    Then Details: Expect Item 1 Qty is 1
    Then Details: Expect Item 1 ID is ID 1
    Then Details: Expect Item 1 Description is Description 1

    Then Details: Expect Pounds is 2
    Then Details: Expect Ounces is 2

    Then Details: Expect Insure-For is $100.25
    Then Details: Expect Insure-For Cost saved value is the same

    Then Details: Edit Customs Form
    Then Pause for 1 second

    Then Customs: Expect Package Contents is Commercial Sample
    Then Customs: Expect License Number is a12346
    Then Customs: Expect Certificate Number is certno1
    Then Customs: Expect Invoice Number is Invoice123

    Then Customs: Expect Non-Delivery Options is Treat as abandoned

    Then Customs: Expect Internal Transaction Number is Required
    Then Customs: Expect ITN Number is ITN123

    Then Customs: Expect Item 1 Description is Item 1
    Then Customs: Expect Item 1 Quantity is 1
    Then Customs: Expect Item 1 Unit Price is 20.00
    Then Customs: Expect Item 1 Origin Country is United States
    Then Customs: Expect Item 1 Tariff is 10

    Then Customs: Expect I agree to the USPS Privacy Act Statement is checked
    
    Then Customs: Expect Total saved value is the same

    Then Customs: Close Modal

    Then Grid: Expect Recipient is Customer Name
    Then Grid: Expect Company is Customer Company
    Then Grid: Expect Country is France
    Then Grid: Expect Address is Street Address 1 Street Address 2
    Then Grid: Expect City is City
    Then Grid: Expect State is Province
    Then Grid: Expect Zip is PostalCode
    Then Grid: Expect Phone is 415-411-1111
    Then Grid: Expect Email is rtest@stamps.com
    Then Grid: Expect Qty. is 1
    Then Grid: Expect Item SKU is ID 1
    Then Grid: Expect Item Name is Description 1
    Then Grid: Expect Service is Priority Mail International
    Then Grid: Expect Weight is 2 lbs. 2 oz.
    Then Grid: Expect Insured Value is $100.25
    Then Grid: Expect Order Status is Awaiting Shipment

    Then Pause for 2 second
    Then Sign out



