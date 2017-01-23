Feature:  Orders Service Selection

  Background:
    Given I am signed in to Orders

  @details_services
  @details_services_dom
  Scenario: Service Selections for Domestic Orders
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Set Ounces to 1

    Then Order Details: Select Service FCM Large Envelope
    Then Order Details: Expect Service is FCM Large Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Expect Service is PM Large Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Package
    Then Order Details: Expect Service is PM Package

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Large Package
    Then Order Details: Expect Service is PM Large Package

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Expect Service is PM Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Expect Service is PM Padded Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Expect Service is PM Legal Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Small Flat Rate Box
    Then Order Details: Expect Service is PM Small Flat Rate Box

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Medium Flat Rate Box
    Then Order Details: Expect Service is PM Medium Flat Rate Box

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Large Flat Rate Box
    Then Order Details: Expect Service is PM Large Flat Rate Box

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Expect Service is PM Regional Rate Box A

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Expect Service is PM Regional Rate Box B

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PME Package
    Then Order Details: Expect Service is PME Package

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Expect Service is PME Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Expect Service is PME Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Expect Service is PME Padded Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Expect Service is PME Padded Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PME Legal Flat Rate Envelope
    Then Order Details: Expect Service is PME Legal Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service MM Package
    Then Order Details: Expect Service is MM Package

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PSG Package
    Then Order Details: Expect Service is PSG Package

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PSG Oversized Package
    Then Order Details: Expect Service is PSG Oversized Package

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

  @details_services
  @details_services_int
  Scenario: Service Selections for International Orders
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Brazil  | random  | random  |
    Then Order Details: Set Ounces to 1
    Then Order Details: Add Item 1, Qty 1, ID random, Description random
    Then Order Details: Edit Customs Form
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 1, Origin Brazil, Tariff 1
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form

    Then Order Details: Select Service FCMI Large Envelope
    Then Order Details: Expect Service is FCMI Large Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service FCMI Package
    Then Order Details: Expect Service is FCMI Package

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PMI Package
    Then Order Details: Expect Service is PMI Package

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PMI Flat Rate Envelope
    Then Order Details: Expect Service is PMI Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PMI Padded Flat Rate Envelope
    Then Order Details: Expect Service is PMI Padded Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PMI Legal Flat Rate Envelope
    Then Order Details: Expect Service is PMI Legal Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PMI Small Flat Rate Box
    Then Order Details: Expect Service is PMI Small Flat Rate Box

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PMI Medium Flat Rate Box
    Then Order Details: Expect Service is PMI Medium Flat Rate Box

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PMI Large Flat Rate Box
    Then Order Details: Expect Service is PMI Large Flat Rate Box

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    #Then Order Details: Select Service PMI Regional Rate Box A
    #Then Order Details: Expect Service is PMI Regional Rate Box A

    #Then Order Details: Select Service PMI Regional Rate Box B
    #Then Order Details: Expect Service is PMI Regional Rate Box B

    Then Order Details: Select Service PMEI Package
    Then Order Details: Expect Service is PMEI Package

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PMEI Flat Rate Envelope
    Then Order Details: Expect Service is PMEI Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PMEI Padded Flat Rate Envelope
    Then Order Details: Expect Service is PMEI Padded Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Order Details: Select Service PMEI Legal Flat Rate Envelope
    Then Order Details: Expect Service is PMEI Legal Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Sign out


