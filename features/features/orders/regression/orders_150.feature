Feature: 150 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 1
    * set Order Details form service to FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 2
    * set Order Details form service to First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 3
    * set Order Details form service to PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 4
    * set Order Details form service to PM Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 5
    * set Order Details form service to PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 6
    * set Order Details form service to PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 7
    * set Order Details form service to PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 8
    * set Order Details form service to PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 9
    * set Order Details form service to PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 10
    * set Order Details form service to PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 11
    * set Order Details form service to PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 12
    * set Order Details form service to PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 13
    * set Order Details form service to PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 15
    Then set Order Details form service to PME Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 16
    * set Order Details form service to PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 17
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 18
    * set Order Details form service to PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 19
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 20
    * set Order Details form service to MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 21
    * set Order Details form service to PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 22
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 23
    * set Order Details form service to PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
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
    Then set Order Details form service to FCMI Large Envelope

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
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
    Then set Order Details form service to PMI Flat Rate Envelope

    # First Class Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 1
    * set Order Details form service to FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 2
    * set Order Details form service to First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 3
    * set Order Details form service to PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 4
    * set Order Details form service to PM Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 5
    * set Order Details form service to PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 6
    * set Order Details form service to PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 7
    * set Order Details form service to PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 8
    * set Order Details form service to PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 9
    * set Order Details form service to PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 10
    * set Order Details form service to PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 11
    * set Order Details form service to PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 12
    * set Order Details form service to PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 13
    * set Order Details form service to PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 15
    Then set Order Details form service to PME Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 16
    * set Order Details form service to PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 17
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 18
    * set Order Details form service to PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 19
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 20
    * set Order Details form service to MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 21
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 22
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 23
    * set Order Details form service to PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country | phone       |  email           |
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
    Then set Order Details form service to FCMI Large Envelope

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
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
    Then set Order Details form service to PMI Flat Rate Envelope

    # First Class Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 1
    * set Order Details form service to FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 2
    * set Order Details form service to First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 3
    * set Order Details form service to PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 4
    * set Order Details form service to PM Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 5
    * set Order Details form service to PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 6
    * set Order Details form service to PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 7
    * set Order Details form service to PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 8
    * set Order Details form service to PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 9
    * set Order Details form service to PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 10
    * set Order Details form service to PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 11
    * set Order Details form service to PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 12
    * set Order Details form service to PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 13
    * set Order Details form service to PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4
    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 15
    Then set Order Details form service to PME Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 16
    * set Order Details form service to PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 17
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 18
    * set Order Details form service to PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 19
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 20
    * set Order Details form service to MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 21
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 22
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 23
    * set Order Details form service to PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
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
    Then set Order Details form service to FCMI Large Envelope

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
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
    Then set Order Details form service to PMI Flat Rate Envelope

    # First Class Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 1
    * set Order Details form service to FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 2
    * set Order Details form service to First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 3
    * set Order Details form service to PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 4
    * set Order Details form service to PM Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 5
    * set Order Details form service to PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 6
    * set Order Details form service to PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 7
    * set Order Details form service to PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 8
    * set Order Details form service to PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 9
    * set Order Details form service to PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 10
    * set Order Details form service to PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 11
    * set Order Details form service to PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 12
    * set Order Details form service to PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 13
    * set Order Details form service to PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 15
    Then set Order Details form service to PME Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 16
    * set Order Details form service to PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 17
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 18
    * set Order Details form service to PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 19
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 20
    * set Order Details form service to MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 21
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 22
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 23
    * set Order Details form service to PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country     | phone       |  email  |
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
    Then set Order Details form service to FCMI Large Envelope

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
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
    Then set Order Details form service to PMI Flat Rate Envelope

    # First Class Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 1
    * set Order Details form service to FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 2
    * set Order Details form service to First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 3
    * set Order Details form service to PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 4
    * set Order Details form service to PM Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 5
    * set Order Details form service to PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 6
    * set Order Details form service to PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 7
    * set Order Details form service to PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 8
    * set Order Details form service to PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 9
    * set Order Details form service to PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 10
    * set Order Details form service to PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 11
    * set Order Details form service to PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 12
    * set Order Details form service to PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 13
    * set Order Details form service to PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 15
    Then set Order Details form service to PME Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 16
    * set Order Details form service to PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 17
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 18
    * set Order Details form service to PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 19
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 20
    * set Order Details form service to MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 21
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 22
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 23
    * set Order Details form service to PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
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
    Then set Order Details form service to FCMI Large Envelope

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
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
    Then set Order Details form service to PMI Flat Rate Envelope

    # First Class Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 1
    * set Order Details form service to FCM Large Envelope
    * set Order Details form Insure-For to $15.00
    * set Order Details form Tracking to "None"

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 2
    * set Order Details form service to First-Class Mail Package/Thick Envelope
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 3
    * set Order Details form service to PM Large/Thick Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 4
    * set Order Details form service to PM Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 5
    * set Order Details form service to PM Large Package
    * set Order Details form Insure-For to $145.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 6
    * set Order Details form service to PM Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 7
    * set Order Details form service to PM Padded Flat Rate Envelope
    * set Order Details form Insure-For to $98.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 8
    * set Order Details form service to PM Legal Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 9
    * set Order Details form service to PM Small Flat Rate Box
    * set Order Details form Insure-For to $30.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 10
    * set Order Details form service to PM Medium Flat Rate Box
    * set Order Details form Insure-For to $45.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 11
    * set Order Details form service to PM Large Flat Rate Box
    * set Order Details form Insure-For to $239.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 12
    * set Order Details form service to PM Regional Rate Box A
    * set Order Details form Insure-For to $105.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 13
    * set Order Details form service to PM Regional Rate Box B
    * set Order Details form Insure-For to $205.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 14
    * set Order Details form Insure-For to $305.00
    * set Order Details form Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Ounces to 15
    Then set Order Details form service to PME Package
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 16
    * set Order Details form service to PME Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 17
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 18
    * set Order Details form service to PME Legal Flat Rate Envelope
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 19
    * set Order Details form service to PME Padded Flat Rate Envelope
    * set Order Details form Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 20
    * set Order Details form service to MM Package
    * set Order Details form Insure-For to $56.00
    * set Order Details form Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 21
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $345.00
    * set Order Details form Tracking to USPS Tracking

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 22
    Then set Order Details form service to PSG Package
    * set Order Details form Insure-For to $456.00
    * set Order Details form Tracking to Signature Required

    * add new order
    * expect Order Details form Order ID is truthy
    * set Order Details form Ship-From to default
    * set Order Details form Ship-To to random address between zone 1 and 4

    * set Order Details form Pounds to 23
    * set Order Details form service to PSG Oversized Package
    * set Order Details form Insure-For to $567.00
    * set Order Details form Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country   | phone       |  email  |
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
    Then set Order Details form service to FCMI Large Envelope

    Then add new order
    Then set Order Details form Ship-From to default

    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country  | phone   |  email  |
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
    Then set Order Details form service to PMI Flat Rate Envelope

    Then Sign out

    #todo-rob affected