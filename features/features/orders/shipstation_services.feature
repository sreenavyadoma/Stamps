
  Feature: Domestic USPS service used to fulfill an order.

  Background:
    Given I am signed in to Orders

  @shipstation_services
  Scenario:  ShipStation & Services
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Orders Grid: Check row 1

    Then Order Details: Set Ship-To to address in Zone 1 through 4

    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Expect Service is PM Large Envelope

    Then Order Details: Select Service PM Package
    Then Order Details: Expect Service is PM Package

    Then Order Details: Select Service PM Large Package
    Then Order Details: Expect Service is PM Large Package

    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Expect Service is PM Flat Rate Envelope

    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Expect Service is PM Padded Flat Rate Envelope

    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Expect Service is PM Legal Flat Rate Envelope

    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Expect Service is PM Regional Rate Box A

    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Expect Service is PM Regional Rate Box B

    Then Order Details: Select Service PME Package
    Then Order Details: Expect Service is PME Package

    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Expect Service is PME Flat Rate Envelope

    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Expect Service is PME Padded Flat Rate Envelope

    Then Order Details: Select Service PME Legal Flat Rate Envelope
    Then Order Details: Expect Service is PME Legal Flat Rate Envelope

    Then Sign out

