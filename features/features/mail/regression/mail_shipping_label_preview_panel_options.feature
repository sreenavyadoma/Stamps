Feature:Shipping Label Preview Panel 

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_shipping_label_preview_panel_options
  Scenario: Shipping Label Preview Panel

    Then select Print On Shipping Label - 5x8

    Then set Print form Mail-From to default
    Then set print form mail-to Country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    #Then select Print form service Priority Mail Package
    Then select Print form service PM Package
    Then show Advanced Options

    # Hide Label Value Check-box
    Then check Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is checked
    Then uncheck Advanced Options Hide Label Value
    Then expect Advanced Options Hide Label Value is unchecked
    # Print Receipt Check-box
    Then check Advanced Options Print Receipt
    Then expect Advanced Options Print Receipt is checked
    Then uncheck Advanced Options Print Receipt
    Then expect Advanced Options Print Receipt is unchecked
    # Print Reference Check-box
    Then check Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is checked
    Then uncheck Advanced Options Print Reference #
    Then expect Advanced Options Print Reference # is unchecked

    Then set Advanced Options Reference Number to random string
    Then expect Advanced Options Reference Number is correct
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button
    Then sign out

