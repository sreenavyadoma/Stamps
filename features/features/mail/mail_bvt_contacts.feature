Feature: Contacts BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_contacts
  Scenario: Contacts

    Then on Shipping Label Print form, select Shipping Label - 5 ½” x 8 ½”
    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Shipping Label Print form, Open Contacts modal
    Then Contacts: Click Contacts Page Link
    Then Sign out