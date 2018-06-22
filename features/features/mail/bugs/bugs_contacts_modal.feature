Feature: Mail Contacts Modal Bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_contacts_modal
  Scenario: ORDERSAUTO_3243 Adding Contact from Mail should not Add Reference # Or Cost Code
    Then select print on Shipping Label - 5x8
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then set print form mail-to to a random address in zone 1 through 4
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then set advanced options reference number to 12345
    Then set advanced options cost code to 123
    Then Print Postage
    Then set Mail Print modal Printer
    Then click Mail Print modal Print button

    Then click Print form Mail To link
    Then Expect Contacts Modal is Present
    Then Search Contacts Modal for last printed contact
    Then Select Recently Printed Contact
    Then expect Print form Domestic Address field displays last printed contact
    Then show advanced options
    Then expect advanced options reference number is blank
    Then expect advanced options cost code is None
    Then sign out
