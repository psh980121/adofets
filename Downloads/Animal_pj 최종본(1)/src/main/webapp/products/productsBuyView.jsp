<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>상품</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet" />
</head>

<body class="d-flex flex-column min-vh-100 pb-0">

   <%@ include file="../css/header.jsp"%>

   <!-- 메인 시작 -->
   <main style="margin-bottom: 200px; margin-top: 70px;">

      <form action="" method="post"
         class="form-signin w-100 m-auto border border-dark px-5">

         <input type="hidden" name="pcode" value="${dto.pdtcode }"> <img
            class="m-auto my-3" alt="${dto.pdtpicture}"
            src="/upload/${dto.pdtpicture}" style="max-width: 100%;">

         <div class="form-group d-flex align-items-center">

            <label class="col-1 col-form-label">【<c:out
                  value="${dto.pdttype}" />】
            </label>
            <div class="form-floating col-7 ms-2 my-1">
               <c:out value="${dto.pdtname}" />
            </div>
         </div>

         <div class="form-group d-flex align-items-center">

            <label class="col-2 col-form-label">코드:</label>
            <div class="form-floating col-7 ms-2 my-1">
               <c:out value="${dto.pdtcode}" />
            </div>
         </div>

         <div class="form-group d-flex align-items-center">

            <label class="col-2 col-form-label">가격:</label>
            <div class="form-floating col-7 ms-2 my-1">
               <c:out value="${dto.pdtprice}" />
            </div>
         </div>

         <div class="form-group d-flex align-items-center">

            <label class="col-2 col-form-label">카테고리:</label>
            <div class="form-floating col-7 ms-2 my-1">
               <c:out value="${dto.pdtcate}" />
            </div>
         </div>

         <div class="form-group d-flex align-items-center">

            <label class="col-2 col-form-label">등록날짜:</label>
            <div class="form-floating col-7 ms-2 my-1">
               <c:out value="${dto.pdtdate}" />
            </div>
         </div>

         <div class="form-group d-flex align-items-center">

            <label class="col-2 col-form-label">판매자닉네임:</label>
            <div class="form-floating col-7 ms-2 my-1">
               <c:out value="${dto.usernick}" />
            </div>
         </div>

         <div class="form-group d-flex align-items-center">

            <label class="col-2 col-form-label">상품설명:</label>
            <div class="form-floating col-7 ms-2 my-1">
               <c:out value="${dto.pdtcontent}" />
            </div>
         </div>

         <div class="form-group d-flex align-items-center">
            <label for="buyCnt" class="col-2 col-form-label">개수 선택:</label> <input
               type="number" id="buyCnt" name="bcnt" readonly="readonly" value=1>
            <div>
               <button type="button" onclick="up()">▲</button>
               <button type="button" onclick="down()">▼</button>
            </div>
         </div>

         <div class="form-group d-flex justify-content-center mt-5">
            <button class="btn btn-primary py-2 mx-5" type="button"
               onclick="pdtbuy()">구매하기</button>
            <button class="btn btn-primary py-2 mx-5" type="button"
               onclick="pdtcart()">장바구니 담기</button>
         </div>

      </form>

      <!-- 메인 종료 -->
   </main>
   <script type="text/javascript">
      function pdtbuy() {
         const buy = document.forms[1]
         buy.action = 'pdtBuyOne.jsp'
         buy.submit()

      }

      function pdtcart() {
         const cart = document.forms[1]
         cart.action = 'pdtAddCart.jsp'
         cart.submit()

      }

      function up() {
         const buyCnt = document.getElementById('buyCnt');
         const currentValue = parseInt(buyCnt.value);
         buyCnt.value = currentValue + 1;
      }

      function down() {
         const buyCnt = document.getElementById('buyCnt');
         const currentValue = parseInt(buyCnt.value);

         if (currentValue > 1) {
            buyCnt.value = currentValue - 1;
         } else {
            alert('1보다 작은 값은 입력할 수 없습니다!');
         }
      }
   </script>
   <script type="text/javascript" src=" ../js/islogin.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
      
   </script>
</body>
</html>