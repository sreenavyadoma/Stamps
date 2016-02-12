
Feature: As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media @reprint
  Scenario: User Reprints Order - US Territory | CP72

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | Reprint Test | 8.5x11 Plain Paper | PO Box 10281  | Palau  | PW     |  96940-0881  | United States | 8885551212 | test@stamps.com |
    Then Order Details: Set Weight to 2 lbs 1 oz
    Then Order Details: Set Service to "Media Mail"
    Then Open Customs Form
    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Lbs 2, Oz 1 Origin United States, Tariff 10
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form

    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print

    Then Filter Panel - Shipped
    Then Set Orders Grid New Order ID to check
    Then Open Reprint Modal
    Then Reprint Modal: Reprint

    Then Sign out

