Feature: As a batch shipper, I want to be able to print on SDC-1200 labels [B-01666]

  Background:
    Given I am signed in as a batch shipper

  @sdc1200 @regression
  Scenario: Print Domestic Address on SDC-1200

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Package
    And Open Print Modal
    Then Hover over SDC-1200 Shipping label
    Then Expect SDC-1200 Tooltip message
    Then type SDC Printing On drop down list
    Then Select SDC-1200 Shipping label
    Then Click Print Modal - Print button
    And Sign out

  @sdc1200 @regression
  Scenario: Print Error for International Address on SDC-1200

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to Canada
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Add Item with Quantity 1, ID random, Description random

    And Open Customs Form

    Then Set Customs Form Package Contents = Merchandise
    Then Set Customs Form Non-Delivery Options = Return to sender
    Then Set Customs Form Internal Transaction # = Required
    Then Set Customs Form More Info = random
    Then Set Customs Form ITN# = random

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10

    Then Close Customs Information Modal

    And Open Print Modal

    Then Expect USPS Terms modal appears
    Then click cancel on  USPS Terms modal
    Then Open Print Modal
    And Click the I Agree button
    Then Print on Select SDC-1200 Shipping label
    Then Click Print Modal - Print button
    And Expect Print On error modal