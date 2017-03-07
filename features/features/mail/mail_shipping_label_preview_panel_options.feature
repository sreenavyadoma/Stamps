Feature:Shipping Label Preview Panel 



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_preview_panel_options
  Scenario: Shipping Label Preview Panel

    Then select Print On Shipping Label - 5 ½" x 8 ½"

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Package
    Then set Shipping Label Print form Hide Mail Value to Checked
    Then set Shipping Label Print form Hide Mail Value to Unchecked
    Then set Shipping Label Print form Print Reference Number to Checked
    Then set Shipping Label Print form Print Reference Number to Unchecked
    Then set Shipping Label Print form Print Receipt to Checked
    Then set Shipping Label Print form Print Receipt to Unchecked
    Then set Shipping Label Print form Reference Number to test12435
    Then set Shipping Label Print form Cost Code to None
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out

