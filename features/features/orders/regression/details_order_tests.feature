
@details_order
Feature: All details tests for order

  Background:
    Given a valid user is signed in to Web Apps

  @details_dimensions_hidden_pm_large_package
  Scenario: Priority Mail and Large Dimensions
    Then add new order
    Then set Order Details form Ship-To Domestic address to
      | full_name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |

    Then set Order Details form Length to 20
    Then set Order Details form Width to 35
    Then set Order Details form Height to 20
    Then set Order Details form Ounces to 2
    Then set Order Details form Pounds to 1
    Then Pause for 2 seconds
    Then expect Order Details form service Textbox is enabled
    Then Pause for 1 second
    Then Pause for 1 second
    Then expect Order Details form service "PM Package" is enabled
    Then Pause for 1 second
    Then set Order Details form service to PM Package
    Then Pause for 2 seconds
    Then expect Order Details form Length is 0
    Then expect Order Details form Height is 0
    Then expect Order Details form Width is 0
    Then Sign out


  @details_edit_order
  Scenario: User edits an order

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 3
    Then set Order Details form Pounds to 2
    Then set Order Details form Insure-For to $100.00
    Then expect Order Details form Insure-For Cost is greater than $1
    Then expect Order Details form Insure-For is 100
    Then set Order Details form Height to 1
    Then expect Order Details form Height is 1
    Then set Order Details form Length to 1
    Then expect Order Details form Length is 1
    Then set Order Details form Width to 1
    Then expect Order Details form Width is 1

    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 2
    Then expect Order Details form Ounces is 2
    Then set Order Details form Pounds to 1
    Then expect Order Details form Pounds is 1
    Then set Order Details form Insure-For to $150
    Then expect Order Details form Insure-For Cost is greater than $1
    Then expect Order Details form Insure-For is 150
    Then set Order Details form Height to 2
    Then set Order Details form Length to 3
    Then set Order Details form Width to 4

    Then Sign out


  @details_flat_rate_no_weight_domestic
  Scenario:  Domestic Flat
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address in zone 1

  # Priority Mail Flat Rate Envelope
    Then set Order Details form service to PM Flat Rate Envelope
    Then expect Order Details form service is PM Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Padded Flat Rate Envelope
    Then set Order Details form service to PM Padded Flat Rate Envelope
    Then expect Order Details form service is PM Padded Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Legal Flat Rate Envelope
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then expect Order Details form service is PM Legal Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Small Flat Rate Box
    Then set Order Details form service to PM Small Flat Rate Box
    Then expect Order Details form service is PM Small Flat Rate Box
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Medium Flat Rate Box
    Then set Order Details form service to PM Medium Flat Rate Box
    Then expect Order Details form service is PM Medium Flat Rate Box
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Large Flat Rate Box
    Then set Order Details form service to PM Large Flat Rate Box
    Then expect Order Details form service is PM Large Flat Rate Box
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Regional Rate Box A
    Then set Order Details form service to PM Regional Rate Box A
    Then expect Order Details form service is PM Regional Rate Box A
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Regional Rate Box B
    Then set Order Details form service to PM Regional Rate Box B
    Then expect Order Details form service is PM Regional Rate Box B
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME Flat Rate Envelope
    Then set Order Details form service to PME Flat Rate Envelope
    Then expect Order Details form service is PME Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME Padded Flat Rate Envelope
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then expect Order Details form service is PME Padded Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME Legal Flat Rate Envelope
    Then set Order Details form service to PME Legal Flat Rate Envelope
    Then expect Order Details form service is PME Legal Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then Sign out


  @details_flat_rate_no_weight_international
  Scenario:  International Flat
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | France  | random  | random  |

  # Priority Mail International Flat Rate Envelope
    Then set Order Details form service to PMI Flat Rate Envelope
    Then expect Order Details form service is PMI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail International Padded Flat Rate Envelope
    Then set Order Details form service to PMI Padded Flat Rate Envelope
    Then expect Order Details form service is PMI Padded Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail International Legal Flat Rate Envelope
    Then set Order Details form service to PMI Legal Flat Rate Envelope
    Then expect Order Details form service is PMI Legal Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail International Small Flat Rate Box
    Then set Order Details form service to PMI Small Flat Rate Box
    Then expect Order Details form service is PMI Small Flat Rate Box
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail International Medium Flat Rate Box
    Then set Order Details form service to PMI Medium Flat Rate Box
    Then expect Order Details form service is PMI Medium Flat Rate Box
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail International Large Flat Rate Box
    Then set Order Details form service to PMI Large Flat Rate Box
    Then expect Order Details form service is PMI Large Flat Rate Box
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME International Flat Rate Envelope
    Then set Order Details form service to PMEI Flat Rate Envelope
    Then expect Order Details form service is PMEI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME International Padded Flat Rate Envelope
    Then set Order Details form service to PMEI Padded Flat Rate Envelope
    Then expect Order Details form service is PMEI Padded Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME International Legal Flat Rate Envelope
    Then set Order Details form service to PMEI Legal Flat Rate Envelope
    Then expect Order Details form service is PMEI Legal Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then Sign out


  @details_large_dimensions_pm
  Scenario: Priority Mail and Large Dimensions
    * add new order
    * expect Order Details form service is an empty string
    * set Order Details form Ship-To to random address in zone 8
    * set Order Details form Ounces to 2
    * set Order Details form Pounds to 1
    * set Order Details form service to PM Package
    * expect Order Details form service is PM Package
    * set Order Details form Length to 20
    * set Order Details form Width to 35
    * set Order Details form Height to 20
    * blur out on Order Details form
    * blur out on Order Details form
    * expect Order Details form Dimensions are hidden
    * set Order Details form service to PM Package
    * blur out on Order Details form
    * set Order Details form Length to 1
    * set Order Details form Width to 1
    * set Order Details form Height to 1
    * Pause for 2 seconds
    * expect Order Details form service Textbox is enabled
    * Pause for 1 second
    * expect Order Details form service is PM Package
    * Pause for 1 second
    * expect Order Details form service "PM Package" is enabled
    * Pause for 1 second
    * set Order Details form service to PM Package
    * Pause for 2 seconds
    * expect Order Details form Length is 1
    * expect Order Details form Height is 1
    * expect Order Details form Width is 1
    * Sign out


  @details_non_integer_lb
  Scenario: User edits an order

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 5 and 8
    Then set Order Details form service to PM Flat Rate Envelope
    Then set Order Details form Pounds to 3.5
    Then expect Order Details form Pounds is 3
    Then set Order Details form Pounds to 2.0
    Then expect Order Details form Pounds is 2
    Then set Order Details form Ounces to 6.0
    Then expect Order Details form Ounces is 6.0
    Then Sign out


  @details_panel
  Scenario: B-01995 When Details Panel is Collapsed, Add Button Should Expand it
    Then add new order
    Then on Order Details form, Collapse Panel
    Then add new order
    Then expect Order Details form Panel is present

    Then add new order
    Then on Order Details form, Collapse Panel
    Then on Order Details form, Expand panel
    Then expect Order Details form Panel is present


  @details_reference_no
  Scenario: Reference Number
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Large/Thick Envelope
    Then set Order Details form Ounces to 2

    Then set Order Details form Reference Number to random
    Then expect Order Details form Reference Number is correct

    Then set Order Details form Reference Number to Rob
    Then expect Order Details form Reference Number is Rob

    Then in Orders Toolbar, click Print button
    Then in Print modal, uncheck Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"
    Then click print modal print button
    Then Sign out


  @details_services
  @details_services_dom
  Scenario: service Selections for Domestic Orders
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form Ounces to 1

    Then set Order Details form service to FCM Large Envelope
    Then expect Order Details form service is FCM Large Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Large/Thick Envelope
    Then expect Order Details form service is PM Large/Thick Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Package
    Then expect Order Details form service is PM Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Large Package
    Then expect Order Details form service is PM Large Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Flat Rate Envelope
    Then expect Order Details form service is PM Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Padded Flat Rate Envelope
    Then expect Order Details form service is PM Padded Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then expect Order Details form service is PM Legal Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Small Flat Rate Box
    Then expect Order Details form service is PM Small Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Medium Flat Rate Box
    Then expect Order Details form service is PM Medium Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Large Flat Rate Box
    Then expect Order Details form service is PM Large Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Regional Rate Box A
    Then expect Order Details form service is PM Regional Rate Box A

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PM Regional Rate Box B
    Then expect Order Details form service is PM Regional Rate Box B

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PME Package
    Then expect Order Details form service is PME Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PME Flat Rate Envelope
    Then expect Order Details form service is PME Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PME Flat Rate Envelope
    Then expect Order Details form service is PME Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then expect Order Details form service is PME Padded Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then expect Order Details form service is PME Padded Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PME Legal Flat Rate Envelope
    Then expect Order Details form service is PME Legal Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to MM Package
    Then expect Order Details form service is MM Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PSG Package
    Then expect Order Details form service is PSG Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PSG Oversized Package
    Then expect Order Details form service is PSG Oversized Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  @details_services
  @details_services_int
  Scenario: service Selections for International Orders
    Then add new order
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Brazil  | random  | random  |
    Then set Order Details form Ounces to 1
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In Brazil, Tariff 1
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then set Order Details form service to FCMI Large Envelope
    Then expect Order Details form service is FCMI Large Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to FCMI Package
    Then expect Order Details form service is FCMI Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PMI Package
    Then expect Order Details form service is PMI Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PMI Flat Rate Envelope
    Then expect Order Details form service is PMI Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PMI Padded Flat Rate Envelope
    Then expect Order Details form service is PMI Padded Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PMI Legal Flat Rate Envelope
    Then expect Order Details form service is PMI Legal Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PMI Small Flat Rate Box
    Then expect Order Details form service is PMI Small Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PMI Medium Flat Rate Box
    Then expect Order Details form service is PMI Medium Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PMI Large Flat Rate Box
    Then expect Order Details form service is PMI Large Flat Rate Box

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    #Then set Order Details form service to PMI Regional Rate Box A
    #Then expect Order Details form service is PMI Regional Rate Box A

    #Then set Order Details form service to PMI Regional Rate Box B
    #Then expect Order Details form service is PMI Regional Rate Box B

    Then set Order Details form service to PMEI Package
    Then expect Order Details form service is PMEI Package

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PMEI Flat Rate Envelope
    Then expect Order Details form service is PMEI Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PMEI Padded Flat Rate Envelope
    Then expect Order Details form service is PMEI Padded Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details form service to PMEI Legal Flat Rate Envelope
    Then expect Order Details form service is PMEI Legal Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then Sign out


  @details_ship_cost_total
  Scenario: Ship Cost Total
    Then add new order
    Then expect Order Details form Total label is Total Ship Cost:
    Then set Order Details form Ship-From to default
    Then expect Order Details form Service Cost is 0.00
    Then expect Order Details form Insure-For Cost is 0.00
    Then expect Order Details form Tracking Cost is 0.00
    Then expect Order Details form Total Ship Cost is 0.00

    Then set Order Details form Ship-To to random address in zone 8
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1
    Then set Order Details form Pounds to 1
    Then set Order Details form Tracking to Signature Required
    Then set Order Details form Length to 1
    Then set Order Details form Width to 1
    Then set Order Details form Height to 1

    Then expect Order Details form Service Cost is greater than $1.00
    Then expect Order Details form Tracking Cost is greater than $1.00
    Then expect Order Details form Ship Cost Total is correct

    Then Sign out