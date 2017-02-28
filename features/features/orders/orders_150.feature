Feature: 150 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * on Order Details form, set Insure-For to $15.00
    * on Order Details form, set Tracking to "None"

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 3
    * on Order Details form, select service PM Large Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 4
    * on Order Details form, select service PM Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 5
    * on Order Details form, select service PM Large Package
    * on Order Details form, set Insure-For to $145.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * on Order Details form, set Insure-For to $98.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * on Order Details form, set Insure-For to $30.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * on Order Details form, set Insure-For to $239.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * on Order Details form, set Insure-For to $105.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * on Order Details form, set Insure-For to $205.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 14
    * on Order Details form, set Insure-For to $305.00
    * on Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 15
    Then on Order Details form, select service PME Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 20
    * on Order Details form, select service MM Package
    * on Order Details form, set Insure-For to $56.00
    * on Order Details form, set Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 21
    * on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $345.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 22
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $456.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * on Order Details form, set Insure-For to $567.00
    * on Order Details form, set Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * on Order Details form, set Insure-For to $15.00
    * on Order Details form, set Tracking to "None"

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 3
    * on Order Details form, select service PM Large Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 4
    * on Order Details form, select service PM Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 5
    * on Order Details form, select service PM Large Package
    * on Order Details form, set Insure-For to $145.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * on Order Details form, set Insure-For to $98.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * on Order Details form, set Insure-For to $30.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * on Order Details form, set Insure-For to $239.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * on Order Details form, set Insure-For to $105.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * on Order Details form, set Insure-For to $205.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 14
    * on Order Details form, set Insure-For to $305.00
    * on Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 15
    Then on Order Details form, select service PME Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 20
    * on Order Details form, select service MM Package
    * on Order Details form, set Insure-For to $56.00
    * on Order Details form, set Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 21
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $345.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 22
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $456.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * on Order Details form, set Insure-For to $567.00
    * on Order Details form, set Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country | phone       |  email           |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Germany | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | France    | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * on Order Details form, set Insure-For to $15.00
    * on Order Details form, set Tracking to "None"

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 3
    * on Order Details form, select service PM Large Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 4
    * on Order Details form, select service PM Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 5
    * on Order Details form, select service PM Large Package
    * on Order Details form, set Insure-For to $145.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * on Order Details form, set Insure-For to $98.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * on Order Details form, set Insure-For to $30.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * on Order Details form, set Insure-For to $239.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * on Order Details form, set Insure-For to $105.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * on Order Details form, set Insure-For to $205.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4
    * on Order Details form, set Ounces to 14
    * on Order Details form, set Insure-For to $305.00
    * on Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 15
    Then on Order Details form, select service PME Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 20
    * on Order Details form, select service MM Package
    * on Order Details form, set Insure-For to $56.00
    * on Order Details form, set Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 21
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $345.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 22
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $456.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * on Order Details form, set Insure-For to $567.00
    * on Order Details form, set Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Brazil | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Mexico    | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * on Order Details form, set Insure-For to $15.00
    * on Order Details form, set Tracking to "None"

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 3
    * on Order Details form, select service PM Large Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 4
    * on Order Details form, select service PM Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 5
    * on Order Details form, select service PM Large Package
    * on Order Details form, set Insure-For to $145.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * on Order Details form, set Insure-For to $98.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * on Order Details form, set Insure-For to $30.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * on Order Details form, set Insure-For to $239.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * on Order Details form, set Insure-For to $105.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * on Order Details form, set Insure-For to $205.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 14
    * on Order Details form, set Insure-For to $305.00
    * on Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 15
    Then on Order Details form, select service PME Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 20
    * on Order Details form, select service MM Package
    * on Order Details form, set Insure-For to $56.00
    * on Order Details form, set Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 21
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $345.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 22
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $456.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * on Order Details form, set Insure-For to $567.00
    * on Order Details form, set Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country     | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Philippines | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | India     | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * on Order Details form, set Insure-For to $15.00
    * on Order Details form, set Tracking to "None"

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 3
    * on Order Details form, select service PM Large Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 4
    * on Order Details form, select service PM Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 5
    * on Order Details form, select service PM Large Package
    * on Order Details form, set Insure-For to $145.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * on Order Details form, set Insure-For to $98.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * on Order Details form, set Insure-For to $30.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * on Order Details form, set Insure-For to $239.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * on Order Details form, set Insure-For to $105.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * on Order Details form, set Insure-For to $205.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 14
    * on Order Details form, set Insure-For to $305.00
    * on Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 15
    Then on Order Details form, select service PME Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 20
    * on Order Details form, select service MM Package
    * on Order Details form, set Insure-For to $56.00
    * on Order Details form, set Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 21
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $345.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 22
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $456.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * on Order Details form, set Insure-For to $567.00
    * on Order Details form, set Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Poland | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Singapore | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * on Order Details form, set Insure-For to $15.00
    * on Order Details form, set Tracking to "None"

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 3
    * on Order Details form, select service PM Large Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 4
    * on Order Details form, select service PM Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 5
    * on Order Details form, select service PM Large Package
    * on Order Details form, set Insure-For to $145.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * on Order Details form, set Insure-For to $98.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * on Order Details form, set Insure-For to $30.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * on Order Details form, set Insure-For to $45.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * on Order Details form, set Insure-For to $239.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * on Order Details form, set Insure-For to $105.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * on Order Details form, set Insure-For to $205.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 14
    * on Order Details form, set Insure-For to $305.00
    * on Order Details form, set Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Ounces to 15
    Then on Order Details form, select service PME Package
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * on Order Details form, set Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 20
    * on Order Details form, select service MM Package
    * on Order Details form, set Insure-For to $56.00
    * on Order Details form, set Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 21
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $345.00
    * on Order Details form, set Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 22
    Then on Order Details form, select service PSG Package
    * on Order Details form, set Insure-For to $456.00
    * on Order Details form, set Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * on Order Details form, expect Order ID is truthy
    * on Order Details form, set Ship-From to default
    * on Order Details form, set Ship-To to address in Zone 1 through 4

    * on Order Details form, set Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * on Order Details form, set Insure-For to $567.00
    * on Order Details form, set Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country   | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Hong Kong | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details International form, set address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country  | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Thailand | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service PMI Flat Rate Envelope

    Then Sign out

    #todo-rob affected