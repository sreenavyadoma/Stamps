Feature:  International and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in as a batch shipper ff/qacc/auto39/password1

  @international @regression @international_data_error @international_failure
  Scenario:  Customs Form Data Error
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set single-order form Ounces to 1
    Then Set single-order form Pounds to 1
    Then Add single-order form Item - Quantity 1, ID random, Description random

    And Open customs form

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 5, Weight(oz) 1 Origin United States , Tariff 100

    Then Expect Customs Form Total Weight Data Error to be The itemized weight exceeds the package weight
    
  @international @regression @international_totals
  Scenario:  Customs Form Grid Items Add/Delete
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set single-order form Ounces to 1
    Then Set single-order form Pounds to 1
    Then Add single-order form Item - Quantity 1, ID random, Description random

    And Open customs form

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 1, Weight(oz) 1 Origin United States , Tariff 100
    Then Expect Customs Form Total Value to be 100.50
    Then Expect Customs Form Total Pounds to be 1
    Then Expect Customs Form Total Ounces to be 1

    And Add or Edit Customs Form Item 2; Description=random, Qty 1, Unit Price 100.25, Weight(lbs) 1, Weight(oz) 1 Origin United States , Tariff 100
    Then Expect Customs Form Total Value to be 200.75
    Then Expect Customs Form Total Pounds to be 2
    Then Expect Customs Form Total Ounces to be 2

    Then Set customs form I agree to true
    Then Close customs form

  @international @regression @international_delete_line_items
  Scenario:  Customs Form Grid Items Add/Delete
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set single-order form Ounces to 1
    Then Set single-order form Pounds to 1
    Then Add single-order form Item - Quantity 1, ID random, Description random

    And Open customs form

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 1000, Weight(lbs) 1, Weight(oz) 1 Origin United States , Tariff 100
    Then Expect Customs Form Item Grid count to be 1
    And Add or Edit Customs Form Item 2; Description=random, Qty 2, Unit Price 2000, Weight(lbs) 2, Weight(oz) 2 Origin United States , Tariff 200
    Then Expect Customs Form Item Grid count to be 2
    And Add or Edit Customs Form Item 3; Description=random, Qty 3, Unit Price 3000, Weight(lbs) 3, Weight(oz) 3 Origin United States , Tariff 300
    Then Expect Customs Form Item Grid count to be 3

    Then Delete Customs Form Item 3
    Then Expect Customs Form Item Grid count to be 2
    Then Delete Customs Form Item 1
    Then Expect Customs Form Item Grid count to be 1

    Then Set customs form I agree to true
    Then Close customs form

  @international_shipping_field_validation @_international @regression
  Scenario: Single Order Form International Shipping fields and Customs Information fields validation
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Expect Single Order Form International Address fields are visible
    Then Expect Single Order Form Domestic Ship-To fields are hidden
    Then Expect Single Order Form Customs Restrictions button is visible
    Then Expect Single Order Form Customs Edit Form button is visible

    Then Add single-order form Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form More Info to be hidden
    Then Expect Customs Form License# to be visible
    Then Expect Customs Form Certificate# to be visible
    Then Expect Customs Form Invoice# to be visible

    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form More Info to be hidden
    Then Set customs form License# to "random"
    Then Set customs form Certificate Number to "random"
    Then Set customs form Invoice Number to "random"

    Then Set customs form Non-Delivery Options to "Treat as abandoned"
    Then Set customs form Non-Delivery Options to "Return to sender"

    Then Set customs form Internal Transaction Number to "Required"
    Then Expect Customs Form ITN# to be enabled

    Then Set customs form Internal Transaction Number to "Not required"
    Then Expect Customs Form ITN# to be disabled

    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form ITN# to "random"

    Then Set customs form I agree to true
    Then Close customs form
    Then Set single-order form Service to "First-Class Mail International Large Envelope"

  @international_internal_transaction_2500 @international @regression
  Scenario: Customs Form - Internal Transaction # Required for total over $2500

    # Internal Transaction # Required for total over $2500
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Set single-order form Ounces to 1
    Then Set single-order form Pounds to 1
    Then Add single-order form Item - Quantity 1, ID random, Description random
    Then Set single-order form Service to "First-Class Mail International Large Envelope"
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 2499, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Not required
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 2501, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form

      # Iran - Internal Transaction #
  @international_rogue_countries @international @regression
  Scenario: Iran - Internal Transaction # Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Iran    | random  | random  |
    And Open customs form
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be Required

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form

      # Sudan - Internal Transaction # Required
  @international_rogue_countries @international @regression
  Scenario: Sudan - Internal Transaction # Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |
    #Then Set single-order form Service to "First-Class Mail International Large Envelope"
    And Open customs form
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be Required

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form

      # Syria - Internal Transaction # Required
  @international_rogue_countries @international @regression
  Scenario: Syria - Internal Transaction # Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |
    #Then Set single-order form Service to "First-Class Mail International Large Envelope"
    And Open customs form
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be Required

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form

      # Cuba - Internal Transaction # Required
  @international_rogue_countries @international @regression
  Scenario: Cuba - Internal Transaction # Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to Cuba
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |
    #Then Set single-order form Service to Priority Mail International Flat Rate Envelope
    And Open customs form
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be Required

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form

      # North Korea - Internal Transaction # Required
  @international_rogue_countries @international @regression@international_rogue_countries_nk @international_failure
  Scenario: North Korea - Internal Transaction # Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to Democratic People's Republic of (North) Korea
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Democratic People's Republic of (North) Korea    | random  | random  |
    #Then Set single-order form Service to Priority Mail International Flat Rate Envelope
    And Open customs form
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be Required

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form

      # Philippines - Internal Transaction # Required
  @international_rogue_countries @international @regression
  Scenario: Internal Transaction # Not Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
    #Then Set single-order form Service to "First-Class Mail International Large Envelope"
    And Open customs form
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be Not required
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be Not required

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form

  @apo_shipping @c @regression
  Scenario: Domestic APO Address
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address | city | state | zip         | country       | phone  |  email |
      | random | Domestic APO | Unit 15324     | APO  | AP    | 96205-5324  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Print

  @fpo_shipping @international @regression
  Scenario: Domestic FPO Address
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | Uss Mason DDG 87  | FPO  | AE    | 09578  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Print

  @dpo_shipping @international @regression
  Scenario: Domestic DPO Address
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | random | Domestic DPO | Unit 8400, Box 0000 | DPO  | AE    | 09498-9997 | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Print

  @non_domestic_shipping @international @regression @apo_printing
  Scenario: APO Address
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address | city | state | zip         | country       | phone  |  email |
      | random | Domestic APO | Unit 15324     | APO  | AP    | 96205-5324  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    Then Expect Single Order Form Customs Edit Form button is visible
    Then Expect Single Order Form Customs Restrictions button is hidden
    Then Print
