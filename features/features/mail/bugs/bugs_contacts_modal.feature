Feature: Mail Contacts Modal Bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_contacts_modal
  Scenario: ORDERSAUTO_3243 Adding Contact from Mail should not Add Reference # Or Cost Code
    Then select Print On Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope/Flat
    Then set Advanced Options Reference Number to 12345
    Then set Advanced Options Cost Code to 123
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then click Print form Mail To link
    Then Expect Contacts Modal is Present
    Then Search Contacts Modal for last printed contact
    Then Select Recently Printed Contact
    Then expect Print form Domestic Address field displays last printed contact
    Then show Advanced Options
    Then Expect Advanced Options Reference Number is blank
    Then Expect Advanced Options Cost Code is None
    Then Sign out
