package org.zerock.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.service.BoardService;
import org.zerock.util.MediaUtils;
import org.zerock.util.UploadFileUtils;

@RequestMapping("/upload")
@Controller
public class UploadController {
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value="/uploadAjax.do", method=RequestMethod.GET)
	public void uploadAjax() throws Exception {}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		
		System.out.println("fileasdf = " + file.getOriginalFilename());
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping(value="/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		
		ResponseEntity<byte[]> entity = null;
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile.do", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) throws Exception {
		System.out.println("RQWEqwerdfasdsaf = " + fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	//업로드 파일 삭제
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles.do", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) throws Exception {
			
		if(files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
			
		for(String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
				
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
			}
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	//파일 조회
	@RequestMapping("/getFiles.do/{boardIdx}")
	@ResponseBody
	public List<String> getFiles(@PathVariable("boardIdx") int boardIdx) throws Exception {
		
		return boardService.getFiles(boardIdx);
	}

}
