@regression
Feature: Web Batch Styles
  Open Style Guide: http://sdcintranet/ProductThenServiceOperations/ProductManagement/Product%20Management%20Documents/Web%20Client/Style%20Guide/Web%20Client%20Style%20Guide.docx

  Background:
    Given a valid user is signed in to Web Apps

  @styles
  Scenario: Font and tool tips
    Then Expect Style for General Fonts font-family to include helvetica
    Then Expect Style for General Fonts font-family to include arial
    Then Expect Style for General Fonts font-family to include sans-serif
    Then Expect Style for General Fonts font-family to include s60 sans
    Then Expect Style for General Fonts Color is 0001
    Then Expect Style for General Fonts Size is 14px
    Then Expect Style for General Tooltip Border width is 1
    Then Expect Style for General Tooltip Border style is solid
    Then Expect Style for General Tooltip Border radius is 3px
    Then Expect Style for Navigation Header Height is 50px
    Then Expect Style for Navigation Background Color is rgba 33, 89, 168
    Then Expect Style for Navigation Links Color is 255, 255, 255

    Then Sign out





