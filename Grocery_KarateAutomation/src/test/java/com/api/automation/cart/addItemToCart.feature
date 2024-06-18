Feature: To add item to cart in application
  Use POST /carts/:cartId/items to add item to cart in application

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/cartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  #Scenario Outline: Add multiple items to cart
  #Given path 'carts/'+ cartId + '/items'
  #And header Accept = 'application/json'
  #And request {"productId":<productId> , "quantity":<quantity>}
  #When method post
  #And status 201
  #And print response
  #
  #Examples:
  #| productId | quantity |
  #|    4643   |     8    |
  #|    8554   |     1    |
  #|    8753   |     12   |
  #|    4875   |     6    |
  Scenario Outline: Add multiple items to cart using csv file
    Given path 'carts/'+ cartId + '/items'
    And header Accept = 'application/json'
    And request {"productId":<productId> , "quantity":<quantity>}
    When method post
    And status 201
    And print response

    Examples: 
      | read("items.csv") |

  Scenario Outline: Add invalid items to cart - checking error
    Given path 'carts/'+ cartId + '/items'
    And header Accept = 'application/json'
    And request {"productId":<productId> , "quantity":<quantity>}
    When method post
    And status 400
    And print response

    Examples: 
      | productId | quantity |
      |     24643 |        8 |
