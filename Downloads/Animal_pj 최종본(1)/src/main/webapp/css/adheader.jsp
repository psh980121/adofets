<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 시작, 밝은 테마 -->
<header data-bs-theme="light">
		<!-- 네비 바에서 화면의 크기가 중간 이상일 때 요소 확대, 상단 고정, 배경 밝게-->
		<nav class="navbar navbar-expand-md fixed-top bg-light"
			style="height: 80px;">
			<!-- 컨테이너 화면 너비만큼 확장(그리드 가능) -->
			<div class="container-fluid">
				<!-- 네비 브랜드 로고 -->
				<a class="navbar-brand" href="${pageContext.request.contextPath}/adminindex.jsp"> <!-- alt는 대체 텍스트 --> <img
					src="${pageContext.request.contextPath}/image/dog.png" alt="cow" width="60" height="50" />
				</a>
				<!-- 요소를 접을 수 있게 만듬, 콘텐츠 그룹화 -->
				<div id="menu" class="collapse navbar-collapse" id="navbarCollapse">
					<!-- 네비 내부 목록, 오른쪽 마진 자동 설정 및 왼쪽 정렬, 아래 마진 2, 중간 크기에서는 아래 마진 0 -->
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<!-- 네비 항목 -->
						<li class="nav-item">
							<!-- 네비 링크, 활성화되면 표시, 텍스트 검정, 스크린 리더(aria)에게 현재 페이지임을 알림 --> <a
							class="nav-link active text-black" aria-current="page" href="${pageContext.request.contextPath}/adminindex.jsp">관리자용페이지</a>
						</li>
						<li class="nav-item"><a class="nav-link text-black" href="${pageContext.request.contextPath}/animal/ShelterAdopt.jsp">입양 요청 관리</a>
						</li>
						<li class="nav-item"><a class="nav-link text-black" href="#">상품</a>
						<ul class="list-unstyled mb-0">
								<li><a href="${pageContext.request.contextPath}/admin/adproducts.jsp" class="text-decoration-none">상품등록</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/adproductsListAction.jsp" class="text-decoration-none">상품관리</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/adSalesAction.jsp" class="text-decoration-none">상품매출</a></li>
							</ul>
						</li>
						<li class="nav-item"><a class="nav-link text-black" href="${pageContext.request.contextPath}/admin/list1.jsp">커뮤니티</a>
						</li>
						<li class="nav-item"><a class="nav-link text-black" href="${pageContext.request.contextPath}/admin/adQuestionAction.jsp">1:1 문의</a>
						</li>

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
                        </c:if></li>
                        
                     <li class="mt-2 d-flex" style="width: 50%"><c:if test="${user != null }">
                           <span><a class="text-decoration-none"
                              href="${pageContext.request.contextPath}/logout.jsp">로그아웃</a>
                           </span>
                        </c:if> <c:if test="${user == null }">
                           <button type="button" class="btn btn-outline-dark me-2" style="width: 50%"
                              onclick="location.href='${pageContext.request.contextPath}/login.jsp'">로그인</button>
                           <!-- 노란 배경의 스타일 -->
                           <button type="button" class="btn btn-warning" style="width: 50%"
                              onclick="location.href='${pageContext.request.contextPath}/account/signup2.jsp'">회원가입</button>
                        </c:if></li>
                  </ul>
					
				</div>
			</div>
		</nav>
	</header>