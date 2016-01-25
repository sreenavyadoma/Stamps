Feature: 150 orders

  Background:
    Given I am signed in to Orders as webpost_0010/pass111

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    * Order Details: Set Insure For to $15.00
    * Order Details: Set Tracking to "None"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Set Service to "Priority Mail Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Set Service to "Priority Mail Large Package"
    * Order Details: Set Insure For to $145.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    * Order Details: Set Insure For to $98.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    * Order Details: Set Insure For to $30.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    * Order Details: Set Insure For to $239.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Set Service to "Priority Mail Regional Rate Box A"
    * Order Details: Set Insure For to $105.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Set Service to "Priority Mail Regional Rate Box B"
    * Order Details: Set Insure For to $205.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 14
    * Order Details: Set Insure For to $305.00
    * Order Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 15
    * Order Details: Set Service to "Priority Mail Express Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    # Media Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Set Service to "Media Mail Package"
    * Order Details: Set Insure For to $56.00
    * Order Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 21
    * Order Details: Set Service to "Parcel Select Ground Package"
    * Order Details: Set Insure For to $345.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 22
    * Order Details: Set Service to "Parcel Select Ground Large Package"
    * Order Details: Set Insure For to $456.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Set Service to "Parcel Select Ground Oversized Package"
    * Order Details: Set Insure For to $567.00
    * Order Details: Set Tracking to "Signature Required"

    # International

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "First-Class Mail International Large Envelope/Flat"

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    * Order Details: Set Insure For to $15.00
    * Order Details: Set Tracking to "None"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Set Service to "Priority Mail Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Set Service to "Priority Mail Large Package"
    * Order Details: Set Insure For to $145.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    * Order Details: Set Insure For to $98.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    * Order Details: Set Insure For to $30.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    * Order Details: Set Insure For to $239.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Set Service to "Priority Mail Regional Rate Box A"
    * Order Details: Set Insure For to $105.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Set Service to "Priority Mail Regional Rate Box B"
    * Order Details: Set Insure For to $205.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 14
    * Order Details: Set Insure For to $305.00
    * Order Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 15
    * Order Details: Set Service to "Priority Mail Express Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    # Media Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Set Service to "Media Mail Package"
    * Order Details: Set Insure For to $56.00
    * Order Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 21
    * Order Details: Set Service to "Parcel Select Ground Package"
    * Order Details: Set Insure For to $345.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 22
    * Order Details: Set Service to "Parcel Select Ground Large Package"
    * Order Details: Set Insure For to $456.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Set Service to "Parcel Select Ground Oversized Package"
    * Order Details: Set Insure For to $567.00
    * Order Details: Set Tracking to "Signature Required"

    # International

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country | phone       |  email           |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Germany | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "First-Class Mail International Large Envelope/Flat"

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | France    | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    * Order Details: Set Insure For to $15.00
    * Order Details: Set Tracking to "None"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Set Service to "Priority Mail Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Set Service to "Priority Mail Large Package"
    * Order Details: Set Insure For to $145.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    * Order Details: Set Insure For to $98.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    * Order Details: Set Insure For to $30.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    * Order Details: Set Insure For to $239.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Set Service to "Priority Mail Regional Rate Box A"
    * Order Details: Set Insure For to $105.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Set Service to "Priority Mail Regional Rate Box B"
    * Order Details: Set Insure For to $205.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    * Order Details: Set Ounces to 14
    * Order Details: Set Insure For to $305.00
    * Order Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 15
    * Order Details: Set Service to "Priority Mail Express Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    # Media Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Set Service to "Media Mail Package"
    * Order Details: Set Insure For to $56.00
    * Order Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 21
    * Order Details: Set Service to "Parcel Select Ground Package"
    * Order Details: Set Insure For to $345.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 22
    * Order Details: Set Service to "Parcel Select Ground Large Package"
    * Order Details: Set Insure For to $456.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Set Service to "Parcel Select Ground Oversized Package"
    * Order Details: Set Insure For to $567.00
    * Order Details: Set Tracking to "Signature Required"

    # International

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Brazil | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "First-Class Mail International Large Envelope/Flat"

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Mexico    | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    * Order Details: Set Insure For to $15.00
    * Order Details: Set Tracking to "None"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Set Service to "Priority Mail Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Set Service to "Priority Mail Large Package"
    * Order Details: Set Insure For to $145.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    * Order Details: Set Insure For to $98.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    * Order Details: Set Insure For to $30.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    * Order Details: Set Insure For to $239.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Set Service to "Priority Mail Regional Rate Box A"
    * Order Details: Set Insure For to $105.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Set Service to "Priority Mail Regional Rate Box B"
    * Order Details: Set Insure For to $205.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 14
    * Order Details: Set Insure For to $305.00
    * Order Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 15
    * Order Details: Set Service to "Priority Mail Express Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    # Media Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Set Service to "Media Mail Package"
    * Order Details: Set Insure For to $56.00
    * Order Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 21
    * Order Details: Set Service to "Parcel Select Ground Package"
    * Order Details: Set Insure For to $345.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 22
    * Order Details: Set Service to "Parcel Select Ground Large Package"
    * Order Details: Set Insure For to $456.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Set Service to "Parcel Select Ground Oversized Package"
    * Order Details: Set Insure For to $567.00
    * Order Details: Set Tracking to "Signature Required"

    # International

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country     | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Philippines | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "First-Class Mail International Large Envelope/Flat"

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | India     | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    * Order Details: Set Insure For to $15.00
    * Order Details: Set Tracking to "None"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Set Service to "Priority Mail Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Set Service to "Priority Mail Large Package"
    * Order Details: Set Insure For to $145.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    * Order Details: Set Insure For to $98.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    * Order Details: Set Insure For to $30.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    * Order Details: Set Insure For to $239.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Set Service to "Priority Mail Regional Rate Box A"
    * Order Details: Set Insure For to $105.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Set Service to "Priority Mail Regional Rate Box B"
    * Order Details: Set Insure For to $205.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 14
    * Order Details: Set Insure For to $305.00
    * Order Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 15
    * Order Details: Set Service to "Priority Mail Express Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    # Media Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Set Service to "Media Mail Package"
    * Order Details: Set Insure For to $56.00
    * Order Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 21
    * Order Details: Set Service to "Parcel Select Ground Package"
    * Order Details: Set Insure For to $345.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 22
    * Order Details: Set Service to "Parcel Select Ground Large Package"
    * Order Details: Set Insure For to $456.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Set Service to "Parcel Select Ground Oversized Package"
    * Order Details: Set Insure For to $567.00
    * Order Details: Set Tracking to "Signature Required"

    # International

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Poland | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "First-Class Mail International Large Envelope/Flat"

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Singapore | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Set Service to "First-Class Mail Large Envelope/Flat"
    * Order Details: Set Insure For to $15.00
    * Order Details: Set Tracking to "None"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Set Service to "First-Class Mail Package/Thick Envelope"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "USPS Tracking"

    #Priority Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Set Service to "Priority Mail Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Set Service to "Priority Mail Large Package"
    * Order Details: Set Insure For to $145.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    * Order Details: Set Insure For to $98.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Set Service to "Priority Mail Small Flat Rate Box"
    * Order Details: Set Insure For to $30.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Set Service to "Priority Mail Medium Flat Rate Box"
    * Order Details: Set Insure For to $45.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Set Service to "Priority Mail Large Flat Rate Box"
    * Order Details: Set Insure For to $239.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Set Service to "Priority Mail Regional Rate Box A"
    * Order Details: Set Insure For to $105.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Set Service to "Priority Mail Regional Rate Box B"
    * Order Details: Set Insure For to $205.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 14
    * Order Details: Set Insure For to $305.00
    * Order Details: Set Tracking to "Signature Required"

    # Priority Mail Express

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Ounces to 15
    * Order Details: Set Service to "Priority Mail Express Package"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    * Order Details: Set Tracking to "Signature Required"

    # Media Mail

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Set Service to "Media Mail Package"
    * Order Details: Set Insure For to $56.00
    * Order Details: Set Tracking to "Signature Required"

    # Parcel Select

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 21
    * Order Details: Set Service to "Parcel Select Ground Package"
    * Order Details: Set Insure For to $345.00
    * Order Details: Set Tracking to "USPS Tracking"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 22
    * Order Details: Set Service to "Parcel Select Ground Large Package"
    * Order Details: Set Insure For to $456.00
    * Order Details: Set Tracking to "Signature Required"

    * Add New Order
    * Expect new Order ID created
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Set Service to "Parcel Select Ground Oversized Package"
    * Order Details: Set Insure For to $567.00
    * Order Details: Set Tracking to "Signature Required"

    # International

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country   | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Hong Kong | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "First-Class Mail International Large Envelope/Flat"

    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country  | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Thailand | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    And Open Customs Form

    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Required"
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN# to "random"

    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Order Details: Set Service to "Priority Mail International Flat Rate Envelope"

    And Sign out

    #todo-rob affected