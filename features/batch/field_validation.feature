Feature: Add Missing Field Validation

  Background:
    Given I am signed in as a batch shipper

  @validate_international @rob_test1
  Scenario: Add Missing Validation Logic for Phone and International Email
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to Australia
    Then Set International Ship-To name to "random"
    Then Set International Ship-To phone to ""
    Then Expect Single Order Form Phone data error tooltip to be "The ship to phone number is a required field"
    Then Expect Grid ship cost data error tooltip to be "The ship to phone number is a required field"
    Then Set International Ship-To email to "@@"
    Then Expect Single Order Form Email data error tooltip to be "Please enter a valid email address"

  @validate_domestic
  Scenario: Add Missing Validation Logic for Domestic Fields
    And I Add a new order
    Then Set single-order form Ship-From to default

  #  Add Missing Validation Logic for Email
    Then Set Email to @@
    Then Expect Single Order Form Email data error tooltip to be "Please enter a valid email address"

  #@validate_length
  #Scenario: Add Missing Validation Logic for Dimensions (Length) where Service = Priority Mail AND Zone > 5
    Then Set single-order form Ship-To address to
      | name      | company    | street_address     | city    | state | zip        | country       | phone           |  email            |
      | Joe Shmoe | Seven Zone | 1925 Florence Ave  | Kingman | AZ    | 86401-4617 | United States | (415) 123-5555  | rtest@stamps.com  |

    Then Set single-order form Service to "Priority Mail Large/Thick Envelope"
    Then Set single-order form Length to 0
    Then Set single-order form Width to 1
    Then Set single-order form Height to 1
    Then Expect Single Order Form Length data error tooltip to be "Each dimension must be greater than 0"

    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Length to 0
    Then Set single-order form Width to 2
    Then Set single-order form Height to 2
    Then Expect Single Order Form Length data error tooltip to be "Each dimension must be greater than 0"

  #@validate_width
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail AND Zone > 5
    Then Set single-order form Service to "Priority Mail Large/Thick Envelope"
    Then Set single-order form Length to 1
    Then Set single-order form Width to 0
    Then Set single-order form Height to 1
    Then Expect Single Order Form Width data error tooltip to be "Each dimension must be greater than 0"

    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Length to 2
    Then Set single-order form Width to 0
    Then Set single-order form Height to 2
    Then Expect Single Order Form Width data error tooltip to be "Each dimension must be greater than 0"

  #@validate_height
  #Scenario: Add Missing Validation Logic for Dimensions (Width) where Service = Priority Mail Large Envelope/Thick Envelope AND Zone ? 5
    Then Set single-order form Service to "Priority Mail Large/Thick Envelope"
    Then Set single-order form Length to 1
    Then Set single-order form Width to 1
    Then Set single-order form Height to 0
    Then Expect Single Order Form Height data error tooltip to be "Each dimension must be greater than 0"

    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Length to 2
    Then Set single-order form Width to 2
    Then Set single-order form Height to 0
    Then Expect Single Order Form Height data error tooltip to be "Each dimension must be greater than 0"
