package sinhanDS.first.project.util.file;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 * Uploader와 Downloader를 사용하기 위한 매개 클래스
 * 
 * 서버에 파일을 업로드할 경우 realPath가 반드시 필요하다.  
 * uploading_filename는 사용자가 서버에 파일을 올릴 때의 파일 명이다.
 * saved_filename는 서버에 저장된 파일명이다.
 * 
 */
@Getter@NoArgsConstructor@Setter
public class FileNameVO {
	/* 서버의 실제 경로 */
	private String registed_img_path;
	
	/* 클라이언트가 업로드 한 파일이 서버에 저장될 때의 이름 */
	private String saved_filename = null;
	
	
	/* 서버에서 파일을 다운로드 할 경우 모든 필드가 필요하다 */
	public FileNameVO(String registed_img_path, String saved_filename) {
		this.registed_img_path = registed_img_path;
		this.saved_filename = saved_filename;
	}
	
	public void setSaved_filename(String file_name) {
		//파일의 확장자
		String ext = file_name.substring(file_name.lastIndexOf("."));
		
		saved_filename = "" + System.currentTimeMillis() + ext;
	}
}
