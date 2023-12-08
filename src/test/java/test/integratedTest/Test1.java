package test.integratedTest;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class Test1 {
	@Test
	public void  test1_1() {
		System.out.println("테스트1_1");
	}
	@Test
	public void  test1_2() {
		System.out.println("테스트1_2");
		assertEquals(3, 5);
	}
}
