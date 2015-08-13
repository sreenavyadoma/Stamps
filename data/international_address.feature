
Feature:  B-01813 - Allow Int'l and APO/FPO Printing (CN22 and CP72)

  Background:
    * I am signed in as a batch shipper

  @international_address
  Scenario:  1 User Enters International Address, User Changes Ship To Country, Ship To Country is NOT United States, ser Edits Component Int'l Address Fields, Field Attributes
    * Add new order
    * Set Ship To country to Canada
    * Expect system hides tracking
    * Expect system hides dimentions
    * Expect system hides ship-to
    * Expect Edit Customs Form button is shown
    * Expect International Ship To address fields are shown
    * Expect International Ship To name field is constrained to 50 chars
    * Expect International Ship To company field is constrained to 50 chars
    * Expect International Ship To address 1 field is constrained to 50 chars
    * Expect International Ship To address 2 field is constrained to 50 chars
    * Expect International Ship To city field is constrained to 50 chars
    * Expect International Ship To province field is constrained to 50 chars
    * Expect International Ship To postal code field is constrained to 50 chars
    * Expect International Ship To phone field is constrained to 50 chars
    * Expect International Ship To email field is constrained to 50 chars
    * Set International Ship To name to random
    * Set International Ship To company to random
    * Set International Ship To address 1 to random
    * Set International Ship To address 2 to random
    * Set International Ship To city to random
    * Set International Ship To province to random
    * Set International Ship To postal code to random
    * Set International Ship To phone to random
    * Set International Ship To email to random

  Scenario:  2 User Edits Customs Form - International Address
    * Add new order
    * Set Ship To country to Canada
    * Set International Ship To recipient to random


  Scenario:  2 User Edits Customs Form - APO/FPO Address
    * Add new order