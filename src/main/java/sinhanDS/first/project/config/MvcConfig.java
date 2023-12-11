package sinhanDS.first.project.config;

import java.util.Properties;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.zaxxer.hikari.HikariDataSource;

import sinhanDS.first.project.util.file.FileController;
import sinhanDS.first.project.util.interceptor.CategoryInterceptor;
import sinhanDS.first.project.util.interceptor.SellerLoginInterceptor;
import sinhanDS.first.project.util.interceptor.UserLoginInterceptor;


@Configuration
@ComponentScan(basePackages = {"sinhanDS.first.project"})
@EnableWebMvc
@MapperScan(basePackages = {"sinhanDS.first.project"}, annotationClass = Mapper.class) // 인터페이스 스캔
@EnableTransactionManagement
public class MvcConfig implements WebMvcConfigurer{
	// DB접속정보
	@Value("${db.driver}")
	private String driver;
	@Value("${db.url}")
	private String url;
	@Value("${db.username}")
	private String username;
	@Value("${db.userpassword}")
	private String userpassword;
	@Value("${mail.password}")
	private String mailpassword;
	
	
	
	// html,css,js,img.... 컨트롤러에서 매핑되지 않은 URL을 톰캣에서 처리하기 위해
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	// ViewResolver설정 (JSP 경로)
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	// 정적페이지 설정
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/event/index.do");
	}
	
	// HikariCP
	@Bean(destroyMethod = "close")
	public HikariDataSource dataSource() {
		HikariDataSource dataSource = new HikariDataSource();
		dataSource.setDriverClassName(driver);
		dataSource.setJdbcUrl(url);
		
		dataSource.setUsername(username);
		dataSource.setPassword(userpassword);
		return dataSource;
	}
	// Mybatis
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(dataSource()); // DataSource 객체 주입
		return ssf.getObject();
	}
	
	// 트랜잭션 설정
	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager dtm = new DataSourceTransactionManager();
		dtm.setDataSource(dataSource());
		return dtm;
	}
	// 파일업로드
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setMaxUploadSize(1024*1024*5);
		resolver.setDefaultEncoding("utf-8");
		return resolver;
	}
	// 인터셉터
	@Bean
	public UserLoginInterceptor userLoginIntercepton() {
		return new UserLoginInterceptor();
	}
	@Bean
	public SellerLoginInterceptor sellerLoginIntercepton() {
		return new SellerLoginInterceptor();
	}
	@Bean
	public CategoryInterceptor categoryInterceptor() {
		return new CategoryInterceptor();
	}
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(userLoginIntercepton())
						.addPathPatterns("/user/**")
						.addPathPatterns("/user/product/**")
						.excludePathPatterns("/user/product/search.do")
						.excludePathPatterns("/user/product/goods.do")
						.excludePathPatterns("/user/join.do")
						.excludePathPatterns("/user/login.do")
						.excludePathPatterns("/user/idCheck.do")
						.excludePathPatterns("/user/emailCheck.do")
						.excludePathPatterns("/user/regist.do")
						
						/* TODO: order에 jsp로 값을 전달해 주기 전 임시로 제외한 패턴입니다. 나중에 삭제할꼐요 ㅎㅎ..*/
						.excludePathPatterns("/user/order/pay.do");
		
		registry.addInterceptor(sellerLoginIntercepton())
						.addPathPatterns("/seller/**")
						.excludePathPatterns("/seller/login.do")
						.excludePathPatterns("/seller/join.do")
						.excludePathPatterns("/seller/idCheck.do")
						.excludePathPatterns("/seller/emailCheck.do")
						.excludePathPatterns("/seller/regist.do");
		
		registry.addInterceptor(categoryInterceptor())
						.addPathPatterns("/")
						.addPathPatterns("/user/**")
						.addPathPatterns("/user/product/**");
	}
	
	// 프로퍼티 설정
	@Bean
	public static PropertySourcesPlaceholderConfigurer property() {
		PropertySourcesPlaceholderConfigurer property = new PropertySourcesPlaceholderConfigurer();
		property.setLocations(new ClassPathResource("db.properties"), new ClassPathResource("mail.properties"), new ClassPathResource("realPath.properties"));
		return property;
	}
	//이메일 발송
	@Bean
	public JavaMailSender javaMailSender() {
		Properties mailProperties = new Properties();
		mailProperties.put("mail.transport.protocol", "smtp");
		mailProperties.put("mail.smtp.auth", "true");
		mailProperties.put("mail.smtp.starttls.enable", "true");
		mailProperties.put("mail.smtp.debug", "true");
		mailProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		mailProperties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setJavaMailProperties(mailProperties);
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("meetsworldpet@gmail.com");
		mailSender.setPassword(mailpassword);
		mailSender.setDefaultEncoding("utf-8");
		return mailSender;
	}
	
	@Bean
	public FileController fileController() {
		return new FileController();
	}
}







