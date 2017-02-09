Feature: Extra Services BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_extra_services
  Scenario: Extra Services

    Then on Shipping Label Print form, select Shipping Label - 5 ½” x 8 ½”
    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to Random Address Between Zone 1 through 4
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Shipping Label Print form, select service Priority Mail Padded Flat Rate Envelope
    Then on Shipping Label Print form, set Hide Mail Value to Unchecked

    Then Mail: Open Extra Servicess
    Then Mail Extra Services: Set Security to Registered Mail
    Then Mail Extra Services: Set Security Value to $100
    Then Mail Extra Services: Set Return Receipt to Checked
    Then Mail Extra Services: Set COD to $20
    Then Mail Extra Services: Set Handling to Normal
    #Then Mail Extra Services: Set Non-Rectangular to Checked
    Then Mail Extra Services: Click Save
    Then Mail: Open Print Modal
    Then in Mail Print modal, select Printer "factory"
    Then in Mail Print modal, click Print button
    Then Sign out

