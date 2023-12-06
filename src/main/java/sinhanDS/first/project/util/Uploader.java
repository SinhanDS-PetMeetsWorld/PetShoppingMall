package sinhanDS.first.project.util;
/*
 * jsp에서 <input type="file">로 전송된 파일을 서버에 저장할 때 사용
 * 
 * 
 * Parameter
 * 		FileNameVO에는 서버의 realPath가 입력된 상태로 들어와야 한다.
 * 
 * 
 * 업로드 작업이 성공적으로 수행된 경우 
 * 		업로드시 본래 파일 명
 * 		서버에 저장될 파일 명
 * 		서버의 realPath를 리턴
 * 
 * 업로드 작업이 실패한 경우
 * 		null을 리턴
 */

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

/*	호출 예제
 	@Controller
 	public class MemberController {
		@PostMapping("/member/regist.do")
		public String insert(MemberVO vo, @RequestParam MultipartFile filename, HttpServletRequest request) {
			Uploader uploader = new Uploader();
			FileNameVO fvo = new FileNameVO(request.getRealPath("/upload/"));
			fvo = uploader.upload(fvo, filename);
			
			vo.setFilename_org(fvo.getUploaded_filename());
			vo.setFilename_real(fvo.getSaved_filename());
			
			service.insert(vo);
			return "redirect:regist.do";
		}
	}
*/
public class Uploader {
	public FileNameVO upload(FileNameVO vo, MultipartFile file, int product_no) {
		if(file.isEmpty()) return null;
		
		//업로드시의 본래 파일 명
		vo.setSaved_filename(file.getOriginalFilename(), product_no);
		
		
		try {
			//서버에 파일 저장
			System.out.println("Path체크: " + vo.getPath());
//			file.transferTo(new File(vo.getSaved_filename()));
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return vo;
	}
}