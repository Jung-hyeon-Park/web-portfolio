package org.zerock.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/blogAPI")
public class SearchBlogAPI {
	
	//네이버 블로그 검색 API
	@RequestMapping(value="/main.do", method=RequestMethod.GET, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<StringBuffer> searchBlog(Model model, HttpSession session, @RequestParam("post") int post) throws Exception {
	
		if(post >= 6 && post <= 8) {
			String clientId = "_S8mDutWf6NvnOFD4SFQ"; //애플리케이션 클라이언트 아이디값";
	        String clientSecret = "UotiTobcdi"; //애플리케이션 클라이언트 시크릿값";
	        if(session.getAttribute("search") != null) {
	        	String search = (String) session.getAttribute("search");
	        	try {
	                String text = URLEncoder.encode(search,"UTF-8");
	               
	                String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+"&display=2"; // json 결과
	                
	                URL url = new URL(apiURL);
	                HttpURLConnection con = (HttpURLConnection)url.openConnection();
	                con.setRequestMethod("GET");
	                con.setRequestProperty("X-Naver-Client-Id", clientId);
	                con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	                int responseCode = con.getResponseCode();
	                BufferedReader br;
	                if(responseCode==200) { // 정상 호출
	                    br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	                } else {  // 에러 발생
	                    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	                }
	                String inputLine;
	                StringBuffer response = new StringBuffer();
	                while ((inputLine = br.readLine()) != null) {
	                    response.append(inputLine);
	                }
	                br.close();
	             
	               return new ResponseEntity<>(response, HttpStatus.OK);
	              
	            } catch (Exception e) {
	                System.out.println(e);
	            }
	        }
		}
		return null;
	}

}
