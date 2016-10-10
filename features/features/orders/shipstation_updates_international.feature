
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

    Then Details: Select Service Priority Mail International Package

    Then Details: Set Pounds to 5
    Then Details: Set Ounces to 5
    Then Details: Set Insure-For to $50.25

    Then Details: Set Reference Number to Reference #123

    Then Details: Add Item 1
    Then Details: Set Qty to 1
    Then Details: Set ID to ID 1
    Then Details: Set Description to Description 1

    Then Details: Add Item 2
    Then Details: Set Qty to 2
    Then Details: Set ID to ID 2
    Then Details: Set Description to Description 2

    Then Details: Expect Ship-To Country is France
    Then Details: Expect International Ship-To Name is Customer Name
    Then Details: Expect International Ship-To Company is Customer Company
    Then Details: Expect International Ship-To Address 1 is Street Address 1
    Then Details: Expect International Ship-To Address 2 is Street Address 2
    Then Details: Expect International Ship-To City is City
    Then Details: Expect International Ship-To Province is Province
    Then Details: Expect International Ship-To Postal Code is PostalCode
    Then Details: Expect International Ship-To Phone is 415-411-1111

    Then Details: Expect Service is "Priority Mail International Package"
    Then Details: Expect Reference Number is Reference #123

    Then Details: Expect Insure-For is $50.25

    Then Details: Expect Item 1 Qty is 1
    Then Details: Expect Item 1 ID is ID 1
    Then Details: Expect Item 1 Description is Description 1

    Then Details: Expect Item 2 Qty is 2
    Then Details: Expect Item 2 ID is ID 2
    Then Details: Expect Item 2 Description is Description 2

    Then Details: Expect Item 1 Qty is 1
    Then Details: Expect Item 1 ID is ID 1
    Then Details: Expect Item 1 Description is Description 1

    Then Details: Expect Item 2 Qty is 2
    Then Details: Expect Item 2 ID is ID 2
    Then Details: Expect Item 2 Description is Description 2

    Then Grid: Uncheck row 1
    Then Pause for 2 seconds
    Then Grid: Check row 1
    Then Pause for 1 second

    Then Details: Expect Ship-To Country is France
    Then Details: Expect International Ship-To Name is Customer Name
    Then Details: Expect International Ship-To Company is Customer Company
    Then Details: Expect International Ship-To Address 1 is Street Address 1
    Then Details: Expect International Ship-To Address 2 is Street Address 2
    Then Details: Expect International Ship-To City is City
    Then Details: Expect International Ship-To Province is Province
    Then Details: Expect International Ship-To Postal Code is PostalCode
    Then Details: Expect International Ship-To Phone is 415-411-1111

    Then Details: Expect Service is "Priority Mail International Package"

    Then Details: Expect Insure-For is $50.25

    Then Details: Expect Reference Number is Reference #123

    Then Details: Expect Item 1 Qty is 1
    Then Details: Expect Item 1 ID is ID 1
    Then Details: Expect Item 1 Description is Description 1

    Then Details: Expect Item 2 Qty is 2
    Then Details: Expect Item 2 ID is ID 2
    Then Details: Expect Item 2 Description is Description 2

    Then Details: Expect Item 1 Qty is 1
    Then Details: Expect Item 1 ID is ID 1
    Then Details: Expect Item 1 Description is Description 1

    Then Details: Expect Item 2 Qty is 2
    Then Details: Expect Item 2 ID is ID 2
    Then Details: Expect Item 2 Description is Description 2

    # Edit the customs form
    Then Details: Edit Customs Form

    Then Customs: Expect I agree to the USPS Privacy Act Statement is unchecked

    Then Customs: Set Package Contents to "Commercial Sample"
    Then Customs: Set License Number to "123456"
    Then Customs: Set Certificate Number to "12345678"
    Then Customs: Set Invoice Number to "Invoice123"

    Then Customs: Set Non-Delivery Options to "Treat as abandoned"

    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set ITN Number to "ITN123"

    Then Customs: Expect Package Contents is Commercial Sample
    Then Customs: Expect License Number is 123456
    Then Customs: Expect Certificate Number is 12345678
    Then Customs: Expect Invoice Number is Invoice123

    Then Customs: Expect Non-Delivery is Treat as abandoned

    Then Customs: Expect Internal Transaction Number is Required
    Then Customs: Expect ITN Number is ITN123

    Then Customs: Add Item 1
    Then Customs: Set Item Description to item 1
    Then Customs: Set Item Qty to 1
    Then Customs: Set Item Unit Price to 11.11
    Then Customs: Set Item Made In Country to United States
    Then Customs: Set Item Tarriff to 1

    Then Customs: Add Item 2
    Then Customs: Set Item Description to item 2
    Then Customs: Set Item Qty to 2
    Then Customs: Set Item Unit Price to 22.22
    Then Customs: Set Item Made In Country to United States
    Then Customs: Set Item Tarriff to 2

    Then Customs: Check I agree to the USPS Privacy Act Statement

    Then Customs: Close Modal

    Then Pause for 1 second
    Then Customs: Close Modal
    Then Pause for 2 seconds

    Then

    Then Grid: Uncheck row 1
    Then Pause for 2 seconds
    Then Grid: Check row 1
    Then Pause for 1 second

    Then Details: Edit Customs Form
    Then Pause for 1 second

    Then Customs: Expect I agree to the USPS Privacy Act Statement is checked

    Then Customs: Expect Package Contents is Commercial Sample
    Then Customs: Expect License Number is 123456
    Then Customs: Expect Certificate Number is 12345678
    Then Customs: Expect Invoice Number is Invoice123

    Then Customs: Expect Non-Delivery is Treat as abandoned

    Then Customs: Expect Internal Transaction Number is Required
    Then Customs: Expect ITN Number is ITN123

    Then Customs: Expect Item 1 Description is item 1
    Then Customs: Expect Item 1 Quantity is 1
    Then Customs: Expect Item 1 Unit Price is 11.11
    Then Customs: Expect Item 1 Origin Country is United States
    Then Customs: Expect Item 1 Tariff is 1

    Then Customs: Expect Item 2 Description is item 2
    Then Customs: Expect Item 2 Quantity is 2
    Then Customs: Expect Item 2 Unit Price is 22.22
    Then Customs: Expect Item 2 Origin Country is United States
    Then Customs: Expect Item 2 Tariff is 2

    Then Customs: Close Modal

    Then Pause for 1 second
    Then Sign out



