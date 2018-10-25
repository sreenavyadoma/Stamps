Feature: Contacts Modal Bugs

  Background:
    Given Start test driver

  @bug_postal_code_not_added_contact_details
  Scenario: BUG  WEBAPPS-11912 : Postal Code is not displayed in Details view for Contacts
    Then sign-in to orders
    Then navigate to Contacts
    #creating first valid contact with out postal code
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      | Aloha1234    |random   |United States|53 Cactus Dr|Beloit|Wisconsin|53511     | random | random |random  |random           |random    |
    Then in contacts grid uncheck row 1
    Then navigate to Mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then click mail-to link on print form
    Then expect search contacts modal is present
    Then check search contacts grid name Aloha1234
    Then click select button on search contacts modal
    Then expect address cleansing modal is present
    Then click accept button on address cleansing modal


