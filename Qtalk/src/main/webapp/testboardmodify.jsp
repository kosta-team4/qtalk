<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/testboardmodify.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Qtalk | 시험문제공유</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
   $(function(){
      $('#subject').change(function(){
           $.ajax({
              url: "getroundservlet",
              type: "post",
              data: {subject: $("#subject").val()},
              success: function(res) {
                 // 문자열에서 첫 글자와 마지막 글자를 제외하고, 그 후에 ','로 분할
                   var cleanedData = res.substring(1, res.length - 1).split(',');
                   var dataArray = []; // dataArray 변수를 정의합니다.
                   $('#round').empty();
                   for(var i=0; i<cleanedData.length; i++){
                       var trimmedData = cleanedData[i].trim();
                       // 옵션을 dataArray 배열에 추가
                       dataArray.push(trimmedData);
                       // 옵션을 추가할 때는 DOM 조작을 수행합니다.
                       $('#round').append('<option value="' + trimmedData + '">' + trimmedData + '</option>');
                   }
                   // dataArray 변수를 사용할 수 있습니다.
                   console.log(dataArray);
              }
           })
      })
   })
</script>
<title>시험게시글 수정하기</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!--게시글 작성 폼 시작-->
	<form action="testboardmodify" method="post" enctype="multipart/form-data" name="testboardmodify">
	<div class="board_header">
		<div class="board_title">시험문제 공유 게시글 수정하기</div>
		<div class="writer" id="writer">${member.nickname }</div>
	</div>
	<hr>
		<input type="hidden" name="num" value="${testboard.num}">
	<div class="container">
		<div class="div"> 
			<div class="select">
				&nbsp;&nbsp;시험명&nbsp;&nbsp;
						<input id="subject" name="subject" list="subject1" placeholder="시험명을 선택하세요"
						value="${testboard.subject}">
						  <datalist id="subject1" >
		                   <c:forEach items="${examInfoList}" var="examInfo">
		                       <option value="${examInfo.jmfldnm}"></option>
			                   </c:forEach>
			               </datalist>
			</div>
		</div>
		
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;회차&nbsp;&nbsp;
				<select id="round" name="round">
					 <option value="${testboard.round}">${testboard.round}</option>
				</select>
			</div>
		</div>
		
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;제목&nbsp;&nbsp; <input class="title" type="text"name = "title" value="${testboard.title}"
					style="border: none; background: transparent; height: 27px; outline: none;" />
			</div>
		</div>
		
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;이미지첨부&nbsp;&nbsp; <input type="text" class="upload-name"
					value="이미지를 업로드 하세요" placeholder="이미지를 업로드 하세요" disabled> <label
					for="upload-file">파일선택</label> <input type="file" id="upload-file">
			</div>
		</div>
		
		<div class="textarea">
			<div>
				<textarea name="content" id="content" cols="30" rows="10">${testboard.content}</textarea>
			</div>
		</div>
		
		<div class="button">
			<input class="btn1" type="submit" value="수정하기" />&nbsp;&nbsp; 
			<input class="btn2" type="submit" value="취소" onclick="location.href='testboarddetail?num='${testboard.num}" />
		</div>
		
	</div>
	</form>
	<!--게시글 작성 폼 끝-->
	 <div class="list-back-btn">
      <span><a href="testboard">목록</a></span>
   </div>
	
</body>
</html>