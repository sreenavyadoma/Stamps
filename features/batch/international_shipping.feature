Feature:  International and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in as a batch shipper ie/auto39/password1

    @international_shipping_field_validation @international @regression
    Scenario: Single Order Form International Shipping fields and Customs Information fields validation

      And I Add a new order
      Then Set Ship From to default
      Then Set Ship-To country to Canada
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
    Scenario:
      And I Add a new order
      Then Set Ship From to default
      Then Set Ship-To to international address
        | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
        | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
      Then Set Ounces to 1
      Then Set Pounds to 1
      Then Set Service to First-Class Mail International Large Envelope
      Then Add Item with Quantity 1, ID random, Description random
      And Open Customs Form
      And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form ITN# = random
      Then Set Customs Form I agree to true
      Then Close Customs Information Modal

      #Iran - Internal Transaction # Required
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
      Then Close Customs Information Modal

      And I Add a new order
      Then Set Ship From to default
      Then Set Ship-To to international address
        | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
        | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |
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
      Then Close Customs Information Modal

      And I Add a new order
      Then Set Ship From to default
      Then Set Ship-To to international address
        | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
        | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |
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
      Then Close Customs Information Modal

      And I Add a new order
      Then Set Ship From to default
      Then Set Ship-To to international address
        | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
        | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |
      And Open Customs Form
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Commercial Sample
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Document
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Merchandise
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Gift
      Then Expect Customs Form Internal Transaction # to be Not required
      Then Set Customs Form Package Contents = Humanitarian Donation
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Returned Goods
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Other
      Then Expect Customs Form Internal Transaction # to be Required
      Then Close Customs Information Modal

      And I Add a new order
      Then Set Ship From to default
      Then Set Ship-To to international address
        | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
        | random | random  | random           | random           | random | random  | random      | North Korea    | random  | random  |
      And Open Customs Form
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Commercial Sample
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Document
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Merchandise
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Gift
      Then Expect Customs Form Internal Transaction # to be Not required
      Then Set Customs Form Package Contents = Humanitarian Donation
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Returned Goods
      Then Expect Customs Form Internal Transaction # to be Required
      Then Set Customs Form Package Contents = Other
      Then Expect Customs Form Internal Transaction # to be Required
      Then Close Customs Information Modal

      And I Add a new order
      Then Set Ship From to default
      Then Set Ship-To to international address
        | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
        | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
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
      Then Close Customs Information Modal

  @apo_shipping @international @regression
  Scenario: APO Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to United States
    Then Set Ship-To address to
      | name   | company      | street_address | city | state | zip         | country       | phone  |  email |
      | random | Domestic APO | Unit 15324     | APO  | AP    | 96205-5324  | United States | random | random |
    Then Set Service to Priority Mail Package
    Then Print

  @fpo_shipping @international @regression
  Scenario: APO Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to United States
    Then Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | Uss Mason DDG 87  | FPO  | AE    | 09578  | United States | random | random |
    Then Set Service to Priority Mail Package
    Then Print

  @dpo_shipping @international @regression
  Scenario: APO Address
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
