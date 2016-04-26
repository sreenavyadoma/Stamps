Feature:  Move "Printing On" to top of the Print dialog

  Background:
    Given I am signed in to Orders

  @print_printing_on_label_position
  Scenario:  Printing On Label Position
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address in Zone 1
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Expect Printing On Label to be Printing On:
    Then Print: Close Modal
    Then Sign out

