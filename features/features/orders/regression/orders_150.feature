Feature: 150 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 1
    * set Order Details service to FCM Large Envelope/Flat
    * set order details insure-for to $15.00
    * set Order Details Tracking to "None"

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 2
    * set Order Details service to First-Class Mail Package/Thick Envelope
    * set order details insure-for to $45.00
    * set Order Details Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 3
    * set Order Details service to PM Large/Thick Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 4
    * set Order Details service to PM Package
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 5
    * set Order Details service to PM Large Package
    * set order details insure-for to $145.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 6
    * set Order Details service to PM Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 7
    * set Order Details service to PM Padded Flat Rate Envelope
    * set order details insure-for to $98.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 8
    * set Order Details service to PM Legal Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 9
    * set Order Details service to PM Small Flat Rate Box
    * set order details insure-for to $30.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 10
    * set Order Details service to PM Medium Flat Rate Box
    * set order details insure-for to $45.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 11
    * set Order Details service to PM Large Flat Rate Box
    * set order details insure-for to $239.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 12
    * set Order Details service to PM Regional Rate Box A
    * set order details insure-for to $105.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 13
    * set Order Details service to PM Regional Rate Box B
    * set order details insure-for to $205.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 14
    * set order details insure-for to $305.00
    * set Order Details Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 16
    * set Order Details service to PME Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 17
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 18
    * set Order Details service to PME Legal Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 19
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 20
    * set Order Details service to MM Package/Flat/Thick Envelope
    * set order details insure-for to $56.00
    * set Order Details Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 21
    * set Order Details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $345.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $456.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 23
    * set Order Details service to PSG Oversized Package
    * set order details insure-for to $567.00
    * set Order Details Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to PMI Flat Rate Envelope

    # First Class Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 1
    * set Order Details service to FCM Large Envelope/Flat
    * set order details insure-for to $15.00
    * set Order Details Tracking to "None"

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 2
    * set Order Details service to First-Class Mail Package/Thick Envelope
    * set order details insure-for to $45.00
    * set Order Details Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 3
    * set Order Details service to PM Large/Thick Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 4
    * set Order Details service to PM Package
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 5
    * set Order Details service to PM Large Package
    * set order details insure-for to $145.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 6
    * set Order Details service to PM Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 7
    * set Order Details service to PM Padded Flat Rate Envelope
    * set order details insure-for to $98.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 8
    * set Order Details service to PM Legal Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 9
    * set Order Details service to PM Small Flat Rate Box
    * set order details insure-for to $30.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 10
    * set Order Details service to PM Medium Flat Rate Box
    * set order details insure-for to $45.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 11
    * set Order Details service to PM Large Flat Rate Box
    * set order details insure-for to $239.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 12
    * set Order Details service to PM Regional Rate Box A
    * set order details insure-for to $105.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 13
    * set Order Details service to PM Regional Rate Box B
    * set order details insure-for to $205.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 14
    * set order details insure-for to $305.00
    * set Order Details Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 16
    * set Order Details service to PME Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 17
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 18
    * set Order Details service to PME Legal Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 19
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 20
    * set Order Details service to MM Package/Flat/Thick Envelope
    * set order details insure-for to $56.00
    * set Order Details Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 21
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $345.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $456.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 23
    * set Order Details service to PSG Oversized Package
    * set order details insure-for to $567.00
    * set Order Details Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country | phone       |  email           |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Germany | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | France    | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to PMI Flat Rate Envelope

    # First Class Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 1
    * set Order Details service to FCM Large Envelope/Flat
    * set order details insure-for to $15.00
    * set Order Details Tracking to "None"

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 2
    * set Order Details service to First-Class Mail Package/Thick Envelope
    * set order details insure-for to $45.00
    * set Order Details Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 3
    * set Order Details service to PM Large/Thick Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 4
    * set Order Details service to PM Package
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 5
    * set Order Details service to PM Large Package
    * set order details insure-for to $145.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 6
    * set Order Details service to PM Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 7
    * set Order Details service to PM Padded Flat Rate Envelope
    * set order details insure-for to $98.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 8
    * set Order Details service to PM Legal Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 9
    * set Order Details service to PM Small Flat Rate Box
    * set order details insure-for to $30.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 10
    * set Order Details service to PM Medium Flat Rate Box
    * set order details insure-for to $45.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 11
    * set Order Details service to PM Large Flat Rate Box
    * set order details insure-for to $239.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 12
    * set Order Details service to PM Regional Rate Box A
    * set order details insure-for to $105.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 13
    * set Order Details service to PM Regional Rate Box B
    * set order details insure-for to $205.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4
    * set order details ounces to 14
    * set order details insure-for to $305.00
    * set Order Details Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 16
    * set Order Details service to PME Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 17
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 18
    * set Order Details service to PME Legal Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 19
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 20
    * set Order Details service to MM Package/Flat/Thick Envelope
    * set order details insure-for to $56.00
    * set Order Details Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 21
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $345.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $456.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 23
    * set Order Details service to PSG Oversized Package
    * set order details insure-for to $567.00
    * set Order Details Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Brazil | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Mexico    | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to PMI Flat Rate Envelope

    # First Class Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 1
    * set Order Details service to FCM Large Envelope/Flat
    * set order details insure-for to $15.00
    * set Order Details Tracking to "None"

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 2
    * set Order Details service to First-Class Mail Package/Thick Envelope
    * set order details insure-for to $45.00
    * set Order Details Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 3
    * set Order Details service to PM Large/Thick Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 4
    * set Order Details service to PM Package
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 5
    * set Order Details service to PM Large Package
    * set order details insure-for to $145.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 6
    * set Order Details service to PM Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 7
    * set Order Details service to PM Padded Flat Rate Envelope
    * set order details insure-for to $98.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 8
    * set Order Details service to PM Legal Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 9
    * set Order Details service to PM Small Flat Rate Box
    * set order details insure-for to $30.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 10
    * set Order Details service to PM Medium Flat Rate Box
    * set order details insure-for to $45.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 11
    * set Order Details service to PM Large Flat Rate Box
    * set order details insure-for to $239.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 12
    * set Order Details service to PM Regional Rate Box A
    * set order details insure-for to $105.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 13
    * set Order Details service to PM Regional Rate Box B
    * set order details insure-for to $205.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 14
    * set order details insure-for to $305.00
    * set Order Details Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 16
    * set Order Details service to PME Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 17
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 18
    * set Order Details service to PME Legal Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 19
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 20
    * set Order Details service to MM Package/Flat/Thick Envelope
    * set order details insure-for to $56.00
    * set Order Details Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 21
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $345.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $456.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 23
    * set Order Details service to PSG Oversized Package
    * set order details insure-for to $567.00
    * set Order Details Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country     | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Philippines | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | India     | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to PMI Flat Rate Envelope

    # First Class Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 1
    * set Order Details service to FCM Large Envelope/Flat
    * set order details insure-for to $15.00
    * set Order Details Tracking to "None"

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 2
    * set Order Details service to First-Class Mail Package/Thick Envelope
    * set order details insure-for to $45.00
    * set Order Details Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 3
    * set Order Details service to PM Large/Thick Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 4
    * set Order Details service to PM Package
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 5
    * set Order Details service to PM Large Package
    * set order details insure-for to $145.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 6
    * set Order Details service to PM Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 7
    * set Order Details service to PM Padded Flat Rate Envelope
    * set order details insure-for to $98.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 8
    * set Order Details service to PM Legal Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 9
    * set Order Details service to PM Small Flat Rate Box
    * set order details insure-for to $30.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 10
    * set Order Details service to PM Medium Flat Rate Box
    * set order details insure-for to $45.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 11
    * set Order Details service to PM Large Flat Rate Box
    * set order details insure-for to $239.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 12
    * set Order Details service to PM Regional Rate Box A
    * set order details insure-for to $105.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 13
    * set Order Details service to PM Regional Rate Box B
    * set order details insure-for to $205.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 14
    * set order details insure-for to $305.00
    * set Order Details Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 16
    * set Order Details service to PME Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 17
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 18
    * set Order Details service to PME Legal Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 19
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 20
    * set Order Details service to MM Package/Flat/Thick Envelope
    * set order details insure-for to $56.00
    * set Order Details Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 21
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $345.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $456.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 23
    * set Order Details service to PSG Oversized Package
    * set order details insure-for to $567.00
    * set Order Details Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Poland | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Singapore | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to PMI Flat Rate Envelope

    # First Class Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 1
    * set Order Details service to FCM Large Envelope/Flat
    * set order details insure-for to $15.00
    * set Order Details Tracking to "None"

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 2
    * set Order Details service to First-Class Mail Package/Thick Envelope
    * set order details insure-for to $45.00
    * set Order Details Tracking to USPS Tracking

    #Priority Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 3
    * set Order Details service to PM Large/Thick Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 4
    * set Order Details service to PM Package
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 5
    * set Order Details service to PM Large Package
    * set order details insure-for to $145.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 6
    * set Order Details service to PM Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 7
    * set Order Details service to PM Padded Flat Rate Envelope
    * set order details insure-for to $98.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 8
    * set Order Details service to PM Legal Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 9
    * set Order Details service to PM Small Flat Rate Box
    * set order details insure-for to $30.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 10
    * set Order Details service to PM Medium Flat Rate Box
    * set order details insure-for to $45.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 11
    * set Order Details service to PM Large Flat Rate Box
    * set order details insure-for to $239.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 12
    * set Order Details service to PM Regional Rate Box A
    * set order details insure-for to $105.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 13
    * set Order Details service to PM Regional Rate Box B
    * set order details insure-for to $205.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 14
    * set order details insure-for to $305.00
    * set Order Details Tracking to Signature Required

    # Priority Mail Express

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 16
    * set Order Details service to PME Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 17
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 18
    * set Order Details service to PME Legal Flat Rate Envelope
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 19
    * set Order Details service to PME Padded Flat Rate Envelope
    * set Order Details Tracking to Signature Required

    # Media Mail

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 20
    * set Order Details service to MM Package/Flat/Thick Envelope
    * set order details insure-for to $56.00
    * set Order Details Tracking to Signature Required

    # Parcel Select

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 21
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $345.00
    * set Order Details Tracking to USPS Tracking

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    * set order details insure-for to $456.00
    * set Order Details Tracking to Signature Required

    * add new order
    * expect Order Details Order ID is truthy
    * set Order Details Ship-From to default
    * set Order Details Ship-To to random address between zone 1 and 4

    * set order details pounds to 23
    * set Order Details service to PSG Oversized Package
    * set order details insure-for to $567.00
    * set Order Details Tracking to Signature Required

    # International

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country   | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Hong Kong | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set Order Details Ship-From to default

    Then set order details ship-to international address to
      | full_name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country  | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Thailand | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click Order Details form Customs Form button

    Then set Customs Package Contents to Merchandise
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Required
    Then set Customs More Info to random
    Then set Customs ITN Number to random

    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then set order details service to PMI Flat Rate Envelope

    Then sign out

    #todo-rob affected