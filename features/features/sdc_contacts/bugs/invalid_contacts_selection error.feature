Feature: Mail Contacts Modal Bugs

  Background:
    Given Start test driver

  @bug_invalid_contacts_selection
  Scenario: BUG WEBAPPS-12429 :  Invalid Contact Selected error is thrown in Search Contacts when selections are valid
    Then sign-in to orders
    Then navigate to Contacts
    #creating first valid contact
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |Person1    |random   |United States|53 Cactus Dr|Beloit|Wisconsin|53511     | random | random |random  |random           |random    |
    Then in contacts grid uncheck row 1
    #creating second valid contact
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |Person2    |random   |United States|45 Courtland Drive|Garden City|New York|11530     | random | random |random  |random           |random    |
    Then navigate to Mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then click mail-to link on print form
    Then expect search contacts modal is present
    Then check search contacts grid name Person1
    Then click select button on search contacts modal
    Then click mail-to link on print form
    Then expect search contacts modal is present
    Then check search contacts grid name Person2
    Then click select button on search contacts modal
    Then expect invalid contact selected modal is not displayed

