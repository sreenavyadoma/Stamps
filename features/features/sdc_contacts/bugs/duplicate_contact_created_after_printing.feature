Feature: Mail Contacts Modal Bugs

  Background:
    Given Start test driver

  @bug_duplicate_contact_after_printing
  Scenario: BUG WEBAPPS-12139 :  Duplicate contact created after printing
    Then sign-in to orders
    Then navigate to Contacts
    Then click add button on contacts toolbar
    Then set contact details to
      | full_name | company | country| street_address | city | state | postal_code | phone  |  email | groups | reference_number|cost_code |
      |random     |random   |United States|53 Cactus Dr|Beloit|Wisconsin|53511     | random | random |random  |random           |random    |
    Then in contacts grid uncheck row 1
    Then search for contact newly added from the contacts left navigation filter
    Then expect count of contact search results is 1
    Then navigate to Mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then set Print form Mail-From to default
    Then set print form mail-to country to United States
    Then click mail-to link on print form
    Then expect search contacts modal is present
    Then check search contacts grid name newly added
    Then expect address cleansing modal is present
    Then click accept button on address cleansing modal
    Then set print form ounces to 1
    Then select print form service FCM Large Envelope/Flat
    Then click mail toolbar print label
    Then set mail print modal printer Microsoft Print to PDF
    Then click mail print modal Print button
    Then navigate to Contacts
    Then search for contact newly added from the contacts left navigation filter
    Then expect count of contact search results is 1

