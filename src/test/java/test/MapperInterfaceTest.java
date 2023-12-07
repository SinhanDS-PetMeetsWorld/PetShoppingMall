package test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import sinhanDS.first.project.product.ProductMapper;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.SellerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { sinhanDS.first.project.config.MvcConfig.class })
@WebAppConfiguration
public class MapperInterfaceTest {
	@Autowired
	ProductMapper mapper;
	
	@Test
	public void test() {
		List<ProductVO> list = mapper.product_list();
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	
	
	@Autowired
	SellerService service;
	@Test
	public void test2() {
		System.out.println(service.getProduct(4));
	}
}
