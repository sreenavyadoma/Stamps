
@details_order
Feature: All details tests for order

  Background:
    Given a valid user is signed in to Web Apps

  @details_dimensions_hidden_pm_large_package
  Scenario: Priority Mail and Large Dimensions
    Then add new order
    Then set Order Details Ship-To Domestic address to
      | full_name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |

    Then set Order Details Length to 20
    Then set Order Details Width to 35
    Then set Order Details Height to 20
    Then set Order Details Ounces to 2
    Then set Order Details Pounds to 1
    Then Pause for 2 seconds
    Then expect Order Details service Textbox is enabled
    Then Pause for 1 second
    Then Pause for 1 second
    Then expect Order Details service "PM Package" is enabled
    Then Pause for 1 second
    Then set Order Details service to PM Package
    Then Pause for 2 seconds
    Then expect Order Details Length is 0
    Then expect Order Details Height is 0
    Then expect Order Details Width is 0
    Then Sign out


  @details_edit_order
  Scenario: User edits an order

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 8
    Then set Order Details service to PM Package
    Then set Order Details Ounces to 3
    Then set Order Details Pounds to 2
    Then set Order Details Insure-For to $100.00
    Then expect Order Details Insure-For Cost is greater than $1
    Then expect Order Details Insure-For is 100
    Then set Order Details Height to 1
    Then expect Order Details Height is 1
    Then set Order Details Length to 1
    Then expect Order Details Length is 1
    Then set Order Details Width to 1
    Then expect Order Details Width is 1

    Then set Order Details service to PM Package
    Then set Order Details Ounces to 2
    Then expect Order Details Ounces is 2
    Then set Order Details Pounds to 1
    Then expect Order Details Pounds is 1
    Then set Order Details Insure-For to $150
    Then expect Order Details Insure-For Cost is greater than $1
    Then expect Order Details Insure-For is 150
    Then set Order Details Height to 2
    Then set Order Details Length to 3
    Then set Order Details Width to 4

    Then Sign out


  @details_flat_rate_no_weight_domestic
  Scenario:  Domestic Flat
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1

  # Priority Mail Flat Rate Envelope
    Then set Order Details service to PM Flat Rate Envelope
    Then expect Order Details service is PM Flat Rate Envelope
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Padded Flat Rate Envelope
    Then set Order Details service to PM Padded Flat Rate Envelope
    Then expect Order Details service is PM Padded Flat Rate Envelope
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Legal Flat Rate Envelope
    Then set Order Details service to PM Legal Flat Rate Envelope
    Then expect Order Details service is PM Legal Flat Rate Envelope
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Small Flat Rate Box
    Then set Order Details service to PM Small Flat Rate Box
    Then expect Order Details service is PM Small Flat Rate Box
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Medium Flat Rate Box
    Then set Order Details service to PM Medium Flat Rate Box
    Then expect Order Details service is PM Medium Flat Rate Box
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Large Flat Rate Box
    Then set Order Details service to PM Large Flat Rate Box
    Then expect Order Details service is PM Large Flat Rate Box
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Regional Rate Box A
    Then set Order Details service to PM Regional Rate Box A
    Then expect Order Details service is PM Regional Rate Box A
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail Regional Rate Box B
    Then set Order Details service to PM Regional Rate Box B
    Then expect Order Details service is PM Regional Rate Box B
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME Flat Rate Envelope
    Then set Order Details service to PME Flat Rate Envelope
    Then expect Order Details service is PME Flat Rate Envelope
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail Express
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME Padded Flat Rate Envelope
    Then set Order Details service to PME Padded Flat Rate Envelope
    Then expect Order Details service is PME Padded Flat Rate Envelope
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail Express
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME Legal Flat Rate Envelope
    Then set Order Details service to PME Legal Flat Rate Envelope
    Then expect Order Details service is PME Legal Flat Rate Envelope
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail Express
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then Sign out


  @details_flat_rate_no_weight_international
  Scenario:  International Flat
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | France  | random  | random  |

  # Priority Mail International Flat Rate Envelope
    Then set Order Details service to PMI Flat Rate Envelope
    Then expect Order Details service is PMI Flat Rate Envelope
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail International Padded Flat Rate Envelope
    Then set Order Details service to PMI Padded Flat Rate Envelope
    Then expect Order Details service is PMI Padded Flat Rate Envelope
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail International Legal Flat Rate Envelope
    Then set Order Details service to PMI Legal Flat Rate Envelope
    Then expect Order Details service is PMI Legal Flat Rate Envelope
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail International Small Flat Rate Box
    Then set Order Details service to PMI Small Flat Rate Box
    Then expect Order Details service is PMI Small Flat Rate Box
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail International Medium Flat Rate Box
    Then set Order Details service to PMI Medium Flat Rate Box
    Then expect Order Details service is PMI Medium Flat Rate Box
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # Priority Mail International Large Flat Rate Box
    Then set Order Details service to PMI Large Flat Rate Box
    Then expect Order Details service is PMI Large Flat Rate Box
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME International Flat Rate Envelope
    Then set Order Details service to PMEI Flat Rate Envelope
    Then expect Order Details service is PMEI Flat Rate Envelope
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail Express International
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME International Padded Flat Rate Envelope
    Then set Order Details service to PMEI Padded Flat Rate Envelope
    Then expect Order Details service is PMEI Padded Flat Rate Envelope
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail Express International
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  # PME International Legal Flat Rate Envelope
    Then set Order Details service to PMEI Legal Flat Rate Envelope
    Then expect Order Details service is PMEI Legal Flat Rate Envelope
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details Pounds is 0
    Then expect Order Details Ounces is 0
    Then expect Orders Grid service is Priority Mail Express International
    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then Sign out


  @details_large_dimensions_pm
  Scenario: Priority Mail and Large Dimensions
    Then add new order
    Then expect Order Details service is an empty string
    Then set Order Details Ship-To to random address in zone 8
    Then set Order Details Ounces to 2
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Package
    Then expect Order Details service is PM Package
    Then set Order Details Length to 20
    Then set Order Details Width to 35
    Then set Order Details Height to 20
    Then blur out on Order Details form
    Then blur out on Order Details form
    Then expect Order Details Dimensions are hidden
    Then set Order Details service to PM Package
    Then blur out on Order Details form
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then Pause for 2 seconds
    Then expect Order Details service Textbox is enabled
    Then Pause for 1 second
    Then expect Order Details service is PM Package
    Then Pause for 1 second
    Then expect Order Details service "PM Package" is enabled
    Then Pause for 1 second
    Then set Order Details service to PM Package
    Then Pause for 2 seconds
    Then expect Order Details Length is 1
    Then expect Order Details Height is 1
    Then expect Order Details Width is 1
    Then Sign out


  @details_non_integer_lb
  Scenario: User edits an order

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 5 and 8
    Then set Order Details service to PM Flat Rate Envelope
    Then set Order Details Pounds to 3.5
    Then expect Order Details Pounds is 3
    Then set Order Details Pounds to 2.0
    Then expect Order Details Pounds is 2
    Then set Order Details Ounces to 6.0
    Then expect Order Details Ounces is 6.0
    Then Sign out


  @details_panel
  Scenario: B-01995 When Details Panel is Collapsed, Add Button Should Expand it
    Then add new order
    #Then on Order Details form, Collapse Panel
    Then add new order
    Then expect Order Details Panel is present

    Then add new order
    Then on Order Details form, Collapse Panel
    Then on Order Details form, Expand panel
    Then expect Order Details Panel is present

  @details_reference_no
  Scenario: Reference Number
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PM Large/Thick Envelope
    Then set Order Details Ounces to 2

    Then set Order Details Reference Number to random
    Then expect Order Details Reference Number is correct

    Then set Order Details Reference Number to details_reference_no
    Then expect Order Details Reference Number is details_reference_no

    Then click Orders Toolbar Print button
    Then in Print modal, uncheck Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then click print modal print button
    Then Sign out


  @details_services
  @details_services_dom
  Scenario: service Selections for Domestic Orders
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1
    Then set Order Details Ounces to 1

    Then set Order Details service to FCM Large Envelope/Flat
    Then expect Order Details service is FCM Large Envelope/Flat

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Large/Thick Envelope
    Then expect Order Details service is PM Large/Thick Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Package
    Then expect Order Details service is PM Package

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Large Package
    Then expect Order Details service is PM Large Package

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Flat Rate Envelope
    Then expect Order Details service is PM Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Padded Flat Rate Envelope
    Then expect Order Details service is PM Padded Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Legal Flat Rate Envelope
    Then expect Order Details service is PM Legal Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Small Flat Rate Box
    Then expect Order Details service is PM Small Flat Rate Box

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Medium Flat Rate Box
    Then expect Order Details service is PM Medium Flat Rate Box

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Large Flat Rate Box
    Then expect Order Details service is PM Large Flat Rate Box

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Regional Rate Box A
    Then expect Order Details service is PM Regional Rate Box A

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PM Regional Rate Box B
    Then expect Order Details service is PM Regional Rate Box B

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PME Package/Flat/Thick Envelope
    Then expect Order Details service is PME Package/Flat/Thick Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PME Flat Rate Envelope
    Then expect Order Details service is PME Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PME Flat Rate Envelope
    Then expect Order Details service is PME Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PME Padded Flat Rate Envelope
    Then expect Order Details service is PME Padded Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PME Padded Flat Rate Envelope
    Then expect Order Details service is PME Padded Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PME Legal Flat Rate Envelope
    Then expect Order Details service is PME Legal Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to MM Package/Flat/Thick Envelope
    Then expect Order Details service is MM Package/Flat/Thick Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PSG Package/Flat/Thick Envelope
    Then expect Order Details service is PSG Package/Flat/Thick Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PSG Oversized Package
    Then expect Order Details service is PSG Oversized Package

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

  @details_services
  @details_services_int
  Scenario: service Selections for International Orders
    Then add new order
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Brazil  | random  | random  |
    Then set Order Details Ounces to 1
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 1, Made In Brazil, Tariff 1
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then set Order Details service to FCMI Large Envelope/Flat
    Then expect Order Details service is FCMI Large Envelope/Flat

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to FCMI Package/Thick Envelope
    Then expect Order Details service is FCMI Package/Thick Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PMI Package/Flat/Thick Envelope
    Then expect Order Details service is PMI Package/Flat/Thick Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PMI Flat Rate Envelope
    Then expect Order Details service is PMI Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PMI Padded Flat Rate Envelope
    Then expect Order Details service is PMI Padded Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PMI Legal Flat Rate Envelope
    Then expect Order Details service is PMI Legal Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PMI Small Flat Rate Box
    Then expect Order Details service is PMI Small Flat Rate Box

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PMI Medium Flat Rate Box
    Then expect Order Details service is PMI Medium Flat Rate Box

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PMI Large Flat Rate Box
    Then expect Order Details service is PMI Large Flat Rate Box

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    #Then set Order Details service to PMI Regional Rate Box A
    #Then expect Order Details service is PMI Regional Rate Box A

    #Then set Order Details service to PMI Regional Rate Box B
    #Then expect Order Details service is PMI Regional Rate Box B

    Then set Order Details service to PMEI Package/Flat/Thick Envelope
    Then expect Order Details service is PMEI Package/Flat/Thick Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PMEI Flat Rate Envelope
    Then expect Order Details service is PMEI Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PMEI Padded Flat Rate Envelope
    Then expect Order Details service is PMEI Padded Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then set Order Details service to PMEI Legal Flat Rate Envelope
    Then expect Order Details service is PMEI Legal Flat Rate Envelope

    Then click Orders Toolbar Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then Sign out


  @details_ship_cost_total
  Scenario: Ship Cost Total
    Then add new order
    Then expect Order Details Total label is Total Ship Cost:
    Then set Order Details Ship-From to default
    Then expect Order Details Service Cost is 0.00
    Then expect Order Details Insure-For Cost is 0.00
    Then expect Order Details Tracking Cost is 0.00
    Then expect Order Details Total Ship Cost is 0.00

    Then set Order Details Ship-To to random address in zone 8
    Then set Order Details service to PM Package
    Then set Order Details Ounces to 1
    Then set Order Details Pounds to 1
    # Then set Order Details Tracking to Signature Required
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1

    Then expect Order Details Service Cost is greater than $1.00
    Then expect Order Details Tracking Cost is greater than $1.00
    Then expect Order Details Ship Cost Total is correct

    Then Sign out