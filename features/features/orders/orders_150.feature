Feature: 150 orders

  Background:
    Given I am signed in to Orders

  @orders_150
  Scenario:  Inline Rates

    # First Class Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Select Service FCM Large Envelope
    * Order Details: Set Insure-For to $15.00
    * Order Details: Set Tracking to "None"

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Select Service First-Class Mail Package/Thick Envelope
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to USPS Tracking

    #Priority Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Select Service PM Large Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Select Service PM Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Select Service PM Large Package
    * Order Details: Set Insure-For to $145.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Select Service PM Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Select Service PM Padded Flat Rate Envelope
    * Order Details: Set Insure-For to $98.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Select Service PM Legal Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Select Service PM Small Flat Rate Box
    * Order Details: Set Insure-For to $30.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Select Service PM Medium Flat Rate Box
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Select Service PM Large Flat Rate Box
    * Order Details: Set Insure-For to $239.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Select Service PM Regional Rate Box A
    * Order Details: Set Insure-For to $105.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Select Service PM Regional Rate Box B
    * Order Details: Set Insure-For to $205.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 14
    * Order Details: Set Insure-For to $305.00
    * Order Details: Set Tracking to Signature Required

    # Priority Mail Express

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 15
    Then Order Details: Select Service PME Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Select Service PME Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Select Service PME Legal Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    # Media Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Select Service MM Package
    * Order Details: Set Insure-For to $56.00
    * Order Details: Set Tracking to Signature Required

    # Parcel Select

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 21
    * Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $345.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 22
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $456.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Select Service PSG Oversized Package
    * Order Details: Set Insure-For to $567.00
    * Order Details: Set Tracking to Signature Required

    # International

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service FCMI Large Envelope

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service PMI Flat Rate Envelope

    # First Class Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Select Service FCM Large Envelope
    * Order Details: Set Insure-For to $15.00
    * Order Details: Set Tracking to "None"

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Select Service First-Class Mail Package/Thick Envelope
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to USPS Tracking

    #Priority Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Select Service PM Large Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Select Service PM Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Select Service PM Large Package
    * Order Details: Set Insure-For to $145.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Select Service PM Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Select Service PM Padded Flat Rate Envelope
    * Order Details: Set Insure-For to $98.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Select Service PM Legal Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Select Service PM Small Flat Rate Box
    * Order Details: Set Insure-For to $30.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Select Service PM Medium Flat Rate Box
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Select Service PM Large Flat Rate Box
    * Order Details: Set Insure-For to $239.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Select Service PM Regional Rate Box A
    * Order Details: Set Insure-For to $105.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Select Service PM Regional Rate Box B
    * Order Details: Set Insure-For to $205.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 14
    * Order Details: Set Insure-For to $305.00
    * Order Details: Set Tracking to Signature Required

    # Priority Mail Express

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 15
    Then Order Details: Select Service PME Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Select Service PME Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Select Service PME Legal Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    # Media Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Select Service MM Package
    * Order Details: Set Insure-For to $56.00
    * Order Details: Set Tracking to Signature Required

    # Parcel Select

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 21
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $345.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 22
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $456.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Select Service PSG Oversized Package
    * Order Details: Set Insure-For to $567.00
    * Order Details: Set Tracking to Signature Required

    # International

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country | phone       |  email           |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Germany | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service FCMI Large Envelope

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | France    | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service PMI Flat Rate Envelope

    # First Class Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Select Service FCM Large Envelope
    * Order Details: Set Insure-For to $15.00
    * Order Details: Set Tracking to "None"

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Select Service First-Class Mail Package/Thick Envelope
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to USPS Tracking

    #Priority Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Select Service PM Large Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Select Service PM Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Select Service PM Large Package
    * Order Details: Set Insure-For to $145.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Select Service PM Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Select Service PM Padded Flat Rate Envelope
    * Order Details: Set Insure-For to $98.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Select Service PM Legal Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Select Service PM Small Flat Rate Box
    * Order Details: Set Insure-For to $30.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Select Service PM Medium Flat Rate Box
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Select Service PM Large Flat Rate Box
    * Order Details: Set Insure-For to $239.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Select Service PM Regional Rate Box A
    * Order Details: Set Insure-For to $105.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Select Service PM Regional Rate Box B
    * Order Details: Set Insure-For to $205.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4
    * Order Details: Set Ounces to 14
    * Order Details: Set Insure-For to $305.00
    * Order Details: Set Tracking to Signature Required

    # Priority Mail Express

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 15
    Then Order Details: Select Service PME Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Select Service PME Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Select Service PME Legal Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    # Media Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Select Service MM Package
    * Order Details: Set Insure-For to $56.00
    * Order Details: Set Tracking to Signature Required

    # Parcel Select

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 21
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $345.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 22
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $456.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Select Service PSG Oversized Package
    * Order Details: Set Insure-For to $567.00
    * Order Details: Set Tracking to Signature Required

    # International

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Brazil | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service FCMI Large Envelope

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Mexico    | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service PMI Flat Rate Envelope

    # First Class Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Select Service FCM Large Envelope
    * Order Details: Set Insure-For to $15.00
    * Order Details: Set Tracking to "None"

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Select Service First-Class Mail Package/Thick Envelope
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to USPS Tracking

    #Priority Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Select Service PM Large Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Select Service PM Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Select Service PM Large Package
    * Order Details: Set Insure-For to $145.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Select Service PM Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Select Service PM Padded Flat Rate Envelope
    * Order Details: Set Insure-For to $98.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Select Service PM Legal Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Select Service PM Small Flat Rate Box
    * Order Details: Set Insure-For to $30.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Select Service PM Medium Flat Rate Box
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Select Service PM Large Flat Rate Box
    * Order Details: Set Insure-For to $239.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Select Service PM Regional Rate Box A
    * Order Details: Set Insure-For to $105.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Select Service PM Regional Rate Box B
    * Order Details: Set Insure-For to $205.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 14
    * Order Details: Set Insure-For to $305.00
    * Order Details: Set Tracking to Signature Required

    # Priority Mail Express

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 15
    Then Order Details: Select Service PME Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Select Service PME Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Select Service PME Legal Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    # Media Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Select Service MM Package
    * Order Details: Set Insure-For to $56.00
    * Order Details: Set Tracking to Signature Required

    # Parcel Select

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 21
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $345.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 22
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $456.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Select Service PSG Oversized Package
    * Order Details: Set Insure-For to $567.00
    * Order Details: Set Tracking to Signature Required

    # International

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country     | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Philippines | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service FCMI Large Envelope

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | India     | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service PMI Flat Rate Envelope

    # First Class Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Select Service FCM Large Envelope
    * Order Details: Set Insure-For to $15.00
    * Order Details: Set Tracking to "None"

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Select Service First-Class Mail Package/Thick Envelope
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to USPS Tracking

    #Priority Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Select Service PM Large Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Select Service PM Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Select Service PM Large Package
    * Order Details: Set Insure-For to $145.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Select Service PM Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Select Service PM Padded Flat Rate Envelope
    * Order Details: Set Insure-For to $98.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Select Service PM Legal Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Select Service PM Small Flat Rate Box
    * Order Details: Set Insure-For to $30.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Select Service PM Medium Flat Rate Box
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Select Service PM Large Flat Rate Box
    * Order Details: Set Insure-For to $239.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Select Service PM Regional Rate Box A
    * Order Details: Set Insure-For to $105.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Select Service PM Regional Rate Box B
    * Order Details: Set Insure-For to $205.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 14
    * Order Details: Set Insure-For to $305.00
    * Order Details: Set Tracking to Signature Required

    # Priority Mail Express

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 15
    Then Order Details: Select Service PME Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Select Service PME Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Select Service PME Legal Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    # Media Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Select Service MM Package
    * Order Details: Set Insure-For to $56.00
    * Order Details: Set Tracking to Signature Required

    # Parcel Select

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 21
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $345.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 22
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $456.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Select Service PSG Oversized Package
    * Order Details: Set Insure-For to $567.00
    * Order Details: Set Tracking to Signature Required

    # International

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Poland | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service FCMI Large Envelope

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Singapore | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service PMI Flat Rate Envelope

    # First Class Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 1
    * Order Details: Select Service FCM Large Envelope
    * Order Details: Set Insure-For to $15.00
    * Order Details: Set Tracking to "None"

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 2
    * Order Details: Select Service First-Class Mail Package/Thick Envelope
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to USPS Tracking

    #Priority Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 3
    * Order Details: Select Service PM Large Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 4
    * Order Details: Select Service PM Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 5
    * Order Details: Select Service PM Large Package
    * Order Details: Set Insure-For to $145.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 6
    * Order Details: Select Service PM Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 7
    * Order Details: Select Service PM Padded Flat Rate Envelope
    * Order Details: Set Insure-For to $98.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 8
    * Order Details: Select Service PM Legal Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 9
    * Order Details: Select Service PM Small Flat Rate Box
    * Order Details: Set Insure-For to $30.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 10
    * Order Details: Select Service PM Medium Flat Rate Box
    * Order Details: Set Insure-For to $45.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 11
    * Order Details: Select Service PM Large Flat Rate Box
    * Order Details: Set Insure-For to $239.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 12
    * Order Details: Select Service PM Regional Rate Box A
    * Order Details: Set Insure-For to $105.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 13
    * Order Details: Select Service PM Regional Rate Box B
    * Order Details: Set Insure-For to $205.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 14
    * Order Details: Set Insure-For to $305.00
    * Order Details: Set Tracking to Signature Required

    # Priority Mail Express

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Ounces to 15
    Then Order Details: Select Service PME Package
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 16
    * Order Details: Select Service PME Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 17
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 18
    * Order Details: Select Service PME Legal Flat Rate Envelope
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 19
    * Order Details: Select Service PME Padded Flat Rate Envelope
    * Order Details: Set Tracking to Signature Required

    # Media Mail

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 20
    * Order Details: Select Service MM Package
    * Order Details: Set Insure-For to $56.00
    * Order Details: Set Tracking to Signature Required

    # Parcel Select

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 21
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $345.00
    * Order Details: Set Tracking to USPS Tracking

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 22
    Then Order Details: Select Service PSG Package
    * Order Details: Set Insure-For to $456.00
    * Order Details: Set Tracking to Signature Required

    * Orders Toolbar: Add
    * Order Details: Expect Order ID is truthy
    * Order Details: Set Ship-From to default
    * Order Details: Set Ship-To to address in Zone 1 through 4

    * Order Details: Set Pounds to 23
    * Order Details: Select Service PSG Oversized Package
    * Order Details: Set Insure-For to $567.00
    * Order Details: Set Tracking to Signature Required

    # International

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country   | phone       |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Hong Kong | 0123456789  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service FCMI Large Envelope

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country  | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Thailand | 9876543210  | junk@stamps.com  |

    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service PMI Flat Rate Envelope

    Then Sign out

    #todo-rob affected