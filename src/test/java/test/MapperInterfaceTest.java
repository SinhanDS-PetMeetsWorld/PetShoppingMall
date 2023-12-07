package test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.product.SellerProductMapper;
import sinhanDS.first.project.seller.product.SellerProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { sinhanDS.first.project.config.MvcConfig.class })
@WebAppConfiguration
public class MapperInterfaceTest {
	@Autowired
	SellerProductMapper mapper;
	
	
	
	@Autowired
	SellerProductService service;
	@Test
	public void test2() {
		System.out.println(service.getProduct(4));
	}
}
