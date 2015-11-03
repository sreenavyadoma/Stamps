Feature:  International and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in as a batch shipper gc/qacc/auto39/326tsetaqcdS!

  @international @international_data_error @international_failure
  Scenario:  Customs Form Data Error
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |

    Then Set single-order form Ounces to 5
    Then Set single-order form Service to "Priority Mail International Package"

    Then Add single-order form Item - Quantity 1, ID random, Description random

    And Open customs form

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 5, Weight(oz) 1 Origin United States , Tariff 100

    Then Expect Customs Form Total Weight Data Error to be The itemized weight exceeds the package weight
    Then Close customs form
    And Sign out
    
  @international @international_totals
  Scenario:  Customs Form Grid Items Add/Delete
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |

    Then Set single-order form Ounces to 5
    Then Set single-order form Service to "Priority Mail International Package"

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
    And Sign out

  @international @international_delete_line_items
  Scenario:  Customs Form Grid Items Add/Delete
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |

    Then Set single-order form Ounces to 5
    Then Set single-order form Service to "Priority Mail International Package"

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
    And Sign out

  @international_shipping_field_validation @_international
  Scenario: single-order form International Shipping fields and Customs Information fields validation
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Set single-order form Ounces to 5
    Then Set single-order form Service to "Priority Mail International Package"

    Then Expect single-order form International Address fields are visible
    Then Expect single-order form Domestic Ship-To fields are hidden
    Then Expect single-order form Customs Restrictions button is visible
    Then Expect single-order form Customs Edit Form button is visible

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
    Then Set single-order form Service to "First-Class Mail International Large Envelope/Flat"
    And Sign out

  @international_internal_transaction_2500 @international
  Scenario: Customs Form - Internal Transaction # Required for total over $2500

    # Internal Transaction # Required for total over $2500
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Set single-order form Ounces to 5
    Then Set single-order form Service to "Priority Mail International Package"

    Then Add single-order form Item - Quantity 1, ID random, Description random
    Then Set single-order form Service to "First-Class Mail International Large Envelope/Flat"
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 1, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Not required"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 2501, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form
    And Sign out

      # Iran - Internal Transaction #
  @international_rogue_countries @international
  Scenario: Iran - Internal Transaction # Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Iran    | random  | random  |

    Then Set single-order form Ounces to 5
    Then Set single-order form Length to 1
    Then Set single-order form Height to 1
    Then Set single-order form Width to 1
    Then Set single-order form Service to "Priority Mail International Package"

    And Open customs form
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form
    And Sign out

      # Sudan - Internal Transaction # Required
  @international_rogue_countries @international
  Scenario: Sudan - Internal Transaction # Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |

    Then Set single-order form Ounces to 5
    Then Set single-order form Service to "Priority Mail International Package"

    #Then Set single-order form Service to "First-Class Mail International Large Envelope/Flat"
    And Open customs form
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form
    And Sign out

      # Syria - Internal Transaction # Required
  @international_rogue_countries @international
  Scenario: Syria - Internal Transaction # Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |

    Then Set single-order form Ounces to 5
    Then Set single-order form Service to "Priority Mail International Package"

    #Then Set single-order form Service to "First-Class Mail International Large Envelope/Flat"
    And Open customs form
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form
    And Sign out

      # Cuba - Internal Transaction # Required
  @international_rogue_countries @international
  Scenario: Cuba - Internal Transaction # Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order Ship-To country to Cuba
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |

    Then Set single-order form Ounces to 5
    Then Set single-order form Service to "Priority Mail International Package"

    #Then Set single-order form Service to Priority Mail International Flat Rate Envelope
    And Open customs form
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form
    And Sign out

      # North Korea - Internal Transaction # Required
  @international_rogue_countries @international@international_rogue_countries_nk @international_failure
  Scenario: North Korea - Internal Transaction # Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order Ship-To country to Democratic People's Republic of (North) Korea
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Democratic People's Republic of (North) Korea    | random  | random  |
    #Then Set single-order form Service to Priority Mail International Flat Rate Envelope

    Then Set single-order form Ounces to 5
    Then Set single-order form Service to "Priority Mail International Package"

    And Open customs form
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Required"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form
    And Sign out

      # Philippines - Internal Transaction # Required
  @international_rogue_countries @international
  Scenario: Internal Transaction # Not Required
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
    #Then Set single-order form Service to "First-Class Mail International Large Envelope/Flat"

    Then Set single-order form Ounces to 5
    Then Set single-order form Service to "Priority Mail International Package"

    Then Set single-order form Ounces to 5
    And Open customs form
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Set customs form Package Contents to "Other"
    Then Expect Customs Form Internal Transaction # to be "Not required"

    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form
    And Sign out
