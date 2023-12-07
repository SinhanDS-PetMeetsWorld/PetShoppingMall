package seller;

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
public class remove {
	@Autowired
	WebApplicationContext ctx;
	MockMvc mock;

	@Before
	public void before() {
		mock = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void computer_url() throws Exception {
		System.out.println("상품제거 시작 ");
		RequestBuilder req = MockMvcRequestBuilders.post("/seller/product/remove.do")
				.sessionAttr("sellerLoginInfo", new SellerVO())
				.param("no", "80")
				.param("image_url", "1701936121307.png");
		
		mock.perform(req);
	}
	@Test
	public void naver_img_url() throws Exception {
		System.out.println("상품제거 시작 ");
		RequestBuilder req = MockMvcRequestBuilders.post("/seller/product/remove.do")
				.sessionAttr("sellerLoginInfo", new SellerVO())
				.param("no", "49")
				.param("image_url", "https://shop-phinf.pstatic.net/20221125_181/1669336673676lXvrR_JPEG/70472516390621864_1689661559.jpg?type=m510");
		
		mock.perform(req);
	}
	@Test
	public void null_img_url() throws Exception {
		System.out.println("상품제거 시작 ");
		RequestBuilder req = MockMvcRequestBuilders.post("/seller/product/remove.do")
				.sessionAttr("sellerLoginInfo", new SellerVO())
				.param("no", "43");
		
		mock.perform(req);
	}
}
