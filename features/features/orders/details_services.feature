Feature:  Orders Service Selection

  Background:
    Given I am signed in to Orders

  @details_services
  Scenario:  Orders Service Selection
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Set Ounces to 1

    Then Details: Select Service First-Class Mail Large Envelope/Flat
    Then Details: Expect Service is First-Class Mail Large Envelope/Flat

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Large/Thick Envelope
    Then Details: Expect Service is PM Large/Thick Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Package
    Then Details: Expect Service is PM Package

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Large Package
    Then Details: Expect Service is PM Large Package

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Flat Rate Envelope
    Then Details: Expect Service is PM Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Padded Flat Rate Envelope
    Then Details: Expect Service is PM Padded Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Legal Flat Rate Envelope
    Then Details: Expect Service is PM Legal Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Small Flat Rate Box
    Then Details: Expect Service is PM Small Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Medium Flat Rate Box
    Then Details: Expect Service is PM Medium Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Large Flat Rate Box
    Then Details: Expect Service is PM Large Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Regional Rate Box A
    Then Details: Expect Service is PM Regional Rate Box A

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM Regional Rate Box B
    Then Details: Expect Service is PM Regional Rate Box B

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PME Package
    Then Details: Expect Service is PME Package

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PME Flat Rate Envelope
    Then Details: Expect Service is PME Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PME Flat Rate Envelope
    Then Details: Expect Service is PME Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PME Padded Flat Rate Envelope
    Then Details: Expect Service is PME Padded Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PME Padded Flat Rate Envelope
    Then Details: Expect Service is PME Padded Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PME Legal Flat Rate Envelope
    Then Details: Expect Service is PME Legal Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Media Mail Package/Flat/Thick Envelope
    Then Details: Expect Service is Media Mail Package/Flat/Thick Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PSG Package
    Then Details: Expect Service is PSG Package

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PSG Oversized Package
    Then Details: Expect Service is PSG Oversized Package

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # International
    Then Toolbar: Add

    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Brazil  | random  | random  |
    Then Details: Set Ounces to 1
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Origin Brazil, Tariff 1
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal

    Then Details: Select Service First-Class Mail International Large Envelope/Flat
    Then Details: Expect Service is First-Class Mail International Large Envelope/Flat

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service First-Class Mail International Package/Thick Envelope
    Then Details: Expect Service is First-Class Mail International Package/Thick Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM International Package
    Then Details: Expect Service is PM International Package

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM International Flat Rate Envelope
    Then Details: Expect Service is PM International Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM International Padded Flat Rate Envelope
    Then Details: Expect Service is PM International Padded Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM International Legal Flat Rate Envelope
    Then Details: Expect Service is PM International Legal Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM International Small Flat Rate Box
    Then Details: Expect Service is PM International Small Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM International Medium Flat Rate Box
    Then Details: Expect Service is PM International Medium Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PM International Large Flat Rate Box
    Then Details: Expect Service is PM International Large Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    #Then Details: Select Service PM International Regional Rate Box A
    #Then Details: Expect Service is PM International Regional Rate Box A

    #Then Details: Select Service PM International Regional Rate Box B
    #Then Details: Expect Service is PM International Regional Rate Box B

    Then Details: Select Service PME International Package/Flat/Thick Envelope
    Then Details: Expect Service is PME International Package/Flat/Thick Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PME International Flat Rate Envelope
    Then Details: Expect Service is PME International Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PME International Padded Flat Rate Envelope
    Then Details: Expect Service is PME International Padded Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service PME International Legal Flat Rate Envelope
    Then Details: Expect Service is PME International Legal Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Sign out


