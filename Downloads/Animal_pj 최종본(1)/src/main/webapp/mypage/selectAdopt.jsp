<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dto.AdoptDto"%>
<%@page import="org.iclass.dao.AdoptDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />

<title>입양 내역</title>

<!-- 커스텀 스타일 시트 불러오기 -->
<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet" />

<style type="text/css">
a.btnBlueGreen {
   display: block;
   position: relative;
   float: left;
   width: 120px;
   padding: 0;
   margin: 10px 20px 10px 0;
   font-weight: 600;
   text-align: center;
   line-height: 50px;
   color: #fff;
   border-radius: 5px;
   transition: all 0.2s;
}

.btnBlueGreen {
   background: #00ae68;
}

/* FADE */
.btnFade.btnBlueGreen:hover {
   background: #21825b;
}

.btnBlueGreen.btnPush {
   box-shadow: 0px 5px 0px 0px #007144;
}

.btnBlueGreen.btnPush:hover {
   box-shadow: 0px 0px 0px 0px #007144;
}

/* BORDER */
.btnBlueGreen.btnBorder {
   box-shadow: 0px 0px 0px 0px #21825b;
}

.btnBlueGreen.btnBorder:hover {
   box-shadow: 0px 0px 0px 5px #21825b;
}

.btnBlueGreen.btnFloat:before {
   background: #00ae68;
}

/* SLIDE */
.btnSlide.btnBlueGreen {
   background: 0;
}

.btnSlide.btnBlueGreen .top {
   background: #00ae68;
}

.btnPush:hover {
   margin-top: 15px;
   margin-bottom: 5px;
}
</style>
</head>

<body class="d-flex flex-column min-vh-100 pb-0">

   <!-- 헤더 시작 -->
   <%@ include file="../css/header.jsp"%>

   <!-- 메인 시작 -->
   <main style="margin-bottom: 200px; margin-top: 70px;">

      <h1 style="text-align: center; margin: 50px;">입양 내역</h1>
      
      <%
      // AdoptDao의 인스턴스 생성
      AdoptDao adoptDao = AdoptDao.getInstance();
      usersDto udtos = (usersDto) session.getAttribute("user");
      String id = udtos.getUserid();
      // 사용자 ID에 해당하는 입양 내역 조회
      List<AdoptDto> adoptionList = adoptDao.selectAdoptByUSERID(id);

      // 조회된 입양 내역 출력
      for (AdoptDto adoption : adoptionList) {
      %>

      <div class="form-signin w-100 m-auto border border-dark px-5">

         <div style="margin: 5px; text-align: center;">
            <img alt="${adoption.filename}" src="<%=adoption.getFilename()%>"
               style="border: 1px solid gray; width: 400px; height: 400px;">
         </div>

         <div class="border p-1" style="margin: 0px 80px;">
            <div class="form-group d-flex align-items-center">

               <label class="col-3 col-form-label">입양번호:</label>

               <div class="form-floating col-7 ms-2 my-1">
                  <%=adoption.getAdoptidx()%>
               </div>

            </div>

            <div class="form-group d-flex align-items-center">

               <label class="col-3 col-form-label">동물 아이디:</label>

               <div class="form-floating col-7 ms-2 my-1">
                  <%=adoption.getAniid()%>
               </div>

            </div>

            <div class="form-group d-flex align-items-center">

               <label class="col-3 col-form-label">입양날짜:</label>

               <div class="form-floating col-7 ms-2 my-1">
                  <%=adoption.getAdoptdate()%>
               </div>

            </div>
         </div>

         <form action="reviewAdopt.jsp" method="post"
            style="margin-bottom: 90px; margin-left: 80px;">
            <input type="hidden" name="adoptIdx"
               value="<%=adoption.getAdoptidx()%>"> <a type="submit"
               title="Button push blue/green" class="button btnPush btnBlueGreen">
               <button class="btn bg-transparent border-0"
                  style="font-weight: bold;" type="submit">리뷰 작성</button>
            </a>
         </form>
      </div>
      <br>
      
      <%
      }
      %>
      
      <!-- 메인 종료 -->
   </main>

   <!-- 푸터 시작 -->
   <%@ include file="../css/footer.jsp"%>

   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>