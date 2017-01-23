
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media @reprint @reprint_media_dev
  Scenario: User Reprints Order - Domestic

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To to Domestic Address
      | name         | company           | street_address  |street_address_2|  city        | state| zip   | country       | phone  |  email |
      | Reprint Test | 4.125 x 6.25 roll | 604 Arizona Ave |                | Santa Monica | CA   | 90401 | United States | 8885551212 | test@stamps.com |
    Then Order Details: Select Service PM Package
    Then Order Details: Set Ounces to 1

    Then Pause for 2 seconds
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Print Modal: Print

    Then Filter Panel: Select Shipped
    Then Orders Grid: Check saved Order ID
    Then Print Modal: Open Reprint Modal
    Then RePrint Modal: Reprint

    Then Sign out

