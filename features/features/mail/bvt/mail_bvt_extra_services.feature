Feature: Extra Services BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_extra_services
  Scenario: Extra Services
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to address random name, random company, 3217 Shasta Circle S., Los Angeles, CA 90065
    Then set Print form Ounces to 1
    Then select Print form service PM Padded Flat Rate Envelope
    Then expect Advanced Options Hide Label Value is checked
    Then select Advanced Options Extra Services

    Then set Extra Services Security to Registered Mail
    Then click value must be shown window Continue button
    Then expect Extra Services Security Price to be 11.90

    Then set Extra Services Value to 30.00
    Then expect Extra Services Security Price to be 12.60

    Then set Extra Services COD to 20.00
    Then expect Extra Services COD Price to be 5.70

    Then check Extra Services Return Receipt
    Then expect Extra Services Return Receipt Price to be 2.75

    Then check Extra Services Restricted Delivery
    Then expect Extra Services Restricted Delivery Price to be 5.10

    Then check Extra Services Notice of Non-Delivery
    Then expect Extra Services Notice of Non-Delivery Price to be 0.00

    Then expect Extra Services Total Price to be 26.15

    Then save Extra Services

    Then select Advanced Options Extra Services

    Then expect Extra Services Security Price to be 12.60
    Then expect Extra Services Return Receipt Price to be 2.75
    Then expect Extra Services Restricted Delivery Price to be 5.10
    Then expect Extra Services COD Price to be 5.70
    Then expect Extra Services Notice of Non-Delivery Price to be 0.00
    Then expect Extra Services Total Price to be 26.15

    Then save Extra Services
    Then Sign out

