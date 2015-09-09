Feature: 150 orders

  Background:
    Given I am signed in as a batch shipper webpost_0001/pass111

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to First-Class Mail Large Envelope/Flat
    * Set Insured Value to $15.00
    * Set Tracking to None

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 2
    * Set Service to First-Class Mail Package/Thick Envelope
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 3
    * Set Service to Priority Mail Large/Thick Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 4
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 5
    * Set Service to Priority Mail Large Package
    * Set Insured Value to $145.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 6
    * Set Service to Priority Mail Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 7
    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Set Insured Value to $98.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 8
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 9
    * Set Service to Priority Mail Small Flat Rate Box
    * Set Insured Value to $30.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 10
    * Set Service to Priority Mail Medium Flat Rate Box
    * Set Insured Value to $45.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 11
    * Set Service to Priority Mail Large Flat Rate Box
    * Set Insured Value to $239.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 12
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 13
    * Set Service to Priority Mail Regional Rate Box B
    * Set Insured Value to $205.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 14
    * Set Service to Priority Mail Regional Rate Box C
    * Set Insured Value to $305.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 15
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 16
    * Set Service to Priority Mail Express Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 17
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 18
    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 19
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Set Tracking to Signature Required

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 20
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 21
    * Set Service to Parcel Select Package
    * Set Insured Value to $345.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 22
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $456.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 23
    * Set Service to Parcel Select Oversized Package
    * Set Insured Value to $567.00
    * Set Tracking to Signature Required

    # International

    And I Add a new order
    Then Set Ship From to default

    Then Set Ship-To Recipient to
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

    Then Set Ship-To Recipient to
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

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to First-Class Mail Large Envelope/Flat
    * Set Insured Value to $15.00
    * Set Tracking to None

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 2
    * Set Service to First-Class Mail Package/Thick Envelope
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 3
    * Set Service to Priority Mail Large/Thick Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 4
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 5
    * Set Service to Priority Mail Large Package
    * Set Insured Value to $145.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 6
    * Set Service to Priority Mail Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 7
    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Set Insured Value to $98.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 8
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 9
    * Set Service to Priority Mail Small Flat Rate Box
    * Set Insured Value to $30.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 10
    * Set Service to Priority Mail Medium Flat Rate Box
    * Set Insured Value to $45.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 11
    * Set Service to Priority Mail Large Flat Rate Box
    * Set Insured Value to $239.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 12
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 13
    * Set Service to Priority Mail Regional Rate Box B
    * Set Insured Value to $205.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 14
    * Set Service to Priority Mail Regional Rate Box C
    * Set Insured Value to $305.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 15
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 16
    * Set Service to Priority Mail Express Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 17
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 18
    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 19
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Set Tracking to Signature Required

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 20
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 21
    * Set Service to Parcel Select Package
    * Set Insured Value to $345.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 22
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $456.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 23
    * Set Service to Parcel Select Oversized Package
    * Set Insured Value to $567.00
    * Set Tracking to Signature Required

    # International

    And I Add a new order
    Then Set Ship From to default

    Then Set Ship-To Recipient to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country | phone       |  email           |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Germany | 0123456789  | junk@stamps.com  |

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

    Then Set Ship-To Recipient to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | France    | 9876543210  | junk@stamps.com  |

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

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to First-Class Mail Large Envelope/Flat
    * Set Insured Value to $15.00
    * Set Tracking to None

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 2
    * Set Service to First-Class Mail Package/Thick Envelope
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 3
    * Set Service to Priority Mail Large/Thick Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 4
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 5
    * Set Service to Priority Mail Large Package
    * Set Insured Value to $145.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 6
    * Set Service to Priority Mail Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 7
    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Set Insured Value to $98.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 8
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 9
    * Set Service to Priority Mail Small Flat Rate Box
    * Set Insured Value to $30.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 10
    * Set Service to Priority Mail Medium Flat Rate Box
    * Set Insured Value to $45.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 11
    * Set Service to Priority Mail Large Flat Rate Box
    * Set Insured Value to $239.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 12
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 13
    * Set Service to Priority Mail Regional Rate Box B
    * Set Insured Value to $205.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 14
    * Set Service to Priority Mail Regional Rate Box C
    * Set Insured Value to $305.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 15
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 16
    * Set Service to Priority Mail Express Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 17
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 18
    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 19
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Set Tracking to Signature Required

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 20
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 21
    * Set Service to Parcel Select Package
    * Set Insured Value to $345.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 22
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $456.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 23
    * Set Service to Parcel Select Oversized Package
    * Set Insured Value to $567.00
    * Set Tracking to Signature Required

    # International

    And I Add a new order
    Then Set Ship From to default

    Then Set Ship-To Recipient to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Brazil | 0123456789  | junk@stamps.com  |

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

    Then Set Ship-To Recipient to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Mexico    | 9876543210  | junk@stamps.com  |

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

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to First-Class Mail Large Envelope/Flat
    * Set Insured Value to $15.00
    * Set Tracking to None

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 2
    * Set Service to First-Class Mail Package/Thick Envelope
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 3
    * Set Service to Priority Mail Large/Thick Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 4
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 5
    * Set Service to Priority Mail Large Package
    * Set Insured Value to $145.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 6
    * Set Service to Priority Mail Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 7
    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Set Insured Value to $98.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 8
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 9
    * Set Service to Priority Mail Small Flat Rate Box
    * Set Insured Value to $30.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 10
    * Set Service to Priority Mail Medium Flat Rate Box
    * Set Insured Value to $45.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 11
    * Set Service to Priority Mail Large Flat Rate Box
    * Set Insured Value to $239.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 12
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 13
    * Set Service to Priority Mail Regional Rate Box B
    * Set Insured Value to $205.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 14
    * Set Service to Priority Mail Regional Rate Box C
    * Set Insured Value to $305.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 15
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 16
    * Set Service to Priority Mail Express Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 17
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 18
    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 19
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Set Tracking to Signature Required

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 20
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 21
    * Set Service to Parcel Select Package
    * Set Insured Value to $345.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 22
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $456.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 23
    * Set Service to Parcel Select Oversized Package
    * Set Insured Value to $567.00
    * Set Tracking to Signature Required

    # International

    And I Add a new order
    Then Set Ship From to default

    Then Set Ship-To Recipient to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country     | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Philippines | 0123456789  | junk@stamps.com  |

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

    Then Set Ship-To Recipient to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | India     | 9876543210  | junk@stamps.com  |

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

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to First-Class Mail Large Envelope/Flat
    * Set Insured Value to $15.00
    * Set Tracking to None

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 2
    * Set Service to First-Class Mail Package/Thick Envelope
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 3
    * Set Service to Priority Mail Large/Thick Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 4
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 5
    * Set Service to Priority Mail Large Package
    * Set Insured Value to $145.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 6
    * Set Service to Priority Mail Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 7
    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Set Insured Value to $98.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 8
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 9
    * Set Service to Priority Mail Small Flat Rate Box
    * Set Insured Value to $30.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 10
    * Set Service to Priority Mail Medium Flat Rate Box
    * Set Insured Value to $45.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 11
    * Set Service to Priority Mail Large Flat Rate Box
    * Set Insured Value to $239.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 12
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 13
    * Set Service to Priority Mail Regional Rate Box B
    * Set Insured Value to $205.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 14
    * Set Service to Priority Mail Regional Rate Box C
    * Set Insured Value to $305.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 15
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 16
    * Set Service to Priority Mail Express Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 17
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 18
    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 19
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Set Tracking to Signature Required

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 20
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 21
    * Set Service to Parcel Select Package
    * Set Insured Value to $345.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 22
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $456.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 23
    * Set Service to Parcel Select Oversized Package
    * Set Insured Value to $567.00
    * Set Tracking to Signature Required

    # International

    And I Add a new order
    Then Set Ship From to default

    Then Set Ship-To Recipient to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Poland | 0123456789  | junk@stamps.com  |

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

    Then Set Ship-To Recipient to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Singapore | 9876543210  | junk@stamps.com  |

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

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to First-Class Mail Large Envelope/Flat
    * Set Insured Value to $15.00
    * Set Tracking to None

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 2
    * Set Service to First-Class Mail Package/Thick Envelope
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 3
    * Set Service to Priority Mail Large/Thick Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 4
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 5
    * Set Service to Priority Mail Large Package
    * Set Insured Value to $145.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 6
    * Set Service to Priority Mail Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 7
    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Set Insured Value to $98.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 8
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 9
    * Set Service to Priority Mail Small Flat Rate Box
    * Set Insured Value to $30.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 10
    * Set Service to Priority Mail Medium Flat Rate Box
    * Set Insured Value to $45.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 11
    * Set Service to Priority Mail Large Flat Rate Box
    * Set Insured Value to $239.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 12
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 13
    * Set Service to Priority Mail Regional Rate Box B
    * Set Insured Value to $205.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 14
    * Set Service to Priority Mail Regional Rate Box C
    * Set Insured Value to $305.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 15
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 16
    * Set Service to Priority Mail Express Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 17
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 18
    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 19
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Set Tracking to Signature Required

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 20
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 21
    * Set Service to Parcel Select Package
    * Set Insured Value to $345.00
    * Set Tracking to USPS Tracking

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 22
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $456.00
    * Set Tracking to Signature Required

    * I Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 23
    * Set Service to Parcel Select Oversized Package
    * Set Insured Value to $567.00
    * Set Tracking to Signature Required

    # International

    And I Add a new order
    Then Set Ship From to default

    Then Set Ship-To Recipient to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country   | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Hong Kong | 0123456789  | junk@stamps.com  |

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

    Then Set Ship-To Recipient to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country  | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Thailand | 9876543210  | junk@stamps.com  |

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

    And Sign out
