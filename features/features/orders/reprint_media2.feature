
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media @reprint
  Scenario: User Reprints Order - APO | CP72

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to Domestic Address
      | name   | company      | street_address    |street_address_2| city | state | zip    | country       | phone  |  email |
      | Reprint Test | 4x6 roll | PSC 3 BOX 4120  |                | APO  | AE     |  09021  | United States | 8885551212 | test@stamps.com |
    Then Details: Set Weight to 2 lb 1 oz
    Then Details: Select Service PSG Package
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to Merchandise
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal

    Then Pause for 2 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Roll - 4" x 6" Shipping Label"
    Then Print: Print

    Then Left Panel: Select Shipped
    Then Grid: Check Saved Order ID
    Then Print: Open Reprint Modal
    Then RePrint: Reprint

    Then Sign out

