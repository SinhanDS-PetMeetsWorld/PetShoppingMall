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

import sinhanDS.first.project.seller.vo.SellerVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { sinhanDS.first.project.config.MvcConfig.class })
@WebAppConfiguration
public class InterceptorTest {
	@Autowired
	WebApplicationContext ctx;
	MockMvc mock;

	@Before
	public void before() {
		mock = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void interceptorTest() throws Exception {
		RequestBuilder req = MockMvcRequestBuilders.get("/seller/index.do")
				.sessionAttr("sellerLoginInfo", new SellerVO());
		
		mock.perform(req);

	}
}
