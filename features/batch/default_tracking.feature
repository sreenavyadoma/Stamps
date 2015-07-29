@regression
Feature: B-01736 Set Correct Default for Tracking

  Background:
    Given I am signed in as a batch shipper

  @tracking
  Scenario:  Print - First-Class Mail Envelope
    * Add new order

    * Set Recipient Address to B-01736, Default Tracking, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button

    * Set Service to Priority Mail Large/Thick Envelope
    * Expect Service to be Priority Mail Large/Thick Envelope
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Package
    * Expect Service to be Priority Mail Package
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Large Package
    * Expect Service to be Priority Mail Large Package
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Flat Rate Envelope
    * Expect Service to be Priority Mail Flat Rate Envelope
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Expect Service to be Priority Mail Padded Flat Rate Envelope
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Expect Service to be Priority Mail Legal Flat Rate Envelope
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Regional Rate Box A
    * Expect Service to be Priority Mail Regional Rate Box A
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Regional Rate Box B
    * Expect Service to be Priority Mail Regional Rate Box B
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Regional Rate Box C
    * Expect Service to be Priority Mail Regional Rate Box C
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Express Package
    * Expect Service to be Priority Mail Express Package
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Express Flat Rate Envelope
    * Expect Service to be Priority Mail Express Flat Rate Envelope
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Expect Service to be Priority Mail Express Padded Flat Rate Envelope
    * Expect Tracking to be USPS Tracking

    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Expect Service to be Priority Mail Express Legal Flat Rate Envelope
    * Expect Tracking to be USPS Tracking

    * Sign out