
Feature: Tracking

  Background:
    Given a valid user is signed in to Web Apps

  @tracking_defaults
  Scenario:  Print - First-Class Mail Envelope
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA

    Then set order details ship-to to random address in zone 1
    Then set order details ship-to to random address in zone 1

    #Then set order details service to PME Flat Rate Envelope
    #Then expect Order Details service is PME Flat Rate Envelope
    #Then expect order details tracking is USPS Tracking

    #Then set order details service to PME Padded Flat Rate Envelope
    #Then expect Order Details service is PME Padded Flat Rate Envelope
    #Then expect order details tracking is USPS Tracking

    #Then set order details service to PME Legal Flat Rate Envelope
    #Then expect Order Details service is PME Legal Flat Rate Envelope
    #Then expect order details tracking is USPS Tracking

    #Then set order details service to PME Package/Flat/Thick Envelope
    #Then expect Order Details service is "PME Package/Flat/Thick Envelope"
    #Then expect order details tracking is USPS Tracking

    Then set order details service to PM Large/Thick Envelope
    Then expect Order Details service is PM Large/Thick Envelope
    Then expect order details tracking is USPS Tracking

    Then set order details service to PM Package
    Then expect Order Details service is PM Package
    Then expect order details tracking is USPS Tracking

    Then set order details service to PM Large Package
    Then expect Order Details service is PM Large Package
    Then expect order details tracking is USPS Tracking

    Then set order details service to PM Flat Rate Envelope
    Then expect Order Details service is PM Flat Rate Envelope
    Then expect order details tracking is USPS Tracking

    Then set order details service to PM Padded Flat Rate Envelope
    Then expect Order Details service is PM Padded Flat Rate Envelope
    Then expect order details tracking is USPS Tracking

    Then set order details service to PM Legal Flat Rate Envelope
    Then expect Order Details service is PM Legal Flat Rate Envelope
    Then expect order details tracking is USPS Tracking

    Then set order details service to PM Regional Rate Box A
    Then expect Order Details service is PM Regional Rate Box A
    Then expect order details tracking is USPS Tracking

    Then set order details service to PM Regional Rate Box B
    Then expect Order Details service is PM Regional Rate Box B
    Then expect order details tracking is USPS Tracking

    Then sign out