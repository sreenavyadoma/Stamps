Feature: 150 orders

  Background:
    Given I am signed in to Orders

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 1
    * Details: Select Service First-Class Mail Large Envelope/Flat
    * Details: Set Insure-For to $15.00
    * Details: Set Tracking to "None"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 2
    * Details: Select Service First-Class Mail Package/Thick Envelope
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 3
    * Details: Select Service Priority Mail Large/Thick Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 4
    * Details: Select Service Priority Mail Package
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 5
    * Details: Select Service Priority Mail Large Package
    * Details: Set Insure-For to $145.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 6
    * Details: Select Service Priority Mail Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 7
    * Details: Select Service Priority Mail Padded Flat Rate Envelope
    * Details: Set Insure-For to $98.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 8
    * Details: Select Service Priority Mail Legal Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 9
    * Details: Select Service Priority Mail Small Flat Rate Box
    * Details: Set Insure-For to $30.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 10
    * Details: Select Service Priority Mail Medium Flat Rate Box
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 11
    * Details: Select Service Priority Mail Large Flat Rate Box
    * Details: Set Insure-For to $239.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 12
    * Details: Select Service Priority Mail Regional Rate Box A
    * Details: Set Insure-For to $105.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 13
    * Details: Select Service Priority Mail Regional Rate Box B
    * Details: Set Insure-For to $205.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 14
    * Details: Set Insure-For to $305.00
    * Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 15
    Then Details: Select Service Priority Mail Express Package/Flat/Thick Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 16
    * Details: Select Service Priority Mail Express Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 17
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 18
    * Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 19
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    # Media Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 20
    * Details: Select Service Media Mail Package/Flat/Thick Envelope
    * Details: Set Insure-For to $56.00
    * Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 21
    * Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $345.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 22
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $456.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 23
    * Details: Select Service Parcel Select Ground Oversized Package
    * Details: Set Insure-For to $567.00
    * Details: Set Tracking to "Signature Required"

    # International

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service First-Class Mail International Large Envelope/Flat

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service Priority Mail International Flat Rate Envelope

    # First Class Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 1
    * Details: Select Service First-Class Mail Large Envelope/Flat
    * Details: Set Insure-For to $15.00
    * Details: Set Tracking to "None"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 2
    * Details: Select Service First-Class Mail Package/Thick Envelope
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 3
    * Details: Select Service Priority Mail Large/Thick Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 4
    * Details: Select Service Priority Mail Package
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 5
    * Details: Select Service Priority Mail Large Package
    * Details: Set Insure-For to $145.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 6
    * Details: Select Service Priority Mail Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 7
    * Details: Select Service Priority Mail Padded Flat Rate Envelope
    * Details: Set Insure-For to $98.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 8
    * Details: Select Service Priority Mail Legal Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 9
    * Details: Select Service Priority Mail Small Flat Rate Box
    * Details: Set Insure-For to $30.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 10
    * Details: Select Service Priority Mail Medium Flat Rate Box
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 11
    * Details: Select Service Priority Mail Large Flat Rate Box
    * Details: Set Insure-For to $239.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 12
    * Details: Select Service Priority Mail Regional Rate Box A
    * Details: Set Insure-For to $105.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 13
    * Details: Select Service Priority Mail Regional Rate Box B
    * Details: Set Insure-For to $205.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 14
    * Details: Set Insure-For to $305.00
    * Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 15
    Then Details: Select Service Priority Mail Express Package/Flat/Thick Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 16
    * Details: Select Service Priority Mail Express Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 17
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 18
    * Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 19
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    # Media Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 20
    * Details: Select Service Media Mail Package/Flat/Thick Envelope
    * Details: Set Insure-For to $56.00
    * Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 21
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $345.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 22
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $456.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 23
    * Details: Select Service Parcel Select Ground Oversized Package
    * Details: Set Insure-For to $567.00
    * Details: Set Tracking to "Signature Required"

    # International

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country | phone       |  email           |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Germany | 0123456789  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service First-Class Mail International Large Envelope/Flat

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | France    | 9876543210  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service Priority Mail International Flat Rate Envelope

    # First Class Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 1
    * Details: Select Service First-Class Mail Large Envelope/Flat
    * Details: Set Insure-For to $15.00
    * Details: Set Tracking to "None"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 2
    * Details: Select Service First-Class Mail Package/Thick Envelope
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 3
    * Details: Select Service Priority Mail Large/Thick Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 4
    * Details: Select Service Priority Mail Package
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 5
    * Details: Select Service Priority Mail Large Package
    * Details: Set Insure-For to $145.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 6
    * Details: Select Service Priority Mail Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 7
    * Details: Select Service Priority Mail Padded Flat Rate Envelope
    * Details: Set Insure-For to $98.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 8
    * Details: Select Service Priority Mail Legal Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 9
    * Details: Select Service Priority Mail Small Flat Rate Box
    * Details: Set Insure-For to $30.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 10
    * Details: Select Service Priority Mail Medium Flat Rate Box
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 11
    * Details: Select Service Priority Mail Large Flat Rate Box
    * Details: Set Insure-For to $239.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 12
    * Details: Select Service Priority Mail Regional Rate Box A
    * Details: Set Insure-For to $105.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 13
    * Details: Select Service Priority Mail Regional Rate Box B
    * Details: Set Insure-For to $205.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4
    * Details: Set Ounces to 14
    * Details: Set Insure-For to $305.00
    * Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 15
    Then Details: Select Service Priority Mail Express Package/Flat/Thick Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 16
    * Details: Select Service Priority Mail Express Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 17
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 18
    * Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 19
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    # Media Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 20
    * Details: Select Service Media Mail Package/Flat/Thick Envelope
    * Details: Set Insure-For to $56.00
    * Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 21
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $345.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 22
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $456.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 23
    * Details: Select Service Parcel Select Ground Oversized Package
    * Details: Set Insure-For to $567.00
    * Details: Set Tracking to "Signature Required"

    # International

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Brazil | 0123456789  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service First-Class Mail International Large Envelope/Flat

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Mexico    | 9876543210  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service Priority Mail International Flat Rate Envelope

    # First Class Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 1
    * Details: Select Service First-Class Mail Large Envelope/Flat
    * Details: Set Insure-For to $15.00
    * Details: Set Tracking to "None"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 2
    * Details: Select Service First-Class Mail Package/Thick Envelope
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 3
    * Details: Select Service Priority Mail Large/Thick Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 4
    * Details: Select Service Priority Mail Package
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 5
    * Details: Select Service Priority Mail Large Package
    * Details: Set Insure-For to $145.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 6
    * Details: Select Service Priority Mail Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 7
    * Details: Select Service Priority Mail Padded Flat Rate Envelope
    * Details: Set Insure-For to $98.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 8
    * Details: Select Service Priority Mail Legal Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 9
    * Details: Select Service Priority Mail Small Flat Rate Box
    * Details: Set Insure-For to $30.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 10
    * Details: Select Service Priority Mail Medium Flat Rate Box
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 11
    * Details: Select Service Priority Mail Large Flat Rate Box
    * Details: Set Insure-For to $239.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 12
    * Details: Select Service Priority Mail Regional Rate Box A
    * Details: Set Insure-For to $105.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 13
    * Details: Select Service Priority Mail Regional Rate Box B
    * Details: Set Insure-For to $205.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 14
    * Details: Set Insure-For to $305.00
    * Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 15
    Then Details: Select Service Priority Mail Express Package/Flat/Thick Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 16
    * Details: Select Service Priority Mail Express Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 17
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 18
    * Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 19
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    # Media Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 20
    * Details: Select Service Media Mail Package/Flat/Thick Envelope
    * Details: Set Insure-For to $56.00
    * Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 21
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $345.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 22
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $456.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 23
    * Details: Select Service Parcel Select Ground Oversized Package
    * Details: Set Insure-For to $567.00
    * Details: Set Tracking to "Signature Required"

    # International

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country     | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Philippines | 0123456789  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service First-Class Mail International Large Envelope/Flat

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | India     | 9876543210  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service Priority Mail International Flat Rate Envelope

    # First Class Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 1
    * Details: Select Service First-Class Mail Large Envelope/Flat
    * Details: Set Insure-For to $15.00
    * Details: Set Tracking to "None"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 2
    * Details: Select Service First-Class Mail Package/Thick Envelope
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 3
    * Details: Select Service Priority Mail Large/Thick Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 4
    * Details: Select Service Priority Mail Package
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 5
    * Details: Select Service Priority Mail Large Package
    * Details: Set Insure-For to $145.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 6
    * Details: Select Service Priority Mail Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 7
    * Details: Select Service Priority Mail Padded Flat Rate Envelope
    * Details: Set Insure-For to $98.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 8
    * Details: Select Service Priority Mail Legal Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 9
    * Details: Select Service Priority Mail Small Flat Rate Box
    * Details: Set Insure-For to $30.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 10
    * Details: Select Service Priority Mail Medium Flat Rate Box
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 11
    * Details: Select Service Priority Mail Large Flat Rate Box
    * Details: Set Insure-For to $239.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 12
    * Details: Select Service Priority Mail Regional Rate Box A
    * Details: Set Insure-For to $105.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 13
    * Details: Select Service Priority Mail Regional Rate Box B
    * Details: Set Insure-For to $205.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 14
    * Details: Set Insure-For to $305.00
    * Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 15
    Then Details: Select Service Priority Mail Express Package/Flat/Thick Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 16
    * Details: Select Service Priority Mail Express Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 17
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 18
    * Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 19
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    # Media Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 20
    * Details: Select Service Media Mail Package/Flat/Thick Envelope
    * Details: Set Insure-For to $56.00
    * Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 21
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $345.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 22
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $456.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 23
    * Details: Select Service Parcel Select Ground Oversized Package
    * Details: Set Insure-For to $567.00
    * Details: Set Tracking to "Signature Required"

    # International

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Poland | 0123456789  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service First-Class Mail International Large Envelope/Flat

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Singapore | 9876543210  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service Priority Mail International Flat Rate Envelope

    # First Class Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 1
    * Details: Select Service First-Class Mail Large Envelope/Flat
    * Details: Set Insure-For to $15.00
    * Details: Set Tracking to "None"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 2
    * Details: Select Service First-Class Mail Package/Thick Envelope
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 3
    * Details: Select Service Priority Mail Large/Thick Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 4
    * Details: Select Service Priority Mail Package
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 5
    * Details: Select Service Priority Mail Large Package
    * Details: Set Insure-For to $145.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 6
    * Details: Select Service Priority Mail Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 7
    * Details: Select Service Priority Mail Padded Flat Rate Envelope
    * Details: Set Insure-For to $98.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 8
    * Details: Select Service Priority Mail Legal Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 9
    * Details: Select Service Priority Mail Small Flat Rate Box
    * Details: Set Insure-For to $30.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 10
    * Details: Select Service Priority Mail Medium Flat Rate Box
    * Details: Set Insure-For to $45.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 11
    * Details: Select Service Priority Mail Large Flat Rate Box
    * Details: Set Insure-For to $239.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 12
    * Details: Select Service Priority Mail Regional Rate Box A
    * Details: Set Insure-For to $105.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 13
    * Details: Select Service Priority Mail Regional Rate Box B
    * Details: Set Insure-For to $205.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 14
    * Details: Set Insure-For to $305.00
    * Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Ounces to 15
    Then Details: Select Service Priority Mail Express Package/Flat/Thick Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 16
    * Details: Select Service Priority Mail Express Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 17
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 18
    * Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 19
    * Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    * Details: Set Tracking to "Signature Required"

    # Media Mail

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 20
    * Details: Select Service Media Mail Package/Flat/Thick Envelope
    * Details: Set Insure-For to $56.00
    * Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 21
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $345.00
    * Details: Set Tracking to "USPS Tracking"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 22
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    * Details: Set Insure-For to $456.00
    * Details: Set Tracking to "Signature Required"

    * Toolbar: Add
    * Expect new Order ID created
    * Details: Set Ship-From to default
    * Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Details: Set Pounds to 23
    * Details: Select Service Parcel Select Ground Oversized Package
    * Details: Set Insure-For to $567.00
    * Details: Set Tracking to "Signature Required"

    # International

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country   | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Hong Kong | 0123456789  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service First-Class Mail International Large Envelope/Flat

    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country  | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Thailand | 9876543210  | junk@stamps.com  |

    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set More Info to "random"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service Priority Mail International Flat Rate Envelope

    Then Sign out

    #todo-rob affected