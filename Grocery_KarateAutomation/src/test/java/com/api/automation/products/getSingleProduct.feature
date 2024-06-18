Feature: To test the products endpoint of grocery api
  This get the single product from inventory

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario Outline: To get the single product from grocery api
    #Given path '/products/6483'
    Given path '/products/'+ <productId>
    And header Accept = 'application/json'
    And param product-label	= true
    When method get
    Then status 200
    And print response

    Examples: 
      | productId |
      |      4643 |
     # |      2585 |
     # |      8753 |

  Scenario Outline: To get the single product from grocery api that is not available
    #Given path '/products/6483'
    Given path '/products/'+ <productId>
    And header Accept = 'application/json'
    When method get
    Then status 404
    And print response

    Examples: 
      | productId |
      |     46431 |
