@regression
Feature: Web Batch Styles
  Open Style Guide: http://sdcintranet/ProductAndServiceOperations/ProductManagement/Product%20Management%20Documents/Web%20Client/Style%20Guide/Web%20Client%20Style%20Guide.docx

  Background:
    Given I am signed in as a batch shipper gc/qacc/auto40/password1

  @styles @regression
  Scenario: Font and tool tips
    Then Expect Style for General Fonts font-family to include helvetica
    Then Expect Style for General Fonts font-family to include arial
    Then Expect Style for General Fonts font-family to include sans-serif
    Then Expect Style for General Fonts font-family to include s60 sans
    Then Expect Style for General Fonts Color to be 0001
    Then Expect Style for General Fonts Size to be 14px
    Then Expect Style for General Tooltip Border width to be 1
    Then Expect Style for General Tooltip Border style to be solid
    Then Expect Style for General Tooltip Border radius to be 3px
    Then Expect Style for Navigation Header Height to be 50px
    Then Expect Style for Navigation Background Color to be rgba 33, 89, 168
    Then Expect Style for Navigation Links Color to be 255, 255, 255




