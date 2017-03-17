Feature:  Orders service Selection

  Background:
    Given a valid user is signed in to Web Apps

  @details_services
  @details_services_dom
  Scenario: service Selections for Domestic Orders
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to address in Zone 1
    Then set Order Details form Ounces to 1

    Then on Order Details form, select service FCM Large Envelope
    Then expect Order Details form service is FCM Large Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Large/Thick Envelope
    Then expect Order Details form service is PM Large/Thick Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Package
    Then expect Order Details form service is PM Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Large Package
    Then expect Order Details form service is PM Large Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Flat Rate Envelope
    Then expect Order Details form service is PM Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then expect Order Details form service is PM Padded Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then expect Order Details form service is PM Legal Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Small Flat Rate Box
    Then expect Order Details form service is PM Small Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Medium Flat Rate Box
    Then expect Order Details form service is PM Medium Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Large Flat Rate Box
    Then expect Order Details form service is PM Large Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Regional Rate Box A
    Then expect Order Details form service is PM Regional Rate Box A

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PM Regional Rate Box B
    Then expect Order Details form service is PM Regional Rate Box B

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PME Package
    Then expect Order Details form service is PME Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PME Flat Rate Envelope
    Then expect Order Details form service is PME Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PME Flat Rate Envelope
    Then expect Order Details form service is PME Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then expect Order Details form service is PME Padded Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then expect Order Details form service is PME Padded Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then expect Order Details form service is PME Legal Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service MM Package
    Then expect Order Details form service is MM Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PSG Package
    Then expect Order Details form service is PSG Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PSG Oversized Package
    Then expect Order Details form service is PSG Oversized Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  @details_services
  @details_services_int
  Scenario: service Selections for International Orders
    Then in Orders Toolbar, click Add button
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Brazil  | random  | random  |
    Then set Order Details form Ounces to 1
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In Brazil, Tariff 1
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then on Order Details form, select service FCMI Large Envelope
    Then expect Order Details form service is FCMI Large Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service FCMI Package
    Then expect Order Details form service is FCMI Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PMI Package
    Then expect Order Details form service is PMI Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PMI Flat Rate Envelope
    Then expect Order Details form service is PMI Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PMI Padded Flat Rate Envelope
    Then expect Order Details form service is PMI Padded Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PMI Legal Flat Rate Envelope
    Then expect Order Details form service is PMI Legal Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PMI Small Flat Rate Box
    Then expect Order Details form service is PMI Small Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PMI Medium Flat Rate Box
    Then expect Order Details form service is PMI Medium Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PMI Large Flat Rate Box
    Then expect Order Details form service is PMI Large Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    #Then on Order Details form, select service PMI Regional Rate Box A
    #Then expect Order Details form service is PMI Regional Rate Box A

    #Then on Order Details form, select service PMI Regional Rate Box B
    #Then expect Order Details form service is PMI Regional Rate Box B

    Then on Order Details form, select service PMEI Package
    Then expect Order Details form service is PMEI Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PMEI Flat Rate Envelope
    Then expect Order Details form service is PMEI Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PMEI Padded Flat Rate Envelope
    Then expect Order Details form service is PMEI Padded Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then on Order Details form, select service PMEI Legal Flat Rate Envelope
    Then expect Order Details form service is PMEI Legal Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then Sign out


