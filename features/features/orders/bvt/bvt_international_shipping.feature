Feature:  BVT International Shipping

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_international_shipping
  Scenario: International Shipping
    Then add new order
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set Order Details form Ounces to 4
    Then set Order Details form service to FCMI Large Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 4, Made In Japan, Tariff 1
    Then set Customs form Package Contents to Commercial Sample
    Then set Customs form Package Contents to Gift
    Then set Customs form Package Contents to Document
    Then set Customs form Package Contents to Humanitarian Donation
    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Not required
    Then set Customs form More Info to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then in Print modal, click Close button
    Then Sign out

