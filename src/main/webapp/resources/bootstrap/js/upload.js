// 이미지 파일 판단
function checkImageType(fileName) {
	var pattern = /jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);
}

// 업로드 파일 정보
function getFileInfo(fullName) {
	var fileName, imgsrc, getLink, fileLink;
	
	//이미지 파일일 경우
	if(checkImageType(fullName)) {
		// 이미지 파일 경로
		imgsrc = "/upload/displayFile.do?fileName="+fullName;
		// 업로드 파일명
		fileLink = fullName.substr(14);
		//날짜별 디렉토리 추출
		var front = fullName.substr(0,12);
		// s_를 제거한 업로드 이미지 파일명
		var end = fullName.substr(14);
		
		// 원본 이미지 파일 디렉토리
		getLink = "/upload/displayFile.do?fileName="+front+end;
	// 이미지 파일이 아닐경우
	}else{
		imgsrc = "/resources/dist/img/file.png";
		fileLink = fullName.substr(12);
		getLink = "/upload/displayFile.do?fileName="+fullName;
	}
	
	// 목록에 출력할 원본파일 명
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	// json 객체 리턴
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
}
