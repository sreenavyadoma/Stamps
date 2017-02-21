Feature: Mail Roll - 4" x 6" - FCM Package

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_roll_4x6_fcm_package
  Scenario: Roll - 4" x 6" - FCM Package

    Then select Print On Roll - 4" x 6" Shipping Label

    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 1 through 4

    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then Mail Roll: Select service First-Class Mail Package-Thick Envelope
    Then click Print form Print button
    Then in Mail Print modal, select Printer "ZDesigner"
    Then click Mail Print modal Print button
    Then Sign out