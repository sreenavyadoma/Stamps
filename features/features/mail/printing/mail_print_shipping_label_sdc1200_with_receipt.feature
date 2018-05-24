
@mail_print_shipping_label_sdc1200_with_receipt
Feature: Mail Shipping Label - SDC-1200 with receipt

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_sdc1200
  Scenario: Shipping Label - sdc1200 regular

   #mail_print_shipping_label_sdc1200_regular
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then show Advanced Options
    Then check Advanced Options Print Receipt
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

   #mail_print_shipping_label_sdc1200_fpo
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set print form mail-to to address FPO Label, random company, UNIT 100100 BOX 4 120, FPO, AP 96691
    Then set Print form Ounces to 1
    Then select print form service FCM Package/Thick Envelope
    Then click Print form Edit Customs Form button
    Then add Customs Associated Item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then show Advanced Options
    Then check Advanced Options Print Receipt
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    #mail_print_shipping_label_sdc1200_cn22
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set Print form Ship-To to international address
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone  |
      | cn22   | random  | random           | random            | random | random   | 12366      | India  | random |
    Then set Print form Ounces to 1
    Then select print form service FCMI Package/Thick Envelope
    Then click Print form Edit Customs Form button
    Then add Customs Associated Item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then show Advanced Options
    Then check Advanced Options Print Receipt
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

     #mail_print_shipping_label_sdc1200_cn72
    Then select print on Shipping Label - SDC-1200
    Then set Print form Mail-From to default
    Then set Print form Ship-To to international address
      | name   | company | street_address_1 | street_address_2  | city   | province | postal_code | country| phone  |
      | cn72   | random  | random           | random            | random | random   | 78954      | India  | random  |
    Then set Print form Ounces to 1
    Then select print form service PMI Package/Flat/Thick Envelope
    Then click Print form Edit Customs Form button
    Then add Customs Associated Item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then show Advanced Options
    Then check Advanced Options Print Receipt
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then sign out