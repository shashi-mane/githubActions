package com.api.automation.cart;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestCartRunner {
	@Test
	public Karate runTest() {
//		return Karate.run("createNewCart","getCart").relativeTo(getClass());
//		return Karate.run("getCart").relativeTo(getClass());
		return Karate.run("createNewCart","getCart","addItemToCart").relativeTo(getClass());
//		return Karate.run("createNewCart","getCart","addItemToCart","getCartItems","modifyItem","replaceItem","deleteItem").relativeTo(getClass());
	}
}
