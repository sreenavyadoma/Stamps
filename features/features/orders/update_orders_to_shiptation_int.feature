
Feature:  Update International Orders to ShipStation

  Background:
    Given I am signed in to Orders

  @update_orders_to_shipstation_int
  Scenario:  Update ShipStation

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name          | company          | street_address_1  | street_address_2 | city   | province | postal_code | country | phone         |  email            |
      | Customer Name | Customer Company | Street Address 1  | Street Address 2 | City   | Province | PostalCode  | France  | 415-411-1111  | rtest@stamps.com  |

    Then Details: Select Service Priority Mail International Package/Flat/Thick Envelope

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

    Then Details: Expect Ship-To Country to be France
    Then Details: Expect International Ship-To Name to be Customer Name
    Then Details: Expect International Ship-To Company to be Customer Company
    Then Details: Expect International Ship-To Address 1 to be Street Address 1
    Then Details: Expect International Ship-To Address 2 to be Street Address 2
    Then Details: Expect International Ship-To City to be City
    Then Details: Expect International Ship-To Province to be Province
    Then Details: Expect International Ship-To Postal Code to be PostalCode
    Then Details: Expect International Ship-To Phone to be 415-411-1111

    Then Details: Expect Service to be "Priority Mail International Package"
    Then Details: Expect Reference Number to be Reference #123

    Then Details: Expect Insure-For to be $50.25

    Then Details: Expect Item 1 Qty to be 1
    Then Details: Expect Item 1 ID to be ID 1
    Then Details: Expect Item 1 Description to be Description 1

    Then Details: Expect Item 2 Qty to be 2
    Then Details: Expect Item 2 ID to be ID 2
    Then Details: Expect Item 2 Description to be Description 2

    Then Details: Expect Item 1 Qty to be 1
    Then Details: Expect Item 1 ID to be ID 1
    Then Details: Expect Item 1 Description to be Description 1

    Then Details: Expect Item 2 Qty to be 2
    Then Details: Expect Item 2 ID to be ID 2
    Then Details: Expect Item 2 Description to be Description 2

    Then Grid: Uncheck row 1
    Then Pause for 2 seconds
    Then Grid: Check row 1
    Then Pause for 1 second

    Then Details: Expect Ship-To Country to be France
    Then Details: Expect International Ship-To Name to be Customer Name
    Then Details: Expect International Ship-To Company to be Customer Company
    Then Details: Expect International Ship-To Address 1 to be Street Address 1
    Then Details: Expect International Ship-To Address 2 to be Street Address 2
    Then Details: Expect International Ship-To City to be City
    Then Details: Expect International Ship-To Province to be Province
    Then Details: Expect International Ship-To Postal Code to be PostalCode
    Then Details: Expect International Ship-To Phone to be 415-411-1111

    Then Details: Expect Service to be "Priority Mail International Package"

    Then Details: Expect Insure-For to be $50.25

    Then Details: Expect Reference Number to be Reference #123

    Then Details: Expect Item 1 Qty to be 1
    Then Details: Expect Item 1 ID to be ID 1
    Then Details: Expect Item 1 Description to be Description 1

    Then Details: Expect Item 2 Qty to be 2
    Then Details: Expect Item 2 ID to be ID 2
    Then Details: Expect Item 2 Description to be Description 2

    Then Details: Expect Item 1 Qty to be 1
    Then Details: Expect Item 1 ID to be ID 1
    Then Details: Expect Item 1 Description to be Description 1

    Then Details: Expect Item 2 Qty to be 2
    Then Details: Expect Item 2 ID to be ID 2
    Then Details: Expect Item 2 Description to be Description 2

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

    Then Customs: Expect Package Contents to be Commercial Sample
    Then Customs: Expect License Number to be 123456
    Then Customs: Expect Certificate Number to be 12345678
    Then Customs: Expect Invoice Number to be Invoice123

    Then Customs: Expect Non-Delivery to be Treat as abandoned

    Then Customs: Expect Internal Transaction Number to be Required
    Then Customs: Expect ITN Number to be ITN123

    Then Customs: Add Item 1
    Then Customs: Set Item Description to item 1
    Then Customs: Set Item Qty to 1
    Then Customs: Set Item Unit Price to 11.11
    #Then Customs: Set Item Pounds to 1
    #Then Customs: Set Item Ounces to 1
    Then Customs: Set Item Origin Country to United States
    Then Customs: Set Item Tarriff to 100

    Then Customs: Add Item 2
    Then Customs: Set Item Description to item 2
    Then Customs: Set Item Qty to 2
    Then Customs: Set Item Unit Price to 22.22
    #Then Customs: Set Item Pounds to 2
    #Then Customs: Set Item Ounces to 2
    Then Customs: Set Item Origin Country to United States
    Then Customs: Set Item Tarriff to 200

    Then Customs: Check I agree to the USPS Privacy Act Statement

    Then Pause for 1 second
    Then Customs: Close Form
    Then Pause for 2 seconds

    Then Grid: Uncheck row 1
    Then Pause for 2 seconds
    Then Grid: Check row 1
    Then Pause for 1 second

    Then Details: Edit Customs Form
    Then Pause for 1 second

    Then Customs: Expect I agree to the USPS Privacy Act Statement is checked

    Then Customs: Expect Package Contents to be Commercial Sample
    Then Customs: Expect License Number to be 123456
    Then Customs: Expect Certificate Number to be 12345678
    Then Customs: Expect Invoice Number to be Invoice123

    Then Customs: Expect Non-Delivery to be Treat as abandoned

    Then Customs: Expect Internal Transaction Number to be Required
    Then Customs: Expect ITN Number to be ITN123

    Then Customs: Expect Item 1 Description to be item 1
    Then Customs: Expect Item 1 Quantity to be 1
    Then Customs: Expect Item 1 Unit Price to be 11.11
    Then Customs: Expect Item 1 Pounds to be 1
    Then Customs: Expect Item 1 Ounces to be 1
    Then Customs: Expect Item 1 Origin Country to be United States
    Then Customs: Expect Item 1 Tariff to be 100

    Then Customs: Expect Item 2 Description to be item 2
    Then Customs: Expect Item 2 Quantity to be 2
    Then Customs: Expect Item 2 Unit Price to be 22.22
    Then Customs: Expect Item 2 Pounds to be 2
    Then Customs: Expect Item 2 Ounces to be 2
    Then Customs: Expect Item 2 Origin Country to be United States
    Then Customs: Expect Item 2 Tariff to be 200


    Then Customs: Close Form

    Then Pause for 1 second
    Then Sign out



