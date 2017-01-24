Feature: Extra Services BVT

  Background:
    Given I am signed in as Mail shipper

  @mail_bvt_extra_services
  Scenario: Extra Services

    Then Mail: Select Shipping Label - 5 ½” x 8 ½”
    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to Random Address Between Zone 1 through 4
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select service Priority Mail Padded Flat Rate Envelope
    Then Mail Shipping Labels: Set Hide Mail Value to Unchecked

    Then Mail: Open Extra Servicess
    Then Mail Extra Services: Set Security to Registered Mail
    Then Mail Extra Services: Set Security Value to $100
    Then Mail Extra Services: Set Return Receipt to Checked
    Then Mail Extra Services: Set COD to $20
    Then Mail Extra Services: Set Handling to Normal
    #Then Mail Extra Services: Set Non-Rectangular to Checked
    Then Mail Extra Services: Click Save
    Then Mail: Open Print Modal
    Then Mail In Print modal, select Printer "factory"
    Then Mail In Print modal, click Print button
    Then Sign out

