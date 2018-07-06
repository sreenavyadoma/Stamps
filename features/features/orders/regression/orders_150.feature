Feature: 150 orders

  Background:
    Given a valid user is signed in to Web Apps

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 1
    Then set Order Details service to FCM Large Envelope/Flat
    Then set order details insure-for to $15.00
    Then set order details tracking to "None"

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 2
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set order details insure-for to $45.00
    Then set order details tracking to USPS Tracking

    #Priority Mail

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 3
    Then set Order Details service to PM Large/Thick Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 4
    Then set Order Details service to PM Package
    Then set order details tracking to Signature Required

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 5
    Then set Order Details service to PM Large Package
    Then set order details insure-for to $145.00
    Then set order details tracking to Signature Required

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 6
    Then set Order Details service to PM Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 7
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set order details insure-for to $98.00
    Then set order details tracking to USPS Tracking

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 8
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 9
    Then set Order Details service to PM Small Flat Rate Box
    Then set order details insure-for to $30.00
    Then set order details tracking to Signature Required

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 10
    Then set Order Details service to PM Medium Flat Rate Box
    Then set order details insure-for to $45.00
    Then set order details tracking to Signature Required

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 11
    Then set Order Details service to PM Large Flat Rate Box
    Then set order details insure-for to $239.00
    Then set order details tracking to Signature Required

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 12
    Then set Order Details service to PM Regional Rate Box A
    Then set order details insure-for to $105.00
    Then set order details tracking to Signature Required

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 13
    Then set Order Details service to PM Regional Rate Box B
    Then set order details insure-for to $205.00
    Then set order details tracking to USPS Tracking

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 14
    Then set order details insure-for to $305.00
    Then set order details tracking to Signature Required

    # Priority Mail Express

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details tracking to Signature Required

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 16
    Then set Order Details service to PME Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 17
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 18
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 19
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    # Media Mail

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 20
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set order details insure-for to $56.00
    Then set order details tracking to Signature Required

    # Parcel Select

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 21
    Then set Order Details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $345.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $456.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 23
    Then set Order Details service to PSG Oversized Package
    Then set order details insure-for to $567.00
    Then set order details tracking to Signature Required

    # International

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1    | street_address2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to PMI Flat Rate Envelope

    # First Class Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 1
    Then set Order Details service to FCM Large Envelope/Flat
    Then set order details insure-for to $15.00
    Then set order details tracking to "None"

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 2
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set order details insure-for to $45.00
    Then set order details tracking to USPS Tracking

    #Priority Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 3
    Then set Order Details service to PM Large/Thick Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 4
    Then set Order Details service to PM Package
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 5
    Then set Order Details service to PM Large Package
    Then set order details insure-for to $145.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 6
    Then set Order Details service to PM Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 7
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set order details insure-for to $98.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 8
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 9
    Then set Order Details service to PM Small Flat Rate Box
    Then set order details insure-for to $30.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 10
    Then set Order Details service to PM Medium Flat Rate Box
    Then set order details insure-for to $45.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 11
    Then set Order Details service to PM Large Flat Rate Box
    Then set order details insure-for to $239.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 12
    Then set Order Details service to PM Regional Rate Box A
    Then set order details insure-for to $105.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 13
    Then set Order Details service to PM Regional Rate Box B
    Then set order details insure-for to $205.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 14
    Then set order details insure-for to $305.00
    Then set order details tracking to Signature Required

    # Priority Mail Express

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 16
    Then set Order Details service to PME Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 17
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 18
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 19
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    # Media Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 20
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set order details insure-for to $56.00
    Then set order details tracking to Signature Required

    # Parcel Select

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 21
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $345.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $456.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 23
    Then set Order Details service to PSG Oversized Package
    Then set order details insure-for to $567.00
    Then set order details tracking to Signature Required

    # International

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country | phone       |  email           |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Germany | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1    | street_address2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | France    | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to PMI Flat Rate Envelope

    # First Class Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 1
    Then set Order Details service to FCM Large Envelope/Flat
    Then set order details insure-for to $15.00
    Then set order details tracking to "None"

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 2
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set order details insure-for to $45.00
    Then set order details tracking to USPS Tracking

    #Priority Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 3
    Then set Order Details service to PM Large/Thick Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 4
    Then set Order Details service to PM Package
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 5
    Then set Order Details service to PM Large Package
    Then set order details insure-for to $145.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 6
    Then set Order Details service to PM Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 7
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set order details insure-for to $98.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 8
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 9
    Then set Order Details service to PM Small Flat Rate Box
    Then set order details insure-for to $30.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 10
    Then set Order Details service to PM Medium Flat Rate Box
    Then set order details insure-for to $45.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 11
    Then set Order Details service to PM Large Flat Rate Box
    Then set order details insure-for to $239.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 12
    Then set Order Details service to PM Regional Rate Box A
    Then set order details insure-for to $105.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 13
    Then set Order Details service to PM Regional Rate Box B
    Then set order details insure-for to $205.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details ounces to 14
    Then set order details insure-for to $305.00
    Then set order details tracking to Signature Required

    # Priority Mail Express

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 16
    Then set Order Details service to PME Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 17
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 18
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 19
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    # Media Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 20
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set order details insure-for to $56.00
    Then set order details tracking to Signature Required

    # Parcel Select

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 21
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $345.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $456.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 23
    Then set Order Details service to PSG Oversized Package
    Then set order details insure-for to $567.00
    Then set order details tracking to Signature Required

    # International

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Brazil | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1    | street_address2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Mexico    | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to PMI Flat Rate Envelope

    # First Class Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 1
    Then set Order Details service to FCM Large Envelope/Flat
    Then set order details insure-for to $15.00
    Then set order details tracking to "None"

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 2
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set order details insure-for to $45.00
    Then set order details tracking to USPS Tracking

    #Priority Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 3
    Then set Order Details service to PM Large/Thick Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 4
    Then set Order Details service to PM Package
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 5
    Then set Order Details service to PM Large Package
    Then set order details insure-for to $145.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 6
    Then set Order Details service to PM Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 7
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set order details insure-for to $98.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 8
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 9
    Then set Order Details service to PM Small Flat Rate Box
    Then set order details insure-for to $30.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 10
    Then set Order Details service to PM Medium Flat Rate Box
    Then set order details insure-for to $45.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 11
    Then set Order Details service to PM Large Flat Rate Box
    Then set order details insure-for to $239.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 12
    Then set Order Details service to PM Regional Rate Box A
    Then set order details insure-for to $105.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 13
    Then set Order Details service to PM Regional Rate Box B
    Then set order details insure-for to $205.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 14
    Then set order details insure-for to $305.00
    Then set order details tracking to Signature Required

    # Priority Mail Express

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 16
    Then set Order Details service to PME Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 17
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 18
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 19
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    # Media Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 20
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set order details insure-for to $56.00
    Then set order details tracking to Signature Required

    # Parcel Select

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 21
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $345.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $456.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 23
    Then set Order Details service to PSG Oversized Package
    Then set order details insure-for to $567.00
    Then set order details tracking to Signature Required

    # International

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country     | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Philippines | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1    | street_address2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | India     | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to PMI Flat Rate Envelope

    # First Class Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 1
    Then set Order Details service to FCM Large Envelope/Flat
    Then set order details insure-for to $15.00
    Then set order details tracking to "None"

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 2
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set order details insure-for to $45.00
    Then set order details tracking to USPS Tracking

    #Priority Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 3
    Then set Order Details service to PM Large/Thick Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 4
    Then set Order Details service to PM Package
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 5
    Then set Order Details service to PM Large Package
    Then set order details insure-for to $145.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 6
    Then set Order Details service to PM Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 7
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set order details insure-for to $98.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 8
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 9
    Then set Order Details service to PM Small Flat Rate Box
    Then set order details insure-for to $30.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 10
    Then set Order Details service to PM Medium Flat Rate Box
    Then set order details insure-for to $45.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 11
    Then set Order Details service to PM Large Flat Rate Box
    Then set order details insure-for to $239.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 12
    Then set Order Details service to PM Regional Rate Box A
    Then set order details insure-for to $105.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 13
    Then set Order Details service to PM Regional Rate Box B
    Then set order details insure-for to $205.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 14
    Then set order details insure-for to $305.00
    Then set order details tracking to Signature Required

    # Priority Mail Express

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 16
    Then set Order Details service to PME Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 17
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 18
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 19
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    # Media Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 20
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set order details insure-for to $56.00
    Then set order details tracking to Signature Required

    # Parcel Select

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 21
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $345.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $456.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 23
    Then set Order Details service to PSG Oversized Package
    Then set order details insure-for to $567.00
    Then set order details tracking to Signature Required

    # International

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Poland | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1    | street_address2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Singapore | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to PMI Flat Rate Envelope

    # First Class Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 1
    Then set Order Details service to FCM Large Envelope/Flat
    Then set order details insure-for to $15.00
    Then set order details tracking to "None"

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 2
    Then set Order Details service to First-Class Mail Package/Thick Envelope
    Then set order details insure-for to $45.00
    Then set order details tracking to USPS Tracking

    #Priority Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 3
    Then set Order Details service to PM Large/Thick Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 4
    Then set Order Details service to PM Package
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 5
    Then set Order Details service to PM Large Package
    Then set order details insure-for to $145.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 6
    Then set Order Details service to PM Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 7
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then set order details insure-for to $98.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 8
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 9
    Then set Order Details service to PM Small Flat Rate Box
    Then set order details insure-for to $30.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 10
    Then set Order Details service to PM Medium Flat Rate Box
    Then set order details insure-for to $45.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 11
    Then set Order Details service to PM Large Flat Rate Box
    Then set order details insure-for to $239.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 12
    Then set Order Details service to PM Regional Rate Box A
    Then set order details insure-for to $105.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 13
    Then set Order Details service to PM Regional Rate Box B
    Then set order details insure-for to $205.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 14
    Then set order details insure-for to $305.00
    Then set order details tracking to Signature Required

    # Priority Mail Express

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details ounces to 15
    Then set order details service to PME Package/Flat/Thick Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 16
    Then set Order Details service to PME Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 17
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 18
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 19
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then set order details tracking to Signature Required

    # Media Mail

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 20
    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then set order details insure-for to $56.00
    Then set order details tracking to Signature Required

    # Parcel Select

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 21
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $345.00
    Then set order details tracking to USPS Tracking

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 22
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details insure-for to $456.00
    Then set order details tracking to Signature Required

    Then add new order
    
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4

    Then set order details pounds to 23
    Then set Order Details service to PSG Oversized Package
    Then set order details insure-for to $567.00
    Then set order details tracking to Signature Required

    # International

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country   | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Hong Kong | 0123456789  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to FCMI Large Envelope/Flat

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to international address to
      | full_name   | company | street_address1    | street_address2 | city   | province | postal_code  | country  | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Thailand | 9876543210  | junk@stamps.com  |

    Then on order details form, add item 1, qty 1, id random, description random

    Then click order details form customs form button

    Then set customs package contents to Merchandise
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Required
    Then set customs more info to random
    Then set customs itn number to random

    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set order details service to PMI Flat Rate Envelope

    Then sign out

    #todo-rob affected