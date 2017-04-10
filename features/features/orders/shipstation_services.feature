
  Feature: Domestic USPS service used to fulfill an order.

  Background:
    Given a valid user is signed in to Web Apps

  @shipstation_services
  Scenario:  ShipStation & Services
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo, CA
    Then check Orders Grid row 1

    Then set Order Details form Ship-To to random address between zone 1 and 4

    Then set Order Details form service to PM Large/Thick Envelope
    Then expect Order Details form service is PM Large/Thick Envelope

    Then set Order Details form service to PM Package
    Then expect Order Details form service is PM Package

    Then set Order Details form service to PM Large Package
    Then expect Order Details form service is PM Large Package

    Then set Order Details form service to PM Flat Rate Envelope
    Then expect Order Details form service is PM Flat Rate Envelope

    Then set Order Details form service to PM Padded Flat Rate Envelope
    Then expect Order Details form service is PM Padded Flat Rate Envelope

    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then expect Order Details form service is PM Legal Flat Rate Envelope

    Then set Order Details form service to PM Regional Rate Box A
    Then expect Order Details form service is PM Regional Rate Box A

    Then set Order Details form service to PM Regional Rate Box B
    Then expect Order Details form service is PM Regional Rate Box B

    Then set Order Details form service to PME Package
    Then expect Order Details form service is PME Package

    Then set Order Details form service to PME Flat Rate Envelope
    Then expect Order Details form service is PME Flat Rate Envelope

    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then expect Order Details form service is PME Padded Flat Rate Envelope

    Then set Order Details form service to PME Legal Flat Rate Envelope
    Then expect Order Details form service is PME Legal Flat Rate Envelope

    Then Sign out

