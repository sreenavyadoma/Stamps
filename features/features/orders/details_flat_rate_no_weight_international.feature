Feature: Don't Require weight for Flat/Regional Rate Services
  We should not require a weight value when the selected Service includes "Flat Rate" or "Regional Rate" in the name.

  Priority Mail International Flat Rate Envelope
  Priority Mail International Padded Flat Rate Envelope
  Priority Mail International Legal Flat Rate Envelope
  Priority Mail International Small Flat Rate Box
  Priority Mail International Medium Flat Rate Box
  Priority Mail International Large Flat Rate Box
  Priority Mail Express International Flat Rate Envelope
  Priority Mail Express International Padded Flat Rate Envelope
  Priority Mail Express International Legal Flat Rate Envelope

  Background:
    Given I am signed in to Orders

  @details_flat_rate_no_weight_international
  Scenario:  International Flat
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | France  | random  | random  |


    # Priority Mail International Flat Rate Envelope
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail International Flat Rate Envelope"
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 0
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Expect Pounds to be 0
    Then Details: Expect Ounces to be 0
    Then Grid: Expect Service to be Priority Mail International
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail International Padded Flat Rate Envelope
    Then Details: Set Service to "Priority Mail International Padded Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail International Padded Flat Rate Envelope"
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 0
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Expect Pounds to be 0
    Then Details: Expect Ounces to be 0
    Then Grid: Expect Service to be Priority Mail International
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail International Legal Flat Rate Envelope
    Then Details: Set Service to "Priority Mail International Legal Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail International Legal Flat Rate Envelope"
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 0
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Expect Pounds to be 0
    Then Details: Expect Ounces to be 0
    Then Grid: Expect Service to be Priority Mail International
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail International Small Flat Rate Box
    Then Details: Set Service to "Priority Mail International Small Flat Rate Box"
    Then Details: Expect Service to be "Priority Mail International Small Flat Rate Box"
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 0
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Expect Pounds to be 0
    Then Details: Expect Ounces to be 0
    Then Grid: Expect Service to be Priority Mail International
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail International Medium Flat Rate Box
    Then Details: Set Service to "Priority Mail International Medium Flat Rate Box"
    Then Details: Expect Service to be "Priority Mail International Medium Flat Rate Box"
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 0
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Expect Pounds to be 0
    Then Details: Expect Ounces to be 0
    Then Grid: Expect Service to be Priority Mail International
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail International Large Flat Rate Box
    Then Details: Set Service to "Priority Mail International Large Flat Rate Box"
    Then Details: Expect Service to be "Priority Mail International Large Flat Rate Box"
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 0
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Expect Pounds to be 0
    Then Details: Expect Ounces to be 0
    Then Grid: Expect Service to be Priority Mail International
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Express International Flat Rate Envelope
    Then Details: Set Service to "Priority Mail Express International Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail Express International Flat Rate Envelope"
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 0
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Expect Pounds to be 0
    Then Details: Expect Ounces to be 0
    Then Grid: Expect Service to be Priority Mail Express International
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Express International Padded Flat Rate Envelope
    Then Details: Set Service to "Priority Mail Express International Padded Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail Express International Padded Flat Rate Envelope"
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 0
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Expect Pounds to be 0
    Then Details: Expect Ounces to be 0
    Then Grid: Expect Service to be Priority Mail Express International
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    # Priority Mail Express International Legal Flat Rate Envelope
    Then Details: Set Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Details: Expect Service to be "Priority Mail Express International Legal Flat Rate Envelope"
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 0, Oz 1 Origin United States, Tariff 0
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Expect Pounds to be 0
    Then Details: Expect Ounces to be 0
    Then Grid: Expect Service to be Priority Mail Express International
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Close Modal

    Then Sign out
