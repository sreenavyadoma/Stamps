
@international_rules
Feature: All International Rules

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international_dev
  Scenario: Add Missing Validation Logic for Phone and International Email
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to Australia
    Then check Orders Grid row 1

    Then expect Order Details form International Name data error tooltip is "A first and last name of at least two characters each is required"
    Then expect Order Details form International Company data error tooltip is "Company name must be at least two characters long"
    Then expect Order Details form International Address 1 data error tooltip is "The ship to address is a required field"
    Then expect Order Details form International City data error tooltip is "The ship to city is a required field"
    Then expect Order Details form International Phone data error tooltip is "A valid phone number is required"

    Then expect Order Details form service data error tooltip is "Service is required"
    Then expect Order Details form Weight Lbs data error tooltip is "Weight cannot be 0"
    Then expect Order Details form Weight Oz data error tooltip is "Weight cannot be 0"
    Then Sign out


  @rules_international_cuba
  Scenario: Cuba Internal Transaction Number Required
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |

    Then set Order Details form Ounces to 5
    Then set Order Details form service to PMI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required

    Then add Customs form Associated Item 1, Description random, Qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Sign out


  @rules_international_iran
  Scenario: Iran Internal Transaction Number Required
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Iran    | random  | random  |
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PMI Flat Rate Envelope

    Then click Order Details form Edit Form button
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required

    Then add Customs form Associated Item 1, Description random, Qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Sign out



  @rules_international_customs_fields_validation
  Scenario: International Shipping fields and Customs Information fields validation
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to Japan

    Then expect Order Details form International Address fields are visible
    Then expect Order Details form Domestic Ship-To fields are hidden
    Then expect Order Details form Customs Restrictions button is visible
    Then expect Order Details form Customs Edit Form button is visible

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then set Order Details form Ounces to 5
    Then set Order Details form service to PMI Flat Rate Envelope
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Commercial Sample
    Then expect Customs form More Info is hidden
    Then expect Customs form License Number is visible
    Then expect Customs form Certificate Number is visible
    Then expect Customs form Invoice Number is visible

    Then set Customs form Package Contents to Document
    Then expect Customs form More Info is visible
    Then expect Customs form License Number is hidden
    Then expect Customs form Certificate Number is hidden
    Then expect Customs form Invoice Number is hidden

    Then set Customs form Package Contents to Gift
    Then expect Customs form More Info is visible
    Then expect Customs form License Number is hidden
    Then expect Customs form Certificate Number is hidden
    Then expect Customs form Invoice Number is hidden

    Then set Customs form Package Contents to Humanitarian Donation
    Then expect Customs form More Info is visible
    Then expect Customs form License Number is hidden
    Then expect Customs form Certificate Number is hidden
    Then expect Customs form Invoice Number is hidden

    Then set Customs form Package Contents to Merchandise
    Then expect Customs form More Info is visible
    Then expect Customs form License Number is hidden
    Then expect Customs form Certificate Number is hidden
    Then expect Customs form Invoice Number is hidden

    Then set Customs form Package Contents to Returned Goods
    Then expect Customs form More Info is visible
    Then expect Customs form License Number is hidden
    Then expect Customs form Certificate Number is hidden
    Then expect Customs form Invoice Number is hidden

    Then set Customs form Package Contents to Commercial Sample
    Then expect Customs form More Info is hidden
    Then set Customs form License Number to random
    Then set Customs form Certificate Number to random
    Then set Customs form Invoice Number to random

    Then set Customs form Non-Delivery Options to Treat as abandoned
    Then set Customs form Non-Delivery Options to Return to sender

    Then set Customs form Internal Transaction Number to Required
    Then expect Customs form ITN Number is visible

    Then set Customs form Internal Transaction Number to Not required
    Then expect Customs form ITN Number is hidden

    Then set Customs form Internal Transaction Number to Required
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set Order Details form service to FCMI Large Envelope
    Then Sign out



  @rules_international_nkorea
  Scenario: North Korea Internal Transaction Number Required
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Democratic People's Republic of (North) Korea| random  | random  |
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PMI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Sign out



  @international_rogue_countries_sudan
  Scenario: Sudan Internal Transaction Number Required
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |

    Then set Order Details form Ounces to 5
    Then set Order Details form service to PMI Flat Rate Envelope

  #Then set Order Details form service to FCMI Large Envelope
    Then click Order Details form Edit Form button
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required

    Then add Customs form Associated Item 1, Description random, Qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Sign out


  @rules_international_syria
  Scenario: Syria Internal Transaction Number Required
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Syria    | random  | random  |

    Then set Order Details form Ounces to 5
    Then set Order Details form service to PMI Flat Rate Envelope

  #Then set Order Details form service to FCMI Large Envelope
    Then click Order Details form Edit Form button
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required

    Then add Customs form Associated Item 1, Description random, Qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Sign out



  @rules_international_over_2500
  Scenario: Customs Form Internal Transaction Number Required for total over $2500
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PMI Flat Rate Envelope
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then set Order Details form service to FCMI Large Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Not required
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 2501, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Sign out



  @rules_international_trx_no_not_required
  Scenario: Internal Transaction # Not Required
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PMI Flat Rate Envelope
    Then set Order Details form Ounces to 5
    Then click Order Details form Edit Form button
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Not required
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Sign out


  @rules_international_name_stuff
  Scenario: Two character minimum for Name & Company
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to Antigua & Barbuda
    Then set Order Details form International Ship-To Name to "a"
    Then expect Order Details form International Name data error tooltip is "A first and last name of at least two characters each is required"


    Then set Order Details form Ship-From to default
    Then set Order Details form International Ship-To Name to "abc def"
    Then expect Order Details form International Name data error tooltip is ""
    #Then expect Order Details form International Company data error tooltip is ""
    #Then set Order Details form International Ship-To Name to ""
    #Then set Order Details form International Ship-To Company to "a"
    #Then expect Order Details form International Company data error tooltip is "Company name must be at least two characters long"
    #Then set Order Details form International Ship-To Name to "a"
    #Then set Order Details form International Ship-To Company to ""
    #Then expect Order Details form International Name data error tooltip is "A First Name and Last Name or Company are required"
    #Then expect Order Details form International Company data error tooltip is "A First Name and Last Name or Company are required"
