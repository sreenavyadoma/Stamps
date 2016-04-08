
Feature: As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media @reprint
  Scenario: User Reprints Order - APO | CP72

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | Reprint Test | 4x6 roll | PSC 3 BOX 4120  | APO  | AE     |  09021  | United States | 8885551212 | test@stamps.com |
    Then Details: Set Weight to 2 lbs 1 oz
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 2, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form

    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print: Set Media "Roll - 4" x 6" Shipping Label"
    Then Toolbar: Print

    Then Filter: Select Shipped
    Then Grid: Check New Order ID
    Then Open Reprint Modal
    Then RePrint: Reprint

    Then Sign out

