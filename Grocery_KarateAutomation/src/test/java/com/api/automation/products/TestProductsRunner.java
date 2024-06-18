package com.api.automation.products;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestProductsRunner {
	@Test
	public Karate runTest() {
		return Karate.run("getAllProducts", "getSingleProduct").relativeTo(getClass());
//		return Karate.run("getSingleProduct").relativeTo(getClass());
//		return Karate.run("getAllProducts").relativeTo(getClass());

	}
}
