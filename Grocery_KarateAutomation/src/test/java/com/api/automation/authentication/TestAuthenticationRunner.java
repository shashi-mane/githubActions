package com.api.automation.authentication;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestAuthenticationRunner {
	@Test
	public Karate runTest() {
		return Karate.run("registerApiClient").relativeTo(getClass());
	}
}
