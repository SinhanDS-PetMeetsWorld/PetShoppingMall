package test.user;

import java.util.List;

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

import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.user.order.OrderService;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { sinhanDS.first.project.config.MvcConfig.class })
@WebAppConfiguration
public class pay {
	@Autowired
	WebApplicationContext ctx;
	MockMvc mock;
	
	@Autowired
	private OrderService orderService;
	
	@Before
	public void before() {
		mock = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	@Test
	public void temp() throws Exception{
		RequestBuilder req = MockMvcRequestBuilders.post("/user/order/buy.do");
		UserVO uvo = new UserVO();
		uvo.setNo(22);
		
		CartVO cvo = new CartVO(); //결제 완료 후에 장바구니 삭제를 위해 필요
		cvo.setCart_no_list(new int[] {2, 3, 4});
		List<ProductVO> product_list = orderService.getProductList(cvo.getCart_no_list());
		
		
		ProductOptionVO ovo = new ProductOptionVO();
		ovo.setNo_list(new int[] {116, 119, 121, 122});
		List<ProductOptionVO> option_list = orderService.getOptionList(ovo.getNo_list());
		
		mock.perform(req);
	}
}
