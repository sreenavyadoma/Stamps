Feature: Contacts BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_contacts
  Scenario: Contacts

    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then click Print form Mail To link
    Then click Search Contacts close button
    Then Sign out