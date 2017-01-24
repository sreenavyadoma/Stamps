Feature:  Orders service Selection

  Background:
    Given A user is signed in to Orders

  @details_services
  @details_services_dom
  Scenario: service Selections for Domestic Orders
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1
    Then On Order Details form, set Ounces to 1

    Then On Order Details form, select service FCM Large Envelope
    Then On Order Details form, expect service is FCM Large Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Large Envelope
    Then On Order Details form, expect service is PM Large Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Package
    Then On Order Details form, expect service is PM Package

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Large Package
    Then On Order Details form, expect service is PM Large Package

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, expect service is PM Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Padded Flat Rate Envelope
    Then On Order Details form, expect service is PM Padded Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Legal Flat Rate Envelope
    Then On Order Details form, expect service is PM Legal Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Small Flat Rate Box
    Then On Order Details form, expect service is PM Small Flat Rate Box

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Medium Flat Rate Box
    Then On Order Details form, expect service is PM Medium Flat Rate Box

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Large Flat Rate Box
    Then On Order Details form, expect service is PM Large Flat Rate Box

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Regional Rate Box A
    Then On Order Details form, expect service is PM Regional Rate Box A

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PM Regional Rate Box B
    Then On Order Details form, expect service is PM Regional Rate Box B

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PME Package
    Then On Order Details form, expect service is PME Package

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PME Flat Rate Envelope
    Then On Order Details form, expect service is PME Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PME Flat Rate Envelope
    Then On Order Details form, expect service is PME Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, expect service is PME Padded Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, expect service is PME Padded Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PME Legal Flat Rate Envelope
    Then On Order Details form, expect service is PME Legal Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service MM Package
    Then On Order Details form, expect service is MM Package

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PSG Package
    Then On Order Details form, expect service is PSG Package

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PSG Oversized Package
    Then On Order Details form, expect service is PSG Oversized Package

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

  @details_services
  @details_services_int
  Scenario: service Selections for International Orders
    Then In Orders Toolbar, click Add button
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Brazil  | random  | random  |
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin Brazil, Tariff 1
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button

    Then On Order Details form, select service FCMI Large Envelope
    Then On Order Details form, expect service is FCMI Large Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service FCMI Package
    Then On Order Details form, expect service is FCMI Package

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PMI Package
    Then On Order Details form, expect service is PMI Package

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PMI Flat Rate Envelope
    Then On Order Details form, expect service is PMI Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PMI Padded Flat Rate Envelope
    Then On Order Details form, expect service is PMI Padded Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PMI Legal Flat Rate Envelope
    Then On Order Details form, expect service is PMI Legal Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PMI Small Flat Rate Box
    Then On Order Details form, expect service is PMI Small Flat Rate Box

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PMI Medium Flat Rate Box
    Then On Order Details form, expect service is PMI Medium Flat Rate Box

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PMI Large Flat Rate Box
    Then On Order Details form, expect service is PMI Large Flat Rate Box

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    #Then On Order Details form, select service PMI Regional Rate Box A
    #Then On Order Details form, expect service is PMI Regional Rate Box A

    #Then On Order Details form, select service PMI Regional Rate Box B
    #Then On Order Details form, expect service is PMI Regional Rate Box B

    Then On Order Details form, select service PMEI Package
    Then On Order Details form, expect service is PMEI Package

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PMEI Flat Rate Envelope
    Then On Order Details form, expect service is PMEI Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PMEI Padded Flat Rate Envelope
    Then On Order Details form, expect service is PMEI Padded Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then On Order Details form, select service PMEI Legal Flat Rate Envelope
    Then On Order Details form, expect service is PMEI Legal Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then Sign out


