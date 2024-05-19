<%@page import="org.iclass.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Products Page</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/004.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>

<body class="d-flex flex-column min-vh-100 pb-0">

	<div class="position-fixed top-50 end-0 translate-middle-y mb-3"
      style="height: 400px; width: 370px; margin-right: 140;">
      <div class="position-relative">
         <button class="py-2 d-flex align-items-center" id="bd-theme"
            type="button"
            style="margin-left: 430px; background-color: white; border: white;">
            <img src="../image/cart.png" alt="cart"
               style="width: auto; height: 50px" /> <span
               class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
               style="margin-left: 120px;"><c:if test="${count == null}">
         0
         </c:if> <c:if test="${count != null}">
                  <c:out value="${count }"></c:out>
               </c:if> <span class="visually-hidden">Notification</span> </span>
         </button>

			<div class="toggle-box scrollBar balloon m-0"
            style="width: 500px; height: 450px; padding: 20px;">

				<table>
					<c:if test="${count == null}">
					장바구니에 담긴 상품이 없습니다.
					</c:if>
					<c:if test="${count != null}">
					<tr>
						<th>상품 사진</th>
						<th>상품 이름</th>
						<th>상품 가격</th>
						<th>상품 개수</th>
						
					</tr>
					<c:forEach var="carts" items="${cartlist }">
					<tr>
						<td><img
			alt="${carts.pdtpicture}" src="/upload/${carts.pdtpicture}"
			style="border: 1px solid gray; margin-bottom: 5px; width: 50px; height: 50px;"></td>
						<td>${carts.pdtname}</td>
						<td>${carts.pdtprice}</td>
						<td>${carts.buycnt }</td>
					</tr>
					</c:forEach>
				<div class="d-flex flex-row-reverse my-2">
               <button type="button" class="btn btn-outline-warning rounded-pill mx-2">구매 취소</button>
               <button type="button" class="btn btn-outline-danger rounded-pill " onclick="cartbuy()">구매하기</button>
            </div>
					</c:if>
				</table>
					
			</div>
		</div>
	</div>

	<!-- 헤더 시작, 밝은 테마 -->
	<%@ include file="../css/header.jsp"%>

	<!-- 메인 시작 -->
	<main style="margin-bottom: 200px;  margin-top: 70px;">

		<form action="" method="post"
			class="col-lg-8 col-md-8 mx-auto m-auto px-5">
			<input type="hidden" name="pdtbuy" value="">

			<hr>
			<h1 class="h3 fw-normal text-center">상품 목록입니다.</h1>
			<hr>
			<section class="selectbox">
         
            <h2 class="hidden">셀렉트 박스</h2>
            <button type="button" class="toggle-btn">
			<c:if test="${option == null }">
				전체
			</c:if>
			<c:if test="${option == '전체' }">
				전체
			</c:if>
			<c:if test="${option == 'OLD' }">
				중고
			</c:if>
			<c:if test="${option == 'NEW' }">
				신상
			</c:if>
               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                  fill="currentColor" class="ico-down" viewBox="0 0 16 16">
                   <path fill-rule="evenodd"
                     d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                 </svg>
            </button>
            
               <ul class="selectbox-option hide">
                  <li>
                     <button name="bt1" value="전체" class="option-btn" onclick="change()">전체</button>
                  </li>
                  <li>
                     <button name="bt2" value="OLD" class="option-btn" onclick="change()">중고</button>
                  </li>
                  <li>
                     <button name="bt3" value="NEW" class="option-btn" onclick="change()">신상</button>
                  </li>
               </ul>
            
         </section>
			<c:forEach items="${lists}" var="dto" varStatus="status">
				<!-- 각각의 상품 정보를 1열에 4개씩 표시 -->
				<c:if test="${status.index % 4 == 0}">
					<!-- 새로운 행 시작 -->
					<div class="row">
				</c:if>

				<div class="col-lg-3 col-md-5">
					<div
						style="border: 1px solid gray; height: 680px; padding: 10px; margin-bottom: 10px;">
						<!-- 상품 이미지는 img 태그에서 표시. 서버 폴더 D:/iclass0419/upload 경로명 -->
						<img alt="${dto.pdtpicture}" src="/upload/${dto.pdtpicture}"
							style="border: 1px solid gray; margin-bottom: 5px; width: 100%; height: 250px;">

						<p>
							<!-- 상품타입 -->
							【
							<c:out value="${dto.pdttype}" />
							】 <a href="javascript:buy('${dto.pdtcode}')"> <!-- 상품이름 --> <c:out
									value="${dto.pdtname}" /></a>

						</p>

						<!-- 상품가격 -->
						<p>
							<c:out value="${dto.pdtprice}" />
						</p>

						<!-- 상품카테고리 -->
						<p>
							<c:out value="${dto.pdtcate}" />
						</p>

						<!-- 등록날짜 -->
						<p>
							<c:out value="${dto.pdtdate}" />
						</p>

						<!-- 판매자닉네임 -->
						<p>
							<c:out value="${dto.usernick}" />
						</p>

						<!-- 상품설명 -->
						<p>
							<c:choose>
								<c:when test="${fn:length(dto.pdtcontent) > 100}">
									<span id="shortDescription_${status.index}" style="">
										${fn:substring(dto.pdtcontent, 0, 100)} </span>

									<span id="fullDescription_${status.index}"
										style="display: none;"> <c:out
											value="${dto.pdtcontent}" />
									</span>

									<a href="javascript:void(0);"
										onclick="toggleDescription(${status.index});">더보기</a>

								</c:when>

								<c:otherwise>
									<c:out value="${dto.pdtcontent}" />
								</c:otherwise>
							</c:choose>
						</p>
						<div class="d-flex"></div>
					</div>
				</div>

				<!-- 각각의 상품 정보를 1열에 4개씩 표시 -->
				<c:if test="${(status.index + 1) % 4 == 0 || status.last}">
					<!-- 행 닫기 -->
					</div>
				</c:if>
			</c:forEach>

		</form>

		<!-- 메인 종료 -->
	</main>
	<!-- 푸터 시작 -->
<%@ include file="../css/footer.jsp"%>

	<script type="text/javascript">
	function toggleDescription(index) {
	    // 함수의 매개변수로 index를 받습니다. 이 index는 어떤 상품을 다룰지를 식별하는 역할을 합니다.

	    // 해당 상품의 요약 내용과 전체 내용 요소를 가져옵니다.
	    const shortDescription = document.getElementById(`shortDescription_${index}`);
	    const fullDescription = document.getElementById(`fullDescription_${index}`);

	    // 해당 상품의 "더보기" 링크 요소를 가져옵니다.
	    const moreLink = document.querySelector(`a[onclick="toggleDescription(${index});"]`);

	    // shortDescription, fullDescription, moreLink가 모두 정의되어 있는지 확인합니다.
	    if (shortDescription && fullDescription && moreLink) {
	        // shortDescription 요소의 CSS display 속성이 'none' 또는 비어있는 경우
	        if (shortDescription.style.display === 'none' || shortDescription.style.display === '') {
	            // 펼치기 동작
	            shortDescription.style.display = 'inline'; // 요약 내용을 보이게 설정
	            fullDescription.style.display = 'none'; // 전체 내용을 숨김 처리
	            moreLink.textContent = '더보기'; // 링크 텍스트를 '더보기'로 변경
	        } else {
	            // shortDescription 요소의 CSS display 속성이 'none'이 아닌 경우
	            // 접기 동작
	            shortDescription.style.display = 'none'; // 요약 내용을 숨김 처리
	            fullDescription.style.display = 'inline'; // 전체 내용을 보이게 설정
	            moreLink.textContent = '접기'; // 링크 텍스트를 '접기'로 변경
	        }
	    }
	}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
	</script>
	<script type="text/javascript">
	function change() {
		const ff = document.forms[1]
		ff.action = '../products/productsType.jsp'
		ff.submit()
	}	
	
	function buy(code){
		const up = document.forms[1]
		
		up.pdtbuy.value = code
		if('${user.userid}' == '') {
			yn=confirm('상품 구매 및 장바구니 담기는 로그인이 필요합니다. 로그인 하시겠습니까?')
			if(yn) location.href='../login.jsp?back=p'
		}
		else {
		up.action = 'productsBuy.jsp'		
		up.submit()	
		}
		
	}
	
	function cartbuy(){
		const up = document.forms[1]
		up.action = 'pdtBuyCart.jsp'
		up.submit()
	}
	
</script>
<script>
      // 카트를 클릭하면 열거나 닫습니다.
      const toggleBox = document.querySelector(".toggle-box");
      const button = document.querySelector("#bd-theme");

      let boxVisible = false;

      button.addEventListener("click", () => {
        // 클릭할 때 빈칸을 토글합니다.
        boxVisible = !boxVisible;
        toggleBox.style.display = boxVisible ? "block" : "none";
      });

      // 버튼을 클릭하면 옵션 목록을 열거나 닫습니다.
      const toggleBtn = document.querySelector(".toggle-btn");
      const selectbox = document.querySelector(".selectbox");

      toggleBtn.addEventListener("click", () => {
        selectbox.classList.toggle("open");
      });
    </script>
	<script type="text/javascript" src=" ../js/islogin.js"></script>
</body>
</html>









