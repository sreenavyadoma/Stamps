Feature: 25 orders

  Background:
    Given I am signed in as a batch shipper webpost_0001/pass111

  @orders_25
  Scenario:  Inline Rates

    # First Class Mail

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 1
    And Set Service to First-Class Mail Large Envelope/Flat
    And Set Insured Value to $15.00
    And Set Tracking to None

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 2
    And Set Service to First-Class Mail Package/Thick Envelope
    And Set Insured Value to $45.00
    And Set Tracking to USPS Tracking

    #Priority Mail

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 3
    And Set Service to Priority Mail Large/Thick Envelope
    And Set Tracking to USPS Tracking

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 4
    And Set Service to Priority Mail Package
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 5
    And Set Service to Priority Mail Large Package
    And Set Insured Value to $145.00
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 6
    And Set Service to Priority Mail Flat Rate Envelope
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 7
    And Set Service to Priority Mail Padded Flat Rate Envelope
    And Set Insured Value to $98.00
    And Set Tracking to USPS Tracking

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 8
    And Set Service to Priority Mail Legal Flat Rate Envelope
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 9
    And Set Service to Priority Mail Small Flat Rate Box
    And Set Insured Value to $30.00
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 10
    And Set Service to Priority Mail Medium Flat Rate Box
    And Set Insured Value to $45.00
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 11
    And Set Service to Priority Mail Large Flat Rate Box
    And Set Insured Value to $239.00
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 12
    And Set Service to Priority Mail Regional Rate Box A
    And Set Insured Value to $105.00
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 13
    And Set Service to Priority Mail Regional Rate Box B
    And Set Insured Value to $205.00
    And Set Tracking to USPS Tracking

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 14
    And Set Service to Priority Mail Regional Rate Box C
    And Set Insured Value to $305.00
    And Set Tracking to Signature Required

    # Priority Mail Express

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Ounces to 15
    And Set Service to Priority Mail Express Package
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 16
    And Set Service to Priority Mail Express Flat Rate Envelope
    And Set Tracking to USPS Tracking

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 17
    And Set Service to Priority Mail Express Padded Flat Rate Envelope
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 18
    And Set Service to Priority Mail Express Legal Flat Rate Envelope
    And Set Tracking to USPS Tracking

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 19
    And Set Service to Priority Mail Express Medium Flat Rate Box
    And Set Tracking to Signature Required

    # Media Mail

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 20
    And Set Service to Media Mail Package
    And Set Insured Value to $56.00
    And Set Tracking to Signature Required

    # Parcel Select

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 21
    And Set Service to Parcel Select Package
    And Set Insured Value to $345.00
    And Set Tracking to USPS Tracking

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 22
    And Set Service to Parcel Select Large Package
    And Set Insured Value to $456.00
    And Set Tracking to Signature Required

    Then I Add a new order
    And Expect new Order ID created
    And Set Ship From to default
    And Set Ship-To address to random
    
    And Set Pounds to 23
    And Set Service to Parcel Select Oversized Package
    And Set Insured Value to $567.00
    And Set Tracking to Signature Required

    # International

    And I Add a new order
    Then Set Ship From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |

    Then Add Item with Quantity 1, ID random, Description random

    And Open Customs Form

    Then Set Customs Form Package Contents = Merchandise
    Then Set Customs Form Non-Delivery Options = Return to sender
    Then Set Customs Form Internal Transaction # = Required
    Then Set Customs Form More Info = random
    Then Set Customs Form ITN# = random

    Then Set Customs Form I agree to true
    Then Close Customs Information Modal
    Then Set Service to First-Class Mail International Large Envelope

    And I Add a new order
    Then Set Ship From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |

    Then Add Item with Quantity 1, ID random, Description random

    And Open Customs Form

    Then Set Customs Form Package Contents = Merchandise
    Then Set Customs Form Non-Delivery Options = Return to sender
    Then Set Customs Form Internal Transaction # = Required
    Then Set Customs Form More Info = random
    Then Set Customs Form ITN# = random

    Then Set Customs Form I agree to true
    Then Close Customs Information Modal
    Then Set Service to Priority Mail International Flat Rate Envelope

