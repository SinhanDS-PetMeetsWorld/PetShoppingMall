package test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { sinhanDS.first.project.config.MvcConfig.class })
@WebAppConfiguration
public class tempTest {
	@Autowired
	WebApplicationContext ctx;
	MockMvc mock;

	@Before
	public void before() {
		mock = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	/* 왜 안되나... */
	@Test
	public void regist_product() throws Exception {
		String temp = "필드스타 <b>강아지사료</b> 진도10kg 1+1+랜덤간식 대용량 진돗<b>개사료</b> \n";
		System.out.println(temp.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));

	}
}
