package com.api.automation;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class MasterRunner {
	@Test
	public Karate runTest() {
		return Karate.run("master").relativeTo(getClass());
	}
}
