
Feature: As a batch shipper, I want to be able to permanently agree to international customs privacy policy and restrictions [B-01830]

  Background:
    Given I am signed in as a batch shipper

  Scenario: User Accepts Permanent USPS Terms Agreement

    #Verify Auto-Confirm USPS Terms feature appears in Settings

    When Open Settings Modal
    Then Expect USPS terms settings is Displayed
    Then Expect USPS terms settings is Unchecked
    Then Click on USPS statement link
    Then Expect USPS statement is displayed

    Then Save Settings changes

    #Print an Int'l order with Auto-Confirm turned off

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
    Then Click Print Modal - Print button

    #Print an Int'l order and turn Auto-Confirm on

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
    Then Check Do Not Show Again checkbox in USPS Terms modal
    And Click the I Agree button
    Then Click Print Modal - Print button

    When Open Settings Modal
    Then Expect USPS terms settings is Checked
    Then Save Settings changes

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
    And Print

    When Open Settings Modal
    Then Expect USPS terms settings is Checked
    Then Uncheck USPS terms
    Then Save Settings changes

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

    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 100, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10

    Then Close Customs Information Modal
    Then Set Customs Form I agree to true
    And Print

    When Open Settings Modal
    Then Expect USPS terms settings is Unchecked
    Then Check USPS terms
    Then Save Settings changes

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

    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 100, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10

    Then Close Customs Information Modal
    And Print



