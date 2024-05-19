<%@page import="org.iclass.dao.usersDao"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 시작, 밝은 테마 -->
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<header data-bs-theme="light">
<%
  // userdto가 세션에 저장되어 있는지 확인
  usersDto dto = (usersDto) session.getAttribute("user");
  String userid = null;

  if (dto != null) {
    userid = dto.getUserid();
  }
%>
		<!-- 네비 바에서 화면의 크기가 중간 이상일 때 요소 확대, 상단 고정, 배경 밝게-->
		<nav class="navbar navbar-expand-md fixed-top bg-light"
			style="height: 80px;">
			<!-- 컨테이너 화면 너비만큼 확장(그리드 가능) -->
			<div class="container-fluid">
				<!-- 네비 브랜드 로고 -->
				<a class="navbar-brand" href="${pageContext.request.contextPath}"> <!-- alt는 대체 텍스트 --> <img
					src="${pageContext.request.contextPath}/image/dog.png" alt="cow" width="60" height="50" />
				</a>
				<!-- 요소를 접을 수 있게 만듬, 콘텐츠 그룹화 -->
				<div id="menu" class="collapse navbar-collapse" id="navbarCollapse">
					<!-- 네비 내부 목록, 오른쪽 마진 자동 설정 및 왼쪽 정렬, 아래 마진 2, 중간 크기에서는 아래 마진 0 -->
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<!-- 네비 항목 -->
						<li class="nav-item">
							<!-- 네비 링크, 활성화되면 표시, 텍스트 검정, 스크린 리더(aria)에게 현재 페이지임을 알림 --> <a
							class="nav-link active text-black" aria-current="page"
							href="${pageContext.request.contextPath}">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link text-black" href="#">상품</a>
							<ul class="list-unstyled mb-0">
								<li><a
									href="${pageContext.request.contextPath}/products/productsListAction.jsp"
									class="text-decoration-none">상품 전체 보기</a></li>
								<li><a
									href="${pageContext.request.contextPath}/products/products.jsp"
									class="text-decoration-none">상품 등록</a></li>								
							</ul></li>
						<li class="nav-item"><a class="nav-link text-black" href="${pageContext.request.contextPath}/community/list1.jsp">커뮤니티</a>
							<ul class="list-unstyled mb-0">
								<li><a href="${pageContext.request.contextPath}/community/list3.jsp" class="text-decoration-none">입양/상품 후기</a></li>
								<li><a href="${pageContext.request.contextPath}/community/list.jsp" class="text-decoration-none">임시보호/실종</a></li>
								</li>
							</ul></li>
						<li class="nav-item"><a class="nav-link disabled text-black">공고</a>
							<ul class="list-unstyled mb-0">
								<li><a href="${pageContext.request.contextPath}/animal/guideAdopt.jsp" class="text-decoration-none">입양 안내</a></li>
								<li><a href="${pageContext.request.contextPath}/animal/listAnimal2.jsp" class="text-decoration-none">입양 동물 목록</a></li>
							</ul>
						</li>
						<li class="nav-item">
						                 <a class="nav-link text-black"
                     href="javascript:write()">1:1 문의</a></li>

               </ul>

               <!-- 오른쪽 정렬 -->
               <div id="menu" class="collapse navbar-collapse"
                  style="padding-left: 430px;">

                  <!-- form 내부 요소들을 수평 정렬할 수 있음 -->
                  <form class="d-flex" role="search">
                     <!-- 폼 입력 필드, 밝은 테마, 오른쪽 마진 3 -->
                     <input class="form-control form-control-light me-3" type="search"
                        style="min-width: 280px" placeholder="Search..."
                        aria-label="Search" />
                  </form>

                  <!-- 네비 내부 목록, 오른쪽 마진 자동 설정 및 왼쪽 정렬, 아래 마진 2, 중간 크기에서는 아래 마진 0 -->
                  <ul class="navbar-nav mb-2 mb-md-0 text-center" style="width: 100%">

                     <li class="nav-item"><c:if test="${user != null }" >


                           <a class="nav-link text-black"> <c:out
                                 value="${user.username }" /> 님
                           </a>

                           <ul class="list-unstyled mb-0">
                              <li><a href="${pageContext.request.contextPath}/mypage/selectBuy.jsp"
                                 class="text-decoration-none">구매목록</a></li>
                              <li><a href="${pageContext.request.contextPath}/mypage/selectAdopt.jsp"
                                 class="text-decoration-none">입양목록</a></li>
                              <li><a href="${pageContext.request.contextPath}/mypage/update.jsp"
                                 class="text-decoration-none">내 정보 수정</a></li>
                              <li><a href="${pageContext.request.contextPath}/question/MyQuestion.jsp"
                                 class="text-decoration-none">내 문의내역</a></li>
                              <li><a href="${pageContext.request.contextPath }"
                                 class="text-decoration-none">홈으로</a></li>
                           </ul>

                        </c:if></li>
                        
                        
                        
                        
                     <li class="mt-2 d-flex" style="width: 50%"><c:if test="${user != null }">
                     <button class="pe-5 border-0 bg-transparent">
										<i class="message bi bi-chat-left-dots"
											style="display: inline;"></i> 
											<span
											class="position-absolute translate-middle badge rounded-pill bg-danger"><%= usersDao.getInstance().countMessage(userid) %><span
											class="visually-hidden">Notification</span>
										</span>
									</button>
                           <span><a class="text-decoration-none"
                              href="${pageContext.request.contextPath}/logout.jsp">로그아웃</a>
                           </span>
                        </c:if> <c:if test="${user == null }">
                           <button type="button" class="btn btn-outline-dark me-2" style="width: 50%"
                              onclick="location.href='${pageContext.request.contextPath}/login.jsp'">로그인</button>
                           <!-- 노란 배경의 스타일 -->
                           <button type="button" class="btn btn-warning" style="width: 50%"
                              onclick="location.href='${pageContext.request.contextPath}/account/signup.jsp'">회원가입</button>
                        </c:if></li>
                  </ul>
					
				</div>
			</div>
		</nav>
			<div class="messageblock position-fixed"
			style="position: fixed; background: white; border: 1px solid black; width: 500px; height: 300px; top: 8%; left: 70%; padding: 20px; z-index: 1; display: none; overflow: auto;">
			<%@ include file="../animal/checkMessage.jsp"%>
		</div>
	</header>