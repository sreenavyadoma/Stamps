Feature: Extra Services BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_extra_services
  Scenario: Extra Services
    Then select Print On Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to address random name, random company, 3217 Shasta Circle S., Los Angeles, CA 90065
    Then set Print form Ounces to 1
    Then select Print form service PM Padded Flat Rate Envelope
    Then select Advanced Options Extra Services

    Then set Extra Services Security to Registered Mail
    Then expect Extra Services Security Price to be 11.70

    Then set Extra Services Value to 30.00
    Then expect Extra Services Security Price to be 12.50

    Then set Extra Services COD to 20.00
    Then expect Extra Services COD Price to be 5.65

    Then check Extra Services Return Receipt
    Then expect Extra Services Return Receipt Price to be 2.75

    Then check Extra Services Restricted Delivery
    Then expect Extra Services Restricted Delivery Price to be 5.00

    Then check Extra Services Notice of Non-Delivery
    Then expect Extra Services Notice of Non-Delivery Price to be 0.00

    Then expect Extra Services Total Price to be 25.90

    Then save Extra Services

    Then select Advanced Options Extra Services

    Then expect Extra Services Security Price to be 12.50
    Then expect Extra Services Return Receipt Price to be 2.75
    Then expect Extra Services Restricted Delivery Price to be 5.00
    Then expect Extra Services COD Price to be 5.65
    Then expect Extra Services Notice of Non-Delivery Price to be 0.00
    Then expect Extra Services Total Price to be 25.90

    Then save Extra Services
    Then Sign out

