package sinhanDS.first.project.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {sinhanDS.first.project.config.MvcConfig.class})
@WebAppConfiguration
public class TestMapperTest {
	@Autowired
	TestMapper mapper;
	
	@Test
	public void list() {
		mapper.test();
	}
	
}
