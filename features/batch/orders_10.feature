Feature: 10 orders

  Background:
    Given I am signed in as a batch shipper

  @orders_10
  Scenario:  Inline Rates

    # First Class Mail

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756, Large Envelope, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Service to First-Class Mail Large Envelope/Flat
    * Set Insured Value to $15.00

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756, Thick Envelope, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Service to First-Class Mail Package/Thick Envelope
    * Set Insured Value to $45.00
    * Set Tracking to USPS Tracking

    #Priority Mail

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756, Package, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Service to Priority Mail Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756, Large Package, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Service to Priority Mail Large Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756, Flat Envelope, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756, Box A, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Service to Priority Mail Regional Rate Box A
    * Set Insured Value to $105.00
    * Set Tracking to Signature Required

    # Priority Mail Express

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756, Express Package, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Service to Priority Mail Express Package
    * Set Tracking to Signature Required

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756, Padded Envelope, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 11
    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Set Tracking to Signature Required

    # Media Mail

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756, Media Mail, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 3
    * Set Service to Media Mail Package
    * Set Insured Value to $56.00
    * Set Tracking to Signature Required

    # Parcel Select

    * Add new order
    * Set Ship From to default
    * Set Recipient Address to B-01756, Parcel Package, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 10
    * Set Service to Parcel Select Large Package
    * Set Insured Value to $235.00
    * Set Tracking to USPS Tracking

