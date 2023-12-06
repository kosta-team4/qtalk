<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>

<title>상세보기 | ${examDetail.jmfldnm }</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<main class="test-detail-main">
		<section></section>
		<section class="test-detail-section">
			<table class="schedule-table">
				<thead>
					<tr>
						<th>북마크</th>
						<th>자격증이름</th>
						<th>구분</th>
						<th>필기원서접수</th>
						<th>필기응시날짜</th>
						<th>실기원서접수</th>
						<th>실기 응시날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
		
						<td><i class="fas fa-bookmark"></i></td>
						<td>${examDetail.jmfldnm }</td>
						<td>${examDetail.implplannm }</td>
						<td>${examDetail.docregstartdt }<br> ${examDetail.docregenddt }
						</td>
						<td>${examDetail.docexamstartdt }<br> ${examDetail.docexamstartdt }

						</td>
						<td>${examDetail.pracregstartdt }<br> ${examDetail.pracregenddt }
						</td>
						<td>${examDetail.pracexamstartdt }<br> ${examDetail.pracexamenddt }
						</td>
					</tr>
					<tr>
				</tbody>
			</table>
		</section>

		<section class="test-detail-text-section">
			<p>
				<실기시험 출제 경향> <br>
				<hr>
				정보시스템 등의 개발 요구 사항을 이해하여 각 업무에 맞는 소프트웨어의 기능에 관한설계, 구현 및 테스트를 수행에 필요한 <br>
				1. 현행 시스템 분석 및 요구사항 확인(소프트웨어 공학 기술의 요구사항 분석 기법활용) <br>
				2. 데이터 입출력 구현(논리, 물리데이터베이스 설계, 조작 프로시저 등) <br>
				3. 통합 구현(소프트웨어와 연계 대상 모듈간의 특성 및 연계 모듈 구현 등) <br>
				4. 서버프로그램 구현(소프트웨어 개발 환경 구축, 형상 관리, 공통 모듈, 테스트 수행 등) <br>
				5. 인터페이스 구현(소프트웨어 공학 지식, 소프트웨어 인터페이스 설계, 기능 구현, 구현검증 등) <br>
				6. 화면설계(UI 요구사항 및 설계, 표준 프로토 타입 제작 등) <br>
				7. 애플리케이션 테스트 (테스트 케이스 설계, 통합 테스트, 성능 개선 등) <br>
				8. SQL 응용(SQL 작성 등) <br>
				9. 소프트웨어 개발 보안 구축(SW 개발 보안 설계, SW개발 보안 구현 등) <br>
				10. 프로그래밍 언어활용(기본 문법 등) <br>
				11. 응용 SW기초 기술 활용(운영체제, 데이터베이스 활용, 네트워크 활용, 개발환경 구축 등) <br>
				12. 제품 소프트웨어 패키징(제품 소프트웨어 패키징, 제품소프트웨어 매뉴얼 작성 , 버전 관리등 ) <br>
				 <br>
				<세부 평가 내역> <br>
				<hr>
				- 필기시험의 내용은 고객지원 > 자료실의 출제기준을 참고 바랍니다.<br>
				- 실기시험은 필답형을 시행되며 고객지원> 자료실의 출제기준을 참고 바랍니다. 출제기준 참조(www.q-net.or.kr)<br>
			</p>
		</section>
	</main>


 	<!-- footer -->
    <%@include file="footer.jsp" %>


	<div class="list-back-btn">
		<span><a href="testschedule">목록</a></span>
	</div>
</body>
</html>