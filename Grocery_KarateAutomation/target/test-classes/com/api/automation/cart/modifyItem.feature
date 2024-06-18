Feature: To modify item to cart in application
  Use PATCH /carts/:cartId/items/:itemId to modify item to cart in application

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/cartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()
    * def item_path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/itemId.txt'
    * def item_file = new File(item_path)
    * def scanner = new Scanner(item_file)
    * def itemId = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  Scenario Outline: Modify item from the cart
    Given path 'carts/'+ cartId + '/items/' + itemId
    And header Accept = 'application/json'
    And request {"quantity":<quantity>}
    When method patch
    And status 204
    * print response
    And call read("classpath:com/api/automation/cart/getCartItems.feature")

    Examples: 
      | quantity |
      |        3 |

  Scenario Outline: Modify item from the cart with invalid parameters
    Given path 'carts/'+ cartId + '/items/' + itemId
    And header Accept = 'application/json'
    And request {"quantity":<quantity>}
    When method patch
    And status 400
    * print response
    And call read("classpath:com/api/automation/cart/getCartItems.feature")

    Examples: 
      | quantity |
      |      100 |
      
      Scenario Outline: Modify item from the cart with invalid itemId
    Given path 'carts/'+ cartId + '/items/' + itemId + '12'
    And header Accept = 'application/json'
    And request {"quantity":<quantity>}
    When method patch
    And status 404
    * print response
    And call read("classpath:com/api/automation/cart/getCartItems.feature")

    Examples: 
      | quantity |
      |      3 |
