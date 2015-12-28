Feature: 150 orders

  Background:
    Given I am signed in to Orders as webpost_0001/pass111

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 1
    * Set Order Details Service to "First-Class Mail Large Envelope/Flat"
    * Set Order Details Insured Value to $15.00
    * Set Order Details Tracking to "None"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 2
    * Set Order Details Service to "First-Class Mail Package/Thick Envelope"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "USPS Tracking"

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 3
    * Set Order Details Service to "Priority Mail Large/Thick Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 4
    * Set Order Details Service to "Priority Mail Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 5
    * Set Order Details Service to "Priority Mail Large Package"
    * Set Order Details Insured Value to $145.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 6
    * Set Order Details Service to "Priority Mail Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 7
    * Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
    * Set Order Details Insured Value to $98.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 8
    * Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 9
    * Set Order Details Service to "Priority Mail Small Flat Rate Box"
    * Set Order Details Insured Value to $30.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 10
    * Set Order Details Service to "Priority Mail Medium Flat Rate Box"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 11
    * Set Order Details Service to "Priority Mail Large Flat Rate Box"
    * Set Order Details Insured Value to $239.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 12
    * Set Order Details Service to "Priority Mail Regional Rate Box A"
    * Set Order Details Insured Value to $105.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 13
    * Set Order Details Service to "Priority Mail Regional Rate Box B"
    * Set Order Details Insured Value to $205.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 14
    * Set Order Details Insured Value to $305.00
    * Set Order Details Tracking to "Signature Required"

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 15
    * Set Order Details Service to "Priority Mail Express Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 16
    * Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 17
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 18
    * Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 19
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 20
    * Set Order Details Service to "Media Mail Package"
    * Set Order Details Insured Value to $56.00
    * Set Order Details Tracking to "Signature Required"

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 21
    * Set Order Details Service to "Parcel Select Ground Package"
    * Set Order Details Insured Value to $345.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 22
    * Set Order Details Service to "Parcel Select Ground Large Package"
    * Set Order Details Insured Value to $456.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 23
    * Set Order Details Service to "Parcel Select Ground Oversized Package"
    * Set Order Details Insured Value to $567.00
    * Set Order Details Tracking to "Signature Required"

    # International

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 1
    * Set Order Details Service to "First-Class Mail Large Envelope/Flat"
    * Set Order Details Insured Value to $15.00
    * Set Order Details Tracking to "None"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 2
    * Set Order Details Service to "First-Class Mail Package/Thick Envelope"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "USPS Tracking"

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 3
    * Set Order Details Service to "Priority Mail Large/Thick Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 4
    * Set Order Details Service to "Priority Mail Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 5
    * Set Order Details Service to "Priority Mail Large Package"
    * Set Order Details Insured Value to $145.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 6
    * Set Order Details Service to "Priority Mail Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 7
    * Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
    * Set Order Details Insured Value to $98.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 8
    * Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 9
    * Set Order Details Service to "Priority Mail Small Flat Rate Box"
    * Set Order Details Insured Value to $30.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 10
    * Set Order Details Service to "Priority Mail Medium Flat Rate Box"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 11
    * Set Order Details Service to "Priority Mail Large Flat Rate Box"
    * Set Order Details Insured Value to $239.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 12
    * Set Order Details Service to "Priority Mail Regional Rate Box A"
    * Set Order Details Insured Value to $105.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 13
    * Set Order Details Service to "Priority Mail Regional Rate Box B"
    * Set Order Details Insured Value to $205.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 14
    * Set Order Details Insured Value to $305.00
    * Set Order Details Tracking to "Signature Required"

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 15
    * Set Order Details Service to "Priority Mail Express Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 16
    * Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 17
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 18
    * Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 19
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 20
    * Set Order Details Service to "Media Mail Package"
    * Set Order Details Insured Value to $56.00
    * Set Order Details Tracking to "Signature Required"

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 21
    * Set Order Details Service to "Parcel Select Ground Package"
    * Set Order Details Insured Value to $345.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 22
    * Set Order Details Service to "Parcel Select Ground Large Package"
    * Set Order Details Insured Value to $456.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 23
    * Set Order Details Service to "Parcel Select Ground Oversized Package"
    * Set Order Details Insured Value to $567.00
    * Set Order Details Tracking to "Signature Required"

    # International

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country | phone       |  email           |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Germany | 0123456789  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | France    | 9876543210  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 1
    * Set Order Details Service to "First-Class Mail Large Envelope/Flat"
    * Set Order Details Insured Value to $15.00
    * Set Order Details Tracking to "None"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 2
    * Set Order Details Service to "First-Class Mail Package/Thick Envelope"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "USPS Tracking"

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 3
    * Set Order Details Service to "Priority Mail Large/Thick Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 4
    * Set Order Details Service to "Priority Mail Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 5
    * Set Order Details Service to "Priority Mail Large Package"
    * Set Order Details Insured Value to $145.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 6
    * Set Order Details Service to "Priority Mail Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 7
    * Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
    * Set Order Details Insured Value to $98.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 8
    * Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 9
    * Set Order Details Service to "Priority Mail Small Flat Rate Box"
    * Set Order Details Insured Value to $30.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 10
    * Set Order Details Service to "Priority Mail Medium Flat Rate Box"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 11
    * Set Order Details Service to "Priority Mail Large Flat Rate Box"
    * Set Order Details Insured Value to $239.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 12
    * Set Order Details Service to "Priority Mail Regional Rate Box A"
    * Set Order Details Insured Value to $105.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 13
    * Set Order Details Service to "Priority Mail Regional Rate Box B"
    * Set Order Details Insured Value to $205.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4
    * Set Order Details Ounces to 14
    * Set Order Details Insured Value to $305.00
    * Set Order Details Tracking to "Signature Required"

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 15
    * Set Order Details Service to "Priority Mail Express Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 16
    * Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 17
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 18
    * Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 19
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 20
    * Set Order Details Service to "Media Mail Package"
    * Set Order Details Insured Value to $56.00
    * Set Order Details Tracking to "Signature Required"

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 21
    * Set Order Details Service to "Parcel Select Ground Package"
    * Set Order Details Insured Value to $345.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 22
    * Set Order Details Service to "Parcel Select Ground Large Package"
    * Set Order Details Insured Value to $456.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 23
    * Set Order Details Service to "Parcel Select Ground Oversized Package"
    * Set Order Details Insured Value to $567.00
    * Set Order Details Tracking to "Signature Required"

    # International

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Brazil | 0123456789  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Mexico    | 9876543210  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 1
    * Set Order Details Service to "First-Class Mail Large Envelope/Flat"
    * Set Order Details Insured Value to $15.00
    * Set Order Details Tracking to "None"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 2
    * Set Order Details Service to "First-Class Mail Package/Thick Envelope"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "USPS Tracking"

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 3
    * Set Order Details Service to "Priority Mail Large/Thick Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 4
    * Set Order Details Service to "Priority Mail Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 5
    * Set Order Details Service to "Priority Mail Large Package"
    * Set Order Details Insured Value to $145.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 6
    * Set Order Details Service to "Priority Mail Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 7
    * Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
    * Set Order Details Insured Value to $98.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 8
    * Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 9
    * Set Order Details Service to "Priority Mail Small Flat Rate Box"
    * Set Order Details Insured Value to $30.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 10
    * Set Order Details Service to "Priority Mail Medium Flat Rate Box"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 11
    * Set Order Details Service to "Priority Mail Large Flat Rate Box"
    * Set Order Details Insured Value to $239.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 12
    * Set Order Details Service to "Priority Mail Regional Rate Box A"
    * Set Order Details Insured Value to $105.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 13
    * Set Order Details Service to "Priority Mail Regional Rate Box B"
    * Set Order Details Insured Value to $205.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 14
    * Set Order Details Insured Value to $305.00
    * Set Order Details Tracking to "Signature Required"

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 15
    * Set Order Details Service to "Priority Mail Express Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 16
    * Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 17
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 18
    * Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 19
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 20
    * Set Order Details Service to "Media Mail Package"
    * Set Order Details Insured Value to $56.00
    * Set Order Details Tracking to "Signature Required"

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 21
    * Set Order Details Service to "Parcel Select Ground Package"
    * Set Order Details Insured Value to $345.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 22
    * Set Order Details Service to "Parcel Select Ground Large Package"
    * Set Order Details Insured Value to $456.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 23
    * Set Order Details Service to "Parcel Select Ground Oversized Package"
    * Set Order Details Insured Value to $567.00
    * Set Order Details Tracking to "Signature Required"

    # International

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country     | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Philippines | 0123456789  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | India     | 9876543210  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 1
    * Set Order Details Service to "First-Class Mail Large Envelope/Flat"
    * Set Order Details Insured Value to $15.00
    * Set Order Details Tracking to "None"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 2
    * Set Order Details Service to "First-Class Mail Package/Thick Envelope"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "USPS Tracking"

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 3
    * Set Order Details Service to "Priority Mail Large/Thick Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 4
    * Set Order Details Service to "Priority Mail Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 5
    * Set Order Details Service to "Priority Mail Large Package"
    * Set Order Details Insured Value to $145.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 6
    * Set Order Details Service to "Priority Mail Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 7
    * Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
    * Set Order Details Insured Value to $98.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 8
    * Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 9
    * Set Order Details Service to "Priority Mail Small Flat Rate Box"
    * Set Order Details Insured Value to $30.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 10
    * Set Order Details Service to "Priority Mail Medium Flat Rate Box"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 11
    * Set Order Details Service to "Priority Mail Large Flat Rate Box"
    * Set Order Details Insured Value to $239.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 12
    * Set Order Details Service to "Priority Mail Regional Rate Box A"
    * Set Order Details Insured Value to $105.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 13
    * Set Order Details Service to "Priority Mail Regional Rate Box B"
    * Set Order Details Insured Value to $205.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 14
    * Set Order Details Insured Value to $305.00
    * Set Order Details Tracking to "Signature Required"

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 15
    * Set Order Details Service to "Priority Mail Express Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 16
    * Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 17
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 18
    * Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 19
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 20
    * Set Order Details Service to "Media Mail Package"
    * Set Order Details Insured Value to $56.00
    * Set Order Details Tracking to "Signature Required"

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 21
    * Set Order Details Service to "Parcel Select Ground Package"
    * Set Order Details Insured Value to $345.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 22
    * Set Order Details Service to "Parcel Select Ground Large Package"
    * Set Order Details Insured Value to $456.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 23
    * Set Order Details Service to "Parcel Select Ground Oversized Package"
    * Set Order Details Insured Value to $567.00
    * Set Order Details Tracking to "Signature Required"

    # International

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Poland | 0123456789  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Singapore | 9876543210  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 1
    * Set Order Details Service to "First-Class Mail Large Envelope/Flat"
    * Set Order Details Insured Value to $15.00
    * Set Order Details Tracking to "None"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 2
    * Set Order Details Service to "First-Class Mail Package/Thick Envelope"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "USPS Tracking"

    #Priority Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 3
    * Set Order Details Service to "Priority Mail Large/Thick Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 4
    * Set Order Details Service to "Priority Mail Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 5
    * Set Order Details Service to "Priority Mail Large Package"
    * Set Order Details Insured Value to $145.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 6
    * Set Order Details Service to "Priority Mail Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 7
    * Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
    * Set Order Details Insured Value to $98.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 8
    * Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 9
    * Set Order Details Service to "Priority Mail Small Flat Rate Box"
    * Set Order Details Insured Value to $30.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 10
    * Set Order Details Service to "Priority Mail Medium Flat Rate Box"
    * Set Order Details Insured Value to $45.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 11
    * Set Order Details Service to "Priority Mail Large Flat Rate Box"
    * Set Order Details Insured Value to $239.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 12
    * Set Order Details Service to "Priority Mail Regional Rate Box A"
    * Set Order Details Insured Value to $105.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 13
    * Set Order Details Service to "Priority Mail Regional Rate Box B"
    * Set Order Details Insured Value to $205.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 14
    * Set Order Details Insured Value to $305.00
    * Set Order Details Tracking to "Signature Required"

    # Priority Mail Express

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Ounces to 15
    * Set Order Details Service to "Priority Mail Express Package"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 16
    * Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 17
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 18
    * Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 19
    * Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Set Order Details Tracking to "Signature Required"

    # Media Mail

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 20
    * Set Order Details Service to "Media Mail Package"
    * Set Order Details Insured Value to $56.00
    * Set Order Details Tracking to "Signature Required"

    # Parcel Select

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 21
    * Set Order Details Service to "Parcel Select Ground Package"
    * Set Order Details Insured Value to $345.00
    * Set Order Details Tracking to "USPS Tracking"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 22
    * Set Order Details Service to "Parcel Select Ground Large Package"
    * Set Order Details Insured Value to $456.00
    * Set Order Details Tracking to "Signature Required"

    * I Add a new order
    * Expect new Order ID created
    * Set Order Details Ship-From to default
    * Set Order Details Ship-To address to random zone 1 through 4

    * Set Order Details Pounds to 23
    * Set Order Details Service to "Parcel Select Ground Oversized Package"
    * Set Order Details Insured Value to $567.00
    * Set Order Details Tracking to "Signature Required"

    # International

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country   | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Hong Kong | 0123456789  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Ship-To to international address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country  | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Thailand | 9876543210  | junk@stamps.com  |

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form More Info to "random"
    Then Set customs form ITN# to "random"

    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"

    And Sign out
