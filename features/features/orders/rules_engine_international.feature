Feature: International Field Validation

  Background:
    Given I am signed in to Orders

  @international_rules_engine_name_stuff @international_rules_engine
  Scenario: Two character minimum for Name & Company
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to Australia
    Then Set International Ship-To Name to "a"
    Then Expect Order Details International Name data error tooltip to be "A first and last name of at least two characters each is required"
    Then Set International Ship-To Name to "a b"
    Then Expect Order Details International Name data error tooltip to be "A first and last name of at least two characters each is required"

    Then Set International Ship-To Name to "abc def"

    Then Set International Ship-To Name to ""
    Then Set International Ship-To Company to ""
    Then Expect Order Details International Company data error tooltip to be "Company name must be at least two characters long"


  @international_rules_engine_1 @international_rules_engine
  Scenario: Add Missing Validation Logic for Phone and International Email
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to Australia
    Then Set International Ship-To Name to ""
    Then Expect Order Details International Name data error tooltip to be "A First Name and Last Name or Company are required"
    Then Set International Ship-To Company to ""
    Then Expect Order Details International Company data error tooltip to be "A First Name and Last Name or Company are required"
    Then Set International Ship-To Address 1 to ""
    Then Expect Order Details International Address 1 data error tooltip to be "The ship to address is a required field"
    Then Set International Ship-To City to ""
    Then Expect Order Details International City data error tooltip to be "The ship to city is a required field"
    Then Set International Ship-To Phone to ""
    Then Expect Order Details International Phone data error tooltip to be "The ship to phone number is a required field"
    Then Set International Ship-To Email to "@@"
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
    Then Expect Order Details International Email data error tooltip to be "Please enter a valid email address"
    Then Expect Grid Ship Cost error to contain "A First Name and Last Name or Company are required"
    Then Expect Grid Ship Cost error to contain "The ship to address is a required field"
    Then Expect Grid Ship Cost error to contain "The ship to city is a required field"
    Then Expect Grid Ship Cost error to contain "The ship to phone number is a required field"
    Then Expect Grid Ship Cost error to contain "Please enter a valid email address"
    And Sign out


  @international_shipping_field_validation @international_rules_engine
  Scenario: Order Details Form  International Shipping fields and Customs Information fields validation
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Package"

    Then Expect Order Details International Address fields are visible
    Then Expect Order Details Domestic Ship-To fields are hidden
    Then Expect Order Details Customs Restrictions button is visible
    Then Expect Order Details Customs Edit Form button is visible

    Then Set Order Details Item - Quantity 1, ID random, Description random

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
    Then Expect Customs Form ITN# to be visible

    Then Set customs form Internal Transaction Number to "Not required"
    Then Expect Customs Form ITN# to be hidden

    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form ITN# to "random"

    Then Set customs form I agree to true
    Then Close customs form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
    And Sign out

  @international_internal_transaction_2500 @international_rules_engine
  Scenario: Customs Form - Internal Transaction # Required for total over $2500

    # Internal Transaction # Required for total over $2500
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Package"

    Then Set Order Details Item - Quantity 1, ID random, Description random
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
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
  @international_rogue_countries @international_rules_engine
  Scenario: Iran - Internal Transaction # Required
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Iran    | random  | random  |

    Then Set Order Details Ounces to 5
    Then Set Order Details Length to 1
    Then Set Order Details Height to 1
    Then Set Order Details Width to 1
    Then Set Order Details Service to "Priority Mail International Package"

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
  @international_rogue_countries @international_rules_engine
  Scenario: Sudan - Internal Transaction # Required
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |

    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Package"

    #Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
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
  @international_rogue_countries @international_rules_engine
  Scenario: Syria - Internal Transaction # Required
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |

    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Package"

    #Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
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
  @international_rogue_countries @international_rules_engine
  Scenario: Cuba - Internal Transaction # Required
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to Cuba
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |

    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Package"

    #Then Set Order Details Service to Priority Mail International Flat Rate Envelope
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
  @international_rogue_countries @international@international_rogue_countries_nk @international_failure @international_rules_engine
  Scenario: North Korea - Internal Transaction # Required
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to Democratic People's Republic of (North) Korea
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Democratic People's Republic of (North) Korea| random  | random  |
    #Then Set Order Details Service to Priority Mail International Flat Rate Envelope

    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Package"

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
  @international_rogue_countries @international_rules_engine
  Scenario: Internal Transaction # Not Required
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
    #Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Package"

    Then Set Order Details Ounces to 5
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
