Feature: To test the carts endpoint of grocery api
  use GET /carts/:cartId to get the cart

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/cartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  Scenario: To get the cart from grocery api
    Given path '/carts/'+ cartId
    And header Accept = 'application/json'
    When method get
    Then status 200
    * print 'Cart ID in get cart:', cartId
    
    
    Scenario: To get the cart from grocery api which is not present
    Given path '/carts/'+ cartId + 'abc'
    And header Accept = 'application/json'
    When method get
    Then status 404
    * print 'Cart ID in get cart:', cartId
    * print response
