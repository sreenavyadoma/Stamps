
Feature: As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media @reprint @reprint_media_dev
  Scenario: User Reprints Order - Domestic

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to domestic address
      | name         | company           | street_address  |street_address_2|  city        | state| zip   | country       | phone  |  email |
      | Reprint Test | 4.125 x 6.25 roll | 604 Arizona Ave |                | Santa Monica | CA   | 90401 | United States | 8885551212 | test@stamps.com |
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 1

    Then Pause for 2 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Print: Print

    Then Filter: Select Shipped
    Then Grid: Check Saved Order ID
    Then Print: Open Reprint Modal
    Then RePrint: Reprint

    Then Sign out

