Feature: 150 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 1
    * On Order Details form, select service FCM Large Envelope
    * On Order Details form, set Insure-For to $15.00
    * On Order Details form, set Tracking to "None"

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 2
    * On Order Details form, select service First-Class Mail Package/Thick Envelope
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 3
    * On Order Details form, select service PM Large Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 4
    * On Order Details form, select service PM Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 5
    * On Order Details form, select service PM Large Package
    * On Order Details form, set Insure-For to $145.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 6
    * On Order Details form, select service PM Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 7
    * On Order Details form, select service PM Padded Flat Rate Envelope
    * On Order Details form, set Insure-For to $98.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 8
    * On Order Details form, select service PM Legal Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 9
    * On Order Details form, select service PM Small Flat Rate Box
    * On Order Details form, set Insure-For to $30.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 10
    * On Order Details form, select service PM Medium Flat Rate Box
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 11
    * On Order Details form, select service PM Large Flat Rate Box
    * On Order Details form, set Insure-For to $239.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 12
    * On Order Details form, select service PM Regional Rate Box A
    * On Order Details form, set Insure-For to $105.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 13
    * On Order Details form, select service PM Regional Rate Box B
    * On Order Details form, set Insure-For to $205.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 14
    * On Order Details form, set Insure-For to $305.00
    * On Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 15
    Then On Order Details form, select service PME Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 16
    * On Order Details form, select service PME Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 17
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 18
    * On Order Details form, select service PME Legal Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 19
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    # Media Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 20
    * On Order Details form, select service MM Package
    * On Order Details form, set Insure-For to $56.00
    * On Order Details form, set Tracking to Signature Required

    # Parcel Select

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 21
    * On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $345.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 22
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $456.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 23
    * On Order Details form, select service PSG Oversized Package
    * On Order Details form, set Insure-For to $567.00
    * On Order Details form, set Tracking to Signature Required

    # International

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service FCMI Large Envelope

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 1
    * On Order Details form, select service FCM Large Envelope
    * On Order Details form, set Insure-For to $15.00
    * On Order Details form, set Tracking to "None"

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 2
    * On Order Details form, select service First-Class Mail Package/Thick Envelope
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 3
    * On Order Details form, select service PM Large Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 4
    * On Order Details form, select service PM Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 5
    * On Order Details form, select service PM Large Package
    * On Order Details form, set Insure-For to $145.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 6
    * On Order Details form, select service PM Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 7
    * On Order Details form, select service PM Padded Flat Rate Envelope
    * On Order Details form, set Insure-For to $98.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 8
    * On Order Details form, select service PM Legal Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 9
    * On Order Details form, select service PM Small Flat Rate Box
    * On Order Details form, set Insure-For to $30.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 10
    * On Order Details form, select service PM Medium Flat Rate Box
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 11
    * On Order Details form, select service PM Large Flat Rate Box
    * On Order Details form, set Insure-For to $239.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 12
    * On Order Details form, select service PM Regional Rate Box A
    * On Order Details form, set Insure-For to $105.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 13
    * On Order Details form, select service PM Regional Rate Box B
    * On Order Details form, set Insure-For to $205.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 14
    * On Order Details form, set Insure-For to $305.00
    * On Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 15
    Then On Order Details form, select service PME Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 16
    * On Order Details form, select service PME Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 17
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 18
    * On Order Details form, select service PME Legal Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 19
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    # Media Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 20
    * On Order Details form, select service MM Package
    * On Order Details form, set Insure-For to $56.00
    * On Order Details form, set Tracking to Signature Required

    # Parcel Select

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 21
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $345.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 22
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $456.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 23
    * On Order Details form, select service PSG Oversized Package
    * On Order Details form, set Insure-For to $567.00
    * On Order Details form, set Tracking to Signature Required

    # International

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country | phone       |  email           |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Germany | 0123456789  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service FCMI Large Envelope

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | France    | 9876543210  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 1
    * On Order Details form, select service FCM Large Envelope
    * On Order Details form, set Insure-For to $15.00
    * On Order Details form, set Tracking to "None"

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 2
    * On Order Details form, select service First-Class Mail Package/Thick Envelope
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 3
    * On Order Details form, select service PM Large Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 4
    * On Order Details form, select service PM Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 5
    * On Order Details form, select service PM Large Package
    * On Order Details form, set Insure-For to $145.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 6
    * On Order Details form, select service PM Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 7
    * On Order Details form, select service PM Padded Flat Rate Envelope
    * On Order Details form, set Insure-For to $98.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 8
    * On Order Details form, select service PM Legal Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 9
    * On Order Details form, select service PM Small Flat Rate Box
    * On Order Details form, set Insure-For to $30.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 10
    * On Order Details form, select service PM Medium Flat Rate Box
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 11
    * On Order Details form, select service PM Large Flat Rate Box
    * On Order Details form, set Insure-For to $239.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 12
    * On Order Details form, select service PM Regional Rate Box A
    * On Order Details form, set Insure-For to $105.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 13
    * On Order Details form, select service PM Regional Rate Box B
    * On Order Details form, set Insure-For to $205.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4
    * On Order Details form, set Ounces to 14
    * On Order Details form, set Insure-For to $305.00
    * On Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 15
    Then On Order Details form, select service PME Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 16
    * On Order Details form, select service PME Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 17
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 18
    * On Order Details form, select service PME Legal Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 19
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    # Media Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 20
    * On Order Details form, select service MM Package
    * On Order Details form, set Insure-For to $56.00
    * On Order Details form, set Tracking to Signature Required

    # Parcel Select

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 21
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $345.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 22
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $456.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 23
    * On Order Details form, select service PSG Oversized Package
    * On Order Details form, set Insure-For to $567.00
    * On Order Details form, set Tracking to Signature Required

    # International

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Brazil | 0123456789  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service FCMI Large Envelope

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Mexico    | 9876543210  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 1
    * On Order Details form, select service FCM Large Envelope
    * On Order Details form, set Insure-For to $15.00
    * On Order Details form, set Tracking to "None"

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 2
    * On Order Details form, select service First-Class Mail Package/Thick Envelope
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 3
    * On Order Details form, select service PM Large Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 4
    * On Order Details form, select service PM Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 5
    * On Order Details form, select service PM Large Package
    * On Order Details form, set Insure-For to $145.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 6
    * On Order Details form, select service PM Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 7
    * On Order Details form, select service PM Padded Flat Rate Envelope
    * On Order Details form, set Insure-For to $98.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 8
    * On Order Details form, select service PM Legal Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 9
    * On Order Details form, select service PM Small Flat Rate Box
    * On Order Details form, set Insure-For to $30.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 10
    * On Order Details form, select service PM Medium Flat Rate Box
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 11
    * On Order Details form, select service PM Large Flat Rate Box
    * On Order Details form, set Insure-For to $239.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 12
    * On Order Details form, select service PM Regional Rate Box A
    * On Order Details form, set Insure-For to $105.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 13
    * On Order Details form, select service PM Regional Rate Box B
    * On Order Details form, set Insure-For to $205.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 14
    * On Order Details form, set Insure-For to $305.00
    * On Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 15
    Then On Order Details form, select service PME Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 16
    * On Order Details form, select service PME Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 17
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 18
    * On Order Details form, select service PME Legal Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 19
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    # Media Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 20
    * On Order Details form, select service MM Package
    * On Order Details form, set Insure-For to $56.00
    * On Order Details form, set Tracking to Signature Required

    # Parcel Select

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 21
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $345.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 22
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $456.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 23
    * On Order Details form, select service PSG Oversized Package
    * On Order Details form, set Insure-For to $567.00
    * On Order Details form, set Tracking to Signature Required

    # International

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country     | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Philippines | 0123456789  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service FCMI Large Envelope

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | India     | 9876543210  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 1
    * On Order Details form, select service FCM Large Envelope
    * On Order Details form, set Insure-For to $15.00
    * On Order Details form, set Tracking to "None"

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 2
    * On Order Details form, select service First-Class Mail Package/Thick Envelope
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 3
    * On Order Details form, select service PM Large Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 4
    * On Order Details form, select service PM Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 5
    * On Order Details form, select service PM Large Package
    * On Order Details form, set Insure-For to $145.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 6
    * On Order Details form, select service PM Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 7
    * On Order Details form, select service PM Padded Flat Rate Envelope
    * On Order Details form, set Insure-For to $98.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 8
    * On Order Details form, select service PM Legal Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 9
    * On Order Details form, select service PM Small Flat Rate Box
    * On Order Details form, set Insure-For to $30.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 10
    * On Order Details form, select service PM Medium Flat Rate Box
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 11
    * On Order Details form, select service PM Large Flat Rate Box
    * On Order Details form, set Insure-For to $239.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 12
    * On Order Details form, select service PM Regional Rate Box A
    * On Order Details form, set Insure-For to $105.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 13
    * On Order Details form, select service PM Regional Rate Box B
    * On Order Details form, set Insure-For to $205.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 14
    * On Order Details form, set Insure-For to $305.00
    * On Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 15
    Then On Order Details form, select service PME Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 16
    * On Order Details form, select service PME Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 17
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 18
    * On Order Details form, select service PME Legal Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 19
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    # Media Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 20
    * On Order Details form, select service MM Package
    * On Order Details form, set Insure-For to $56.00
    * On Order Details form, set Tracking to Signature Required

    # Parcel Select

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 21
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $345.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 22
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $456.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 23
    * On Order Details form, select service PSG Oversized Package
    * On Order Details form, set Insure-For to $567.00
    * On Order Details form, set Tracking to Signature Required

    # International

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Poland | 0123456789  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service FCMI Large Envelope

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Singapore | 9876543210  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 1
    * On Order Details form, select service FCM Large Envelope
    * On Order Details form, set Insure-For to $15.00
    * On Order Details form, set Tracking to "None"

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 2
    * On Order Details form, select service First-Class Mail Package/Thick Envelope
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 3
    * On Order Details form, select service PM Large Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 4
    * On Order Details form, select service PM Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 5
    * On Order Details form, select service PM Large Package
    * On Order Details form, set Insure-For to $145.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 6
    * On Order Details form, select service PM Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 7
    * On Order Details form, select service PM Padded Flat Rate Envelope
    * On Order Details form, set Insure-For to $98.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 8
    * On Order Details form, select service PM Legal Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 9
    * On Order Details form, select service PM Small Flat Rate Box
    * On Order Details form, set Insure-For to $30.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 10
    * On Order Details form, select service PM Medium Flat Rate Box
    * On Order Details form, set Insure-For to $45.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 11
    * On Order Details form, select service PM Large Flat Rate Box
    * On Order Details form, set Insure-For to $239.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 12
    * On Order Details form, select service PM Regional Rate Box A
    * On Order Details form, set Insure-For to $105.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 13
    * On Order Details form, select service PM Regional Rate Box B
    * On Order Details form, set Insure-For to $205.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 14
    * On Order Details form, set Insure-For to $305.00
    * On Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Ounces to 15
    Then On Order Details form, select service PME Package
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 16
    * On Order Details form, select service PME Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 17
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 18
    * On Order Details form, select service PME Legal Flat Rate Envelope
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 19
    * On Order Details form, select service PME Padded Flat Rate Envelope
    * On Order Details form, set Tracking to Signature Required

    # Media Mail

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 20
    * On Order Details form, select service MM Package
    * On Order Details form, set Insure-For to $56.00
    * On Order Details form, set Tracking to Signature Required

    # Parcel Select

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 21
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $345.00
    * On Order Details form, set Tracking to USPS Tracking

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 22
    Then On Order Details form, select service PSG Package
    * On Order Details form, set Insure-For to $456.00
    * On Order Details form, set Tracking to Signature Required

    * In Orders Toolbar, click Add button
    * On Order Details form, expect Order ID is truthy
    * On Order Details form, set Ship-From to default
    * On Order Details form, set Ship-To to address in Zone 1 through 4

    * On Order Details form, set Pounds to 23
    * On Order Details form, select service PSG Oversized Package
    * On Order Details form, set Insure-For to $567.00
    * On Order Details form, set Tracking to Signature Required

    # International

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country   | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Hong Kong | 0123456789  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service FCMI Large Envelope

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default

    Then On Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country  | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Thailand | 9876543210  | junk@stamps.com  |

    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set More Info to "random"
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service PMI Flat Rate Envelope

    Then Sign out

    #todo-rob affected