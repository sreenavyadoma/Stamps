
Feature: As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media @reprint
  Scenario: User Reprints Order - Domestic

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To address to
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | Reprint Test | 4.125 x 6.25 roll | 604 Arizona Ave | Santa Monica | CA | 90401 | United States | 8885551212 | test@stamps.com |
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Ounces to 1

    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print Modal: Set Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Toolbar: Print

    Then Filter Panel - Shipped
    Then Set Orders Grid New Order ID to check
    Then Open Reprint Modal
    Then Reprint Modal: Reprint

    Then Sign out

