package com.api.automation.orders;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestOrdersRunner {
	@Test
	public Karate runTest() {
//		return Karate.run("createNewOrder").relativeTo(getClass());
		return Karate.run("getAllOrders").relativeTo(getClass());
//		return Karate.run("getSingleOrder").relativeTo(getClass());
//		return Karate.run("updateOrder").relativeTo(getClass());
//		return Karate.run("deleteOrder").relativeTo(getClass());

//		return Karate.run("createNewOrder","getAllOrders","getSingleOrder","updateOrder","deleteOrder").relativeTo(getClass());
	}
}
