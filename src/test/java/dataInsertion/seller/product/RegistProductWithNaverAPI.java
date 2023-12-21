package dataInsertion.seller.product;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.core.sym.Name;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.seller.vo.SellerVO;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { sinhanDS.first.project.config.MvcConfig.class })
@WebAppConfiguration
public class RegistProductWithNaverAPI {
	@Value("${api.clientId}")
	private String clientId;
	@Value("${api.clientSecret}")
	private String clientSecret;
	
	@Autowired
	WebApplicationContext ctx;
	MockMvc mock;

	@Before
	public void before() {
		mock = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void check_product()throws Exception {
        String text = null;
        int number = 10;
        try {
        	/* 검색어 */
            text = URLEncoder.encode("캣타워", "UTF-8");
            
            /* 검색 갯수 */
            number = 50;
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        String apiURL = "https://openapi.naver.com/v1/search/shop?query=" + text +"&display=" + number;    // JSON 결과


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        System.out.println(responseBody);
        
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject)jsonParser.parse(responseBody);
        JSONArray jsonArray = (JSONArray)jsonObject.get("items");
        ProductCategoryVO pvo = new ProductCategoryVO();
        for(int i = 0 ; i < jsonArray.size(); i++) {
        	JSONObject obj = (JSONObject)jsonArray.get(i);
        	
        	String seller_no = "2";
        	String stock = String.valueOf((int)(Math.random() * 500));
        	String discount = "0";
        	String description = "";
        	String category1_list = "1";
        	String category2_list = "5";
        	
        	String name = (String)obj.get("title");
        	name = name.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
        	String price = (String)obj.get("lprice");
        	String company = (String)obj.get("maker");
        	String brand = (String)obj.get("brand");
        	String image_url = (String)obj.get("image");
        	
        	System.out.println("seller_no: " + seller_no);
        	System.out.println("stock: " + stock);
        	System.out.println("discount: " + discount);
        	System.out.println("description: " + description);
        	
        	System.out.println("category1_list: " + pvo.getCategory_name().get(Integer.valueOf(category1_list)));
        	System.out.println("category2_list: " + pvo.getCategory().get(Integer.valueOf(category1_list)).get(Integer.valueOf(category2_list)));
        	
        	System.out.println("name: " + name);
        	System.out.println("price: " + price);
        	System.out.println("company: " + company);
        	System.out.println("brand: " + brand);
        	System.out.println("image_url: " + image_url);
        	System.out.println("----------------");
        }
	}
		
	@Test
	public void regist_product() throws Exception {
		String clientId = "MJqrvmZMyfFRJ7Fdtvdw"; //애플리케이션 클라이언트 아이디
        String clientSecret = "LuXGTra8U2"; //애플리케이션 클라이언트 시크릿
        String text = null;
        int number = 10;
        try {
        	/* 검색어 */
            text = URLEncoder.encode("고양이 사료", "UTF-8");
            
            /* 검색 갯수 */
            number = 50;
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        String apiURL = "https://openapi.naver.com/v1/search/shop?query=" + text +"&display=" + number;    // JSON 결과


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        System.out.println(responseBody);
        
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject)jsonParser.parse(responseBody);
        JSONArray jsonArray = (JSONArray)jsonObject.get("items");
        ProductCategoryVO pvo = new ProductCategoryVO();
        for(int i = 0 ; i < jsonArray.size(); i++) {
        	JSONObject obj = (JSONObject)jsonArray.get(i);
        	
        	String seller_no = "2";
        	String stock = String.valueOf((int)(Math.random() * 500));
        	String discount = "0";
        	String description = "";
        	String category1_list = "0";
        	String category2_list = "0";
        	
        	System.out.println((String)obj.get("title"));
        	String name = (String)obj.get("title");
        	name = name.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
        	String price = (String)obj.get("lprice");
        	String company = (String)obj.get("maker");
        	String brand = (String)obj.get("brand");
        	String image_url = (String)obj.get("image");
        	
        	/* 옵션 가격 계산 */
        	int optionPrice = Integer.valueOf(price);
        	optionPrice = (int)(optionPrice * 0.1);

        	RequestBuilder req = MockMvcRequestBuilders.post("/seller/product/regist_forTest.do")
        			.sessionAttr("sellerLoginInfo", new SellerVO())
        			.param("seller_no", seller_no)
        			.param("name", name)
        			.param("price", price)
        			.param("stock", stock)
        			.param("company", company)
        			.param("brand", brand)
        			.param("image_url", image_url)
        			.param("discount", discount)
        			.param("description", description)
        			.param("category1_list", category1_list)
        			.param("category2_list", category2_list)
        			
        			
        			/* 카테고리를 더 추가하고 싶으실 경우 추가하시면 됩니다.  */
        			.param("category1_list", category1_list)
        			.param("category2_list", category2_list)
        			
        			/* 옵션을 더 추가하고 싶을실 경우 추가하시면 됩니다. */
//    				.param("title_list", "사이즈").param("content_list", "small").param("price_list", "0")
//    				.param("title_list", "사이즈").param("content_list", "middle").param("price_list", "" + optionPrice)
//    				.param("title_list", "사이즈").param("content_list", "large").param("price_list", "" + (2 * optionPrice))
        			
        			;
        	
			mock.perform(req);
        }
        
        
//		

	}
	
	
	
	
	 private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 오류 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }


	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);


	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();


	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }


	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
	        }
	    }
}
