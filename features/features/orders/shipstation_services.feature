
  Feature: Domestic USPS service used to fulfill an order.

  Background:
    Given I am signed in to Orders

  @shipstation_services
  Scenario:  ShipStation & Services
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Grid: Check row 1

    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields

    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Expect Service to be Priority Mail Large/Thick Envelope

    Then Details: Select Service Priority Mail Package
    Then Details: Expect Service to be Priority Mail Package

    Then Details: Select Service Priority Mail Large Package
    Then Details: Expect Service to be Priority Mail Large Package

    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Expect Service to be Priority Mail Flat Rate Envelope

    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Expect Service to be Priority Mail Padded Flat Rate Envelope

    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Expect Service to be Priority Mail Legal Flat Rate Envelope

    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Expect Service to be Priority Mail Regional Rate Box A

    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Expect Service to be Priority Mail Regional Rate Box B

    Then Details: Select Service Priority Mail Express Package
    Then Details: Expect Service to be Priority Mail Express Package

    Then Details: Select Service Priority Mail Express Flat Rate Envelope
    Then Details: Expect Service to be Priority Mail Express Flat Rate Envelope

    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Expect Service to be Priority Mail Express Padded Flat Rate Envelope

    Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    Then Details: Expect Service to be Priority Mail Express Legal Flat Rate Envelope

    Then Sign out

