Feature: Extra Services BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_extra_services
  Scenario: Extra Services

    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 1 through 4
    Then set Mail To address to zone 1 through 4 on Shipping Label
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Padded Flat Rate Envelope
    Then on Shipping Label Print form, set Hide Mail Value to Unchecked

    Then Mail: Open Extra Servicess
    Then Mail Extra Services: Set Security to Registered Mail
    Then Mail Extra Services: Set Security Value to $100
    Then Mail Extra Services: Set Return Receipt to Checked
    Then Mail Extra Services: Set COD to $20
    Then Mail Extra Services: Set Handling to Normal
    #Then Mail Extra Services: Set Non-Rectangular to Checked
    Then Mail Extra Services: Click Save
    Then click Print form Print button
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button
    Then Sign out

