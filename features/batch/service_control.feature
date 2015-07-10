@regression
Feature: B-01588 As a batch shipper, I want to able to change the Domestic USPS service used to fulfill an order.
  Background:
    Given I am signed in as a batch shipper auto06/password1

  @service_control
  Scenario:  Inline Rates
    * Add new order
    * Edit row 1 in the order grid
    * Set Ship From to default
    * Set Recipient Complete Address to B-01671, Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to First Class Mail Package/Thick Envelope
    * Set Service to First-Class Mail Envelope
    * Set Service to First-Class Mail Large Envelope/Flat
    * Set Service to First-Class Mail Package/Thick Envelope
    * Set Service to Priority Mail Large/Thick Envelope
    * Set Service to Priority Mail Package
    * Set Service to Priority Mail Large Package
    * Set Service to Priority Mail Flat Rate Envelope
    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Service to Priority Mail Small Flat Rate Box
    * Set Service to Priority Mail Medium Flat Rate Box
    * Set Service to Priority Mail Large Flat Rate Box
    * Set Service to Priority Mail Regional Rate Box A
    * Set Service to Priority Mail Regional Rate Box B
    * Set Service to Priority Mail Regional Rate Box C
    * Set Service to Priority Mail Express Package
    * Set Service to Priority Mail Express Flat Rate Envelope
    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Set Service to Parcel Select Package
    * Set Service to Parcel Select Large Package
    * Set Service to Parcel Select Oversized Package
    * Set Service to Media Mail Package
