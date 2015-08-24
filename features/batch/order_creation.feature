Feature: 10 orders

  Background:
    Given I am signed in as a batch shipper

  @10
  Scenario:  Order Creation

    # First Class Mail

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to Priority Mail Package
    * Set Insured Value to $15.00

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to Priority Mail Package
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Large Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 11
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    # Media Mail

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 3
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 10
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $235.00
    * Set Tracking to USPS Tracking

  @20
  Scenario:  Order Creation

    # First Class Mail

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to Priority Mail Package
    * Set Insured Value to $15.00

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to Priority Mail Package
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Large Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 11
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    # Media Mail

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 3
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 10
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $235.00
    * Set Tracking to USPS Tracking


    # First Class Mail

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to Priority Mail Package
    * Set Insured Value to $15.00

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to Priority Mail Package
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Large Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 1
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 11
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    # Media Mail

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Ounces to 3
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 10
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $235.00
    * Set Tracking to USPS Tracking


