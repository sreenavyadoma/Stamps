
Feature:  B-01813 - Allow Int'l and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in as a batch shipper

    @international_address_printing
    Scenario: Single Order Form International Shipping fields and Customs Information fields validation
      And I Add a new order
      Then Set Ship From to default

      Then Set Ship-To country to Canada
      Then Expect Single Order Form International Address fields are visible
      Then Expect Single Order Form Domestic Ship-To fields are hidden
      Then Expect Single Order Form Customs Restrictions button is visible

      Then Set Ship-To Recipient to
        | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
        | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

      Then Add Item with Quantity 1, ID random, Description random

      And Open Customs Form

      Then Set Customs Form Package Contents = Commercial Sample
      Then Set Customs Form Package Contents = Document
      Then Set Customs Form Package Contents = Gift
      Then Set Customs Form Package Contents = Humanitarian Donation
      Then Set Customs Form Package Contents = Merchandise
      Then Set Customs Form Package Contents = Returned Goods
      Then Close Customs Information Modal

      Then Set Ship-To Recipient to asdf

  @international_address_printing
  Scenario: User Prints International Address 1
      And I Add a new order
      Then Set Ship From to default

      Then Set Ship-To Recipient to
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

      Then Set Customs Form I agree to true
      Then Close Customs Information Modal
      Then Set Service to First-Class Mail International Large Envelope

