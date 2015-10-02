Feature: Add Missing Field Validation

  Background:
    Given I am signed in as a batch shipper ff/webpost_0001/pass111

  @validate_international
  Scenario: Add Missing Validation Logic for Phone and International Email
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To country to Australia
    Then Set International Ship-To name to "random"
    Then Set International Ship-To phone to ""
    Then Expect Single Order Form phone text box data error tooltip to be "The ship to phone number is a required field"
    Then Set International Ship-To email to "@@"
    Then Expect Single Order Form email text box data error tooltip to be "Please enter a valid email address"

  @validate_domestic
  Scenario: Add Missing Validation Logic for Domestic Fields
    And I Add a new order
    Then Set Ship From to default
  #  Add Missing Validation Logic for Email
    Then Set Email to @@
    Then Expect Single Order Form email text box data error tooltip to be "Please enter a valid email address"

  #@validate_length
  #Scenario: Add Missing Validation Logic for Dimensions (Length) where Service = Priority Mail AND Zone > 5
    Then Set Ship-To address to
      | name      | company    | street_address     | city    | state | zip        | country       | phone           |  email            |
      | Joe Shmoe | Seven Zone | 1925 Florence Ave  | Kingman | AZ    | 86401-4617 | United States | (415) 123-5555  | rtest@stamps.com  |

    Then Set Service to "Priority Mail Large/Thick Envelope"
    Then Set Length to 0
    Then Set Width to 1
    Then Set Height to 1
    Then Expect Single Order Form length text box data error tooltip to be "Each dimension must be greater than 0"

    Then Set Service to "Priority Mail Package"
    Then Set Length to 0
    Then Set Width to 1
    Then Set Height to 1
    Then Expect Single Order Form length text box data error tooltip to be "Each dimension must be greater than 0"

  #@validate_width
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail AND Zone > 5
    Then Set Service to "Priority Mail Large/Thick Envelope"
    Then Set Length to 1
    Then Set Width to 0
    Then Set Height to 1
    Then Expect Single Order Form width text box data error tooltip to be "Each dimension must be greater than 0"

    Then Set Service to "Priority Mail Package"
    Then Set Length to 1
    Then Set Width to 0
    Then Set Height to 1
    Then Expect Single Order Form width text box data error tooltip to be "Each dimension must be greater than 0"

  #@validate_height
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail Large Envelope/Thick Envelope AND Zone ? 5
    Then Set Service to "Priority Mail Large/Thick Envelope"
    Then Set Length to 1
    Then Set Width to 1
    Then Set Height to 0
    Then Expect Single Order Form height text box data error tooltip to be "Each dimension must be greater than 0"

    Then Set Service to "Priority Mail Package"
    Then Set Length to 1
    Then Set Width to 1
    Then Set Height to 0
    Then Expect Single Order Form height text box data error tooltip to be "Each dimension must be greater than 0"
