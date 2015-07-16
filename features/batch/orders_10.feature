Feature: 10 orders

  Background:
    Given I am signed in as a batch shipper

  @orders_10
  Scenario:  Inline Rates

    # First Class Mail

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756 Print, First-Class Mail Large Envelope/Flat, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Service to First-Class Mail Large Envelope/Flat
    * Set Insured Value to $15.00

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756 Print, First-Class Mail Package/Thick Envelope, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Service to First-Class Mail Package/Thick Envelope
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756 Print, Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756 Print, Large Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Service to Priority Mail Large Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756 Print, Legal Flat Rate Envelope, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756 Print, Regional Rate Box A, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756 Print, Express Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756 Print, Express Padded Flat Rate Envelope, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 11
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    # Media Mail

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756 Print, Media Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 3
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756 Print, Parcel Select Large Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 10
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $235.00
    * Set Tracking to USPS Tracking

