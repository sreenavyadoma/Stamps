
Feature: As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media_raytest2
  Scenario: User Reprints Order - APO

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | Reprint Test | 4x6 roll | PSC 3 BOX 4120  | APO  | AE     |  09021  | United States | 8885551212 | test@stamps.com |
    Then Order Details: Set Weight to 2 lbs 1 oz
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Open Customs Form
    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Lbs 2, Oz 1 Origin United States, Tariff 10
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form

    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print Modal: Set Media "Roll - 4" x 6" Shipping Label"
    Then Toolbar: Print

    Then Filter Panel - Shipped

    Then Set Orders Grid New Order ID to check
    Then Open Reprint Modal
    Then Reprint Modal: Set Media "Roll - 4" x 6" Shipping Label"
    Then Toolbar: Reprint

    Then Sign out

