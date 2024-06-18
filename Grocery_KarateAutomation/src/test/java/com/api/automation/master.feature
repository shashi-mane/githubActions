Feature: To automate the tests

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'

  Scenario: To automate
    #	STATUS
    Given call read("classpath:com/api/automation/status/status.feature")
    # PRODUCTS
    And call read("classpath:com/api/automation/products/getAllProducts.feature")
    And call read("classpath:com/api/automation/products/getSingleProduct.feature")
    # CART
    And call read("classpath:com/api/automation/cart/createNewCart.feature")
    And call read("classpath:com/api/automation/cart/getCart.feature")
    And call read("classpath:com/api/automation/cart/addItemToCart.feature")
    And call read("classpath:com/api/automation/cart/getCartItems.feature")
    And call read("classpath:com/api/automation/cart/modifyItem.feature")
    And call read("classpath:com/api/automation/cart/replaceItem.feature")
    And call read("classpath:com/api/automation/cart/deleteItem.feature")
    # ORDERS
    And call read("classpath:com/api/automation/orders/createNewOrder.feature")
    And call read("classpath:com/api/automation/orders/getAllOrders.feature")
    And call read("classpath:com/api/automation/orders/getSingleOrder.feature")
    And call read("classpath:com/api/automation/orders/updateOrder.feature")
    And call read("classpath:com/api/automation/orders/deleteOrder.feature")
