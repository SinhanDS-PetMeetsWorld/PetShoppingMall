package sinhanDS.first.project.util.file;
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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import sinhanDS.first.project.product.vo.ProductVO;

public class FileController {

	@Value("${realPath.registed_img_path}")
	private String registed_img_path;
	
	public FileNameVO upload(MultipartFile file, String registed_img_path) {
		if (file.isEmpty())
			return null;

		// 업로드시의 본래 파일 명
		FileNameVO vo = new FileNameVO();
		vo.setSaved_filename(file.getOriginalFilename());
		vo.setRegisted_img_path(registed_img_path);

		try {
			// 서버에 파일 저장
			File target_file = new File(vo.getRegisted_img_path() + "/" + vo.getSaved_filename());
			file.transferTo(target_file);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return vo;
	}
	
	public void remove(ProductVO vo) {
		System.out.println("삭제 파일명 체크 : " + registed_img_path + "/" + vo.getImage_url());
		Path filePath = Paths.get(registed_img_path + "/" + vo.getImage_url());
		try {
			Files.deleteIfExists(filePath);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}