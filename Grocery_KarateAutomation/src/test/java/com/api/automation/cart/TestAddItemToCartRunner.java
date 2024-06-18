package com.api.automation.cart;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestAddItemToCartRunner {
	@Test
	public Karate runTest() {
//		return Karate.run("createNewCart","getCart").relativeTo(getClass());
//		return Karate.run("getCart").relativeTo(getClass());
		return Karate.run("addItemToCart","getCartItems").relativeTo(getClass());
//		return Karate.run("addItemToCart").relativeTo(getClass());
//		return Karate.run("getCartItems").relativeTo(getClass());
//		return Karate.run("modifyItem").relativeTo(getClass());
//		return Karate.run("replaceItem").relativeTo(getClass());
//		return Karate.run("deleteItem").relativeTo(getClass());
	}
}
