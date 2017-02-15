Feature: Contacts BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_contacts
  Scenario: Contacts

    Then select Print On Shipping Label - 5 x 8 on Print form
    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Shipping Label Print form, Open Contacts modal
    Then Contacts: Click Contacts Page Link
    Then Sign out