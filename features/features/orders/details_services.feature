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

    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Expect Service is Priority Mail Large/Thick Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail Package
    Then Details: Expect Service is Priority Mail Package

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail Large Package
    Then Details: Expect Service is Priority Mail Large Package

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Padded Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Legal Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Expect Service is Priority Mail Small Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail Medium Flat Rate Box
    Then Details: Expect Service is Priority Mail Medium Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail Large Flat Rate Box
    Then Details: Expect Service is Priority Mail Large Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Expect Service is Priority Mail Regional Rate Box A

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Expect Service is Priority Mail Regional Rate Box B

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

    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Expect Service is Parcel Select Ground Package/Flat/Thick Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Parcel Select Ground Oversized Package
    Then Details: Expect Service is Parcel Select Ground Oversized Package

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

    Then Details: Select Service Priority Mail International Package
    Then Details: Expect Service is Priority Mail International Package

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail International Flat Rate Envelope
    Then Details: Expect Service is Priority Mail International Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail International Padded Flat Rate Envelope
    Then Details: Expect Service is Priority Mail International Padded Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail International Legal Flat Rate Envelope
    Then Details: Expect Service is Priority Mail International Legal Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail International Small Flat Rate Box
    Then Details: Expect Service is Priority Mail International Small Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail International Medium Flat Rate Box
    Then Details: Expect Service is Priority Mail International Medium Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Details: Select Service Priority Mail International Large Flat Rate Box
    Then Details: Expect Service is Priority Mail International Large Flat Rate Box

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    #Then Details: Select Service Priority Mail International Regional Rate Box A
    #Then Details: Expect Service is Priority Mail International Regional Rate Box A

    #Then Details: Select Service Priority Mail International Regional Rate Box B
    #Then Details: Expect Service is Priority Mail International Regional Rate Box B

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


