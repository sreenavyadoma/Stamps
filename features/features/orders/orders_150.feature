Feature: 150 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 3
    * on Order Details form, select service PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 4
    * on Order Details form, select service PM Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 5
    * on Order Details form, select service PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 15
    Then on Order Details form, select service PME Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 20
    * on Order Details form, select service MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 21
    * on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 22
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 3
    * on Order Details form, select service PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 4
    * on Order Details form, select service PM Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 5
    * on Order Details form, select service PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 15
    Then on Order Details form, select service PME Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 20
    * on Order Details form, select service MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 21
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 22
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country | phone       |  email           |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Germany | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | France    | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 3
    * on Order Details form, select service PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 4
    * on Order Details form, select service PM Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 5
    * on Order Details form, select service PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4
    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 15
    Then on Order Details form, select service PME Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 20
    * on Order Details form, select service MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 21
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 22
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Brazil | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Mexico    | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 3
    * on Order Details form, select service PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 4
    * on Order Details form, select service PM Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 5
    * on Order Details form, select service PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 15
    Then on Order Details form, select service PME Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 20
    * on Order Details form, select service MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 21
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 22
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country     | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Philippines | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | India     | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 3
    * on Order Details form, select service PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 4
    * on Order Details form, select service PM Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 5
    * on Order Details form, select service PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 15
    Then on Order Details form, select service PME Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 20
    * on Order Details form, select service MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 21
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 22
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Poland | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Singapore | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service PMI Flat Rate Envelope

    # First Class Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 1
    * on Order Details form, select service FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 2
    * on Order Details form, select service First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 3
    * on Order Details form, select service PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 4
    * on Order Details form, select service PM Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 5
    * on Order Details form, select service PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 6
    * on Order Details form, select service PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 7
    * on Order Details form, select service PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 8
    * on Order Details form, select service PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 9
    * on Order Details form, select service PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 10
    * on Order Details form, select service PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 11
    * on Order Details form, select service PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 12
    * on Order Details form, select service PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 13
    * on Order Details form, select service PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Ounces to 15
    Then on Order Details form, select service PME Package
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 16
    * on Order Details form, select service PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 17
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 18
    * on Order Details form, select service PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 19
    * on Order Details form, select service PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 20
    * on Order Details form, select service MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 21
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 22
    Then on Order Details form, select service PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * in Orders Toolbar, click Add button
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to address in Zone 1 through 4

    * set Order Details form Pounds to 23
    * on Order Details form, select service PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country   | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Hong Kong | 0123456789  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service FCMI Large Envelope

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country  | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Thailand | 9876543210  | junk@stamps.com  |

    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Required
    Then set Customs form More Info to random
    Then set Customs form ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then on Order Details form, select service PMI Flat Rate Envelope

    Then Sign out

    #todo-rob affected