package com.api.automation;


import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
 
import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
 
 
public class ParallelBuilder {
 
	@Test
	public void executeKarateTest() {
		Builder aRunner = new Builder<>();
//		aRunner.path("classpath:com/api/automation");
		
		aRunner.path("classpath:com/api/automation/status");
		aRunner.path("classpath:com/api/automation/cart");
		aRunner.path("classpath:com/api/automation/products");
		aRunner.path("classpath:com/api/automation/authentication");
		aRunner.path("classpath:com/api/automation/orders");

		Results result = aRunner.parallel(5);
		System.out.println("Total Feature => "+result.getFeaturesTotal());
		System.out.println("Total Scenarios => "+result.getScenariosTotal());
		System.out.println("Fail Count => "+result.getFailCount());
		System.out.println("Passed Scenario count =>"+result.getScenariosPassed());
		Assertions.assertEquals(0, result.getFailCount(),"There are some Failed scenarios");
		
	}
}
 