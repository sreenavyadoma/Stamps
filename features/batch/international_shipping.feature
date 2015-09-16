Feature:  International and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in as a batch shipper ie/auto39/password1

  @international @regression @international_delete_line_items
  Scenario:  Customs Form Grid Items Add/Delete
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set Ounces to 1
    Then Set Pounds to 1
    Then Add Item with Quantity 1, ID random, Description random

    And Open Customs Form

    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 200, Weight(lbs) 1, Weight(oz) 1 Origin United States , Tariff 10
    Then Expect Customs Form Item Grid count to be 1
    And Add Customs Form Item 2; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States , Tariff 2
    Then Expect Customs Form Item Grid count to be 2
    And Add Customs Form Item 3; Description=random, Qty 1, Unit Price 100, Weight(lbs) 1, Weight(oz) 1 Origin United States , Tariff 17
    Then Expect Customs Form Item Grid count to be 3

    Then Delete Customs Form Item 3
    Then Expect Customs Form Item Grid count to be 2
    Then Delete Customs Form Item 1
    Then Expect Customs Form Item Grid count to be 1

    And Add Customs Form Item 2; Description=random, Qty 1, Unit Price 50, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 188
    And Add Customs Form Item 3; Description=random, Qty 1, Unit Price 45, Weight(lbs) 1, Weight(oz) 1 Origin United States , Tariff 78
    And Add Customs Form Item 4; Description=random, Qty 1, Unit Price 188, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 8
    And Add Customs Form Item 5; Description=random, Qty 1, Unit Price 23, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 367
    And Add Customs Form Item 6; Description=random, Qty 1, Unit Price 456, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 88
    And Add Customs Form Item 7; Description=random, Qty 1, Unit Price 234, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 98

    Then Expect Customs Form Item Grid count to be 7

    Then Set Customs Form I agree to true
    Then Close Customs Information Modal

  @international_shipping_field_validation @_international @regression
  Scenario: Single Order Form International Shipping fields and Customs Information fields validation
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Expect Single Order Form International Address fields are visible
    Then Expect Single Order Form Domestic Ship-To fields are hidden
    Then Expect Single Order Form Customs Restrictions button is visible
    Then Expect Single Order Form Customs Edit Form button is visible

    Then Add Item with Quantity 1, ID random, Description random

    And Open Customs Form

    Then Set Customs Form Package Contents = Commercial Sample
    Then Expect Customs Form More Info to be hidden
    Then Expect Customs Form License# to be visible
    Then Expect Customs Form Certificate# to be visible
    Then Expect Customs Form Invoice# to be visible

    Then Set Customs Form Package Contents = Document
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set Customs Form Package Contents = Gift
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set Customs Form Package Contents = Humanitarian Donation
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set Customs Form Package Contents = Merchandise
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set Customs Form Package Contents = Returned Goods
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set Customs Form Package Contents = Commercial Sample
    Then Expect Customs Form More Info to be hidden
    Then Set Customs Form License# = random
    Then Set Customs Form Certificate# = random
    Then Set Customs Form Invoice# = random

    Then Set Customs Form Non-Delivery Options = Treat as abandoned
    Then Set Customs Form Non-Delivery Options = Return to sender

    Then Set Customs Form Internal Transaction # = Required
    Then Expect Customs Form ITN# to be enabled

    Then Set Customs Form Internal Transaction # = Not required
    Then Expect Customs Form ITN# to be disabled

    Then Set Customs Form Internal Transaction # = Required
    Then Set Customs Form ITN# = random

    Then Set Customs Form I agree to true
    Then Close Customs Information Modal
    Then Set Service to First-Class Mail International Large Envelope

  @international_rogue_countries @international @regression
  Scenario: Customs Form - Internal Transaction # Required for total over $2500

    # Internal Transaction # Required for total over $2500
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Set Ounces to 1
    Then Set Pounds to 1
    Then Add Item with Quantity 1, ID random, Description random
    Then Set Service to First-Class Mail International Large Envelope
    And Open Customs Form
    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form ITN# = random
    Then Set Customs Form I agree to true
    Then Close Customs Information Modal

      # Iran - Internal Transaction #
  @international_rogue_countries @international @regression
  Scenario: Iran - Internal Transaction # Required
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Iran    | random  | random  |
    And Open Customs Form
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Commercial Sample
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Document
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Merchandise
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Gift
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Humanitarian Donation
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Returned Goods
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Other
    Then Expect Customs Form Internal Transaction # to be Required

    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form ITN# = random
    Then Set Customs Form I agree to true
    Then Close Customs Information Modal

      # Sudan - Internal Transaction # Required
  @international_rogue_countries @international @regression
  Scenario: Sudan - Internal Transaction # Required
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |
    #Then Set Service to First-Class Mail International Large Envelope
    And Open Customs Form
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Commercial Sample
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Document
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Merchandise
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Gift
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Humanitarian Donation
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Returned Goods
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Other
    Then Expect Customs Form Internal Transaction # to be Required

    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form ITN# = random
    Then Set Customs Form I agree to true
    Then Close Customs Information Modal

      # Syria - Internal Transaction # Required
  @international_rogue_countries @international @regression
  Scenario: Syria - Internal Transaction # Required
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |
    #Then Set Service to First-Class Mail International Large Envelope
    And Open Customs Form
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Commercial Sample
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Document
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Merchandise
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Gift
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Humanitarian Donation
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Returned Goods
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Other
    Then Expect Customs Form Internal Transaction # to be Required

    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form ITN# = random
    Then Set Customs Form I agree to true
    Then Close Customs Information Modal

      # Cuba - Internal Transaction # Required
  @international_rogue_countries @international @regression
  Scenario: Cuba - Internal Transaction # Required
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to Cuba
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |
    #Then Set Service to Priority Mail International Flat Rate Envelope
    And Open Customs Form
    Then Set Customs Form Package Contents = Commercial Sample
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Document
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Merchandise
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Gift
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Humanitarian Donation
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Returned Goods
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Other
    Then Expect Customs Form Internal Transaction # to be Required

    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form ITN# = random
    Then Set Customs Form I agree to true
    Then Close Customs Information Modal

      # North Korea - Internal Transaction # Required
  @international_rogue_countries @international @regression@international_rogue_countries_nk
  Scenario: North Korea - Internal Transaction # Required
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to Democratic People's Republic of (North) Korea
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Democratic People's Republic of (North) Korea    | random  | random  |
    #Then Set Service to Priority Mail International Flat Rate Envelope
    And Open Customs FormRequired
    Then Set Customs Form Package Contents = Commercial Sample
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Document
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Merchandise
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Gift
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Humanitarian Donation
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Returned Goods
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form Package Contents = Other
    Then Expect Customs Form Internal Transaction # to be

    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form ITN# = random
    Then Set Customs Form I agree to true
    Then Close Customs Information Modal

      # Philippines - Internal Transaction # Required
  @international_rogue_countries @international @regression
  Scenario: Internal Transaction # Not Required
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
    #Then Set Service to First-Class Mail International Large Envelope
    And Open Customs Form
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Commercial Sample
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Document
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Merchandise
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Gift
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Humanitarian Donation
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Returned Goods
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set Customs Form Package Contents = Other
    Then Expect Customs Form Internal Transaction # to be Not required

    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set Customs Form ITN# = random
    Then Set Customs Form I agree to true
    Then Close Customs Information Modal

  @apo_shipping @c @regression
  Scenario: Domestic APO Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to United States
    Then Set Ship-To address to
      | name   | company      | street_address | city | state | zip         | country       | phone  |  email |
      | random | Domestic APO | Unit 15324     | APO  | AP    | 96205-5324  | United States | random | random |
    Then Set Service to Priority Mail Package
    Then Print

  @fpo_shipping @international @regression
  Scenario: Domestic FPO Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to United States
    Then Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | Uss Mason DDG 87  | FPO  | AE    | 09578  | United States | random | random |
    Then Set Service to Priority Mail Package
    Then Print

  @dpo_shipping @international @regression
  Scenario: Domestic DPO Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to United States
    Then Set Ship-To address to
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | random | Domestic DPO | Unit 8400, Box 0000 | DPO  | AE    | 09498-9997 | United States | random | random |
    Then Set Service to Priority Mail Package
    Then Print

  @non_domestic_shipping @international @regression
  Scenario: APO Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to United States
    Then Set Ship-To address to
      | name   | company      | street_address | city | state | zip         | country       | phone  |  email |
      | random | Domestic APO | Unit 15324     | APO  | AP    | 96205-5324  | United States | random | random |
    Then Set Service to Priority Mail Package
    Then Expect Single Order Form Customs Edit Form button is visible
    Then Expect Single Order Form Customs Restrictions button is hidden
    Then Print
