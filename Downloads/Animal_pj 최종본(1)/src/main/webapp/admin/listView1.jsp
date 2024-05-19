<%@page import="java.util.List"%>
<%@page import="org.iclass.dto.postDto"%>
<%@page import="org.iclass.dto.Paging"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>글 목록</title>

    <link rel="stylesheet" href="../css/002.css" />

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<style>
    /* 드롭다운 메뉴를 숨깁니다. */
    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    /* 드롭다운 메뉴의 항목 스타일 */
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    /* 드롭다운 메뉴를 표시합니다. */
    .dropdown:hover .dropdown-content {
        display: block;
    }

    .btn-secondary {
        --bs-btn-color: #fff;
        --bs-btn-bg: #5faff5;
        --bs-btn-border-color: #71bcff;
        --bs-btn-hover-color: #fff;
        --bs-btn-hover-bg: #7abdff;
        --bs-btn-hover-border-color: #77c5ff;
        --bs-btn-focus-shadow-rgb: 130, 138, 145;
        --bs-btn-active-color: #fff;
        --bs-btn-active-bg: #70c2ff;
        --bs-btn-active-border-color: #79c1ff;
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #fff;
        --bs-btn-disabled-bg: #40a5ff;
        --bs-btn-disabled-border-color: #2f9dff;
    }

    .dropdown-menu-dark {
        --bs-dropdown-bg: #5faff5;
        --bs-dropdown-link-color: white;
    }
</style>

<body class="d-flex flex-column min-vh-100 pb-0">

    <%@ include file="../css/adheader.jsp"%>

    <section class="py-5 text-center container border border-dark my-5">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">하루의 시작, 아침식사</h1>
                <p class="lead text-body-secondary">하루를 시작하는 아침식사는 삼시 세끼 중 가장
                    중요하다. 아침식사에서 반드시 보충하면 좋은 영양소는 단백질이다. 단백질은 매 끼니 조금씩 섭취하면 좋지만 아침 식사에서
                    단백질을 섭취가 쉽지 않다. 아침 식사로 좋은 단백질 식품은 그릭요거트, 달걀, 코티지치즈, 우유 등이다. 미국의 한
                    연구에서 아침식사를 고단백으로 채운 사람들의 체질량지수가 점심이나 저녁때 푸짐한 식사를 한 사람보다 낮은 것으로
                    나타났고, 일반적으로 아침식사를 한 사람들이 거른 사람들에 비해 체중을 더 낮게 유지했다고 밝혔다.</p>
                <p>
                    <a href="#" class="btn btn-primary my-2">Main call to action</a> <a
                        href="#" class="btn btn-secondary my-2">Secondary action</a>
                </p>
            </div>
        </div>
    </section>

    <!-- 메인 시작 -->
    <main id="list" class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
        style="margin-bottom: 200px;">
        <h3 class="text-primary text-opacity-25">커뮤니티</h3>
        <div class="border border-primary rounded"
            style="width: 1252px; padding: 10px;">
            <p>글목록</p>
            <form action="" method="post">
                <input type="hidden" name="status" value="">
                <div class="dropdown">

                    <button class="btn btn-secondary dropdown-toggle" type="button"
                        data-bs-toggle="dropdown" aria-expanded="false">카테고리</button>

                    <ul class="dropdown-menu dropdown-menu-dark">
                        <li>
                            <button name="bt1" value="유기동물 보호 게시판" class="dropdown-item"
                                onclick="adchange('유기동물 보호 게시판')">유기동물 보호 게시판</button>
                        </li>
                        <li>
                            <button name="bt2" value="실종" class="dropdown-item"
                                onclick="adchange('실종')">실종</button>
                        </li>

                    </ul>
                </div>
            </form>
            <br> <br>
            <hr style="color: white;">
            <div class="table-responsive small">
                <table class="table table-striped table-hover table-sm"
                    style="width: 1230px;">
                    <thead>
                        <tr>
                            <th scope="col">글 번호</th>
                            <th scope="col">작성자</th>
                            <th scope="col">제목</th>
                            <th scope="col">내용</th>
                            <th scope="col">글 카테고리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="post" items="${list}">
                            <input type="hidden" name="postidx" value=${post.postidx }>
                            <tr>
                                <td><c:out value="${post.postidx}" /></td>
                                <td>${post.usernick}</td>
                                <td><a class="text-decoration-none"
                                        href="read.jsp?postidx=${post.postidx}&page=${paging.currentPage}">${post.postitle}</a></td>
                                <td>${post.postcontent}</td>
                                <td>${post.postcate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>

                <div class="d-flex" style="float: right; margin: 40px;">

                  

                    <!-- 글쓰기 버튼 -->
                    <a href="${pageContext.request.contextPath}/adminindex.jsp" class="button ms-3">
                        <i class="bi bi-house-door" style="font-size: 35px;"></i>
                    </a>

                </div>

                <!-- 페이지 버튼 -->
                <div
                    style="width: 700px; margin: auto; padding: 10px; text-align: center;">
                    전체 글 개수:
                    <c:out value="${paging.totalCount }" />
                    <br>
                    <hr>
                    <a class="pagenum" href="?page=1">&lt;&lt;</a> <a class="pagenum"
                        href="?page=${paging.startPage-1 }"
                        style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'>&lt;</a>

                    <c:forEach var="i" begin="${paging.startPage}"
                        end="${paging.endPage}">
                        <a class="pagenum ieach" href="?page=${i }"><c:out
                                value="${i }" /></a>
                    </c:forEach>

                    <a class="pagenum" href="?page=${paging.endPage+1 }"
                        style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'>&gt;</a>

                    <a class="pagenum" href="?page=${paging.totalPage }">&gt;&gt;</a>
                </div>

            </div>
        </div>

        <!-- 메인 종료 -->
    </main>
    <!-- 푸터 시작 -->
    <footer class="container">
        <!-- 오른쪽으로 부유, 현재 페이지 맨 위 링크 -->
        <p class="float-end">
            <a href="#">Back to top</a>
        </p>
        <p class="mb-0">
            &copy; 2017–2023 Company, Inc. &middot; <a href="#">Privacy</a>
            &middot; <a href="#">Terms</a>
        </p>
        <!-- 푸터 종료 -->
    </footer>

    <script>    
        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
        const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
    </script>
    <script type="text/javascript">
        function write() {
            // JavaScript로 사용자 상태를 확인합니다.
            var userId = '<%=request.getSession().getAttribute("userid")%>';
            if (!userId || userId === '') {
                var yn = confirm('글 쓰기는 로그인이 필요합니다. 로그인 하시겠습니까?');
                if (yn) location.href = '../login.jsp?back=w';
            } else {
                location.href = 'community.jsp?page=${page}';
            }
        }
    </script>
    <script type="text/javascript">
        const pnums = document.querySelectorAll('.ieach');
        pnums.forEach(function(item) {
            console.log(item);
            if (item.innerHTML == '${paging.currentPage}') {
                item.style.color = 'black';
                item.style.fontWeight = 'bold';
            } else {
                item.style.color = '#37966f';
            }
        });
        
        const toggleBtn = document.querySelector(".dropdown-toggle");
        const dropdownMenu = document.querySelector(".dropdown-menu-dark");
        
        toggleBtn.addEventListener("click", function() {
          if (dropdownMenu.style.display === "none" || dropdownMenu.style.display === "") {
            dropdownMenu.style.display = "block";
          } else {
            dropdownMenu.style.display = "none";
          }
        });
        
		function adchange(status) {
		    const ff = document.forms[1];
		    ff.status.value = status;

		    if (status === '구매 후기') {
		        ff.action = 'list4.jsp'; // 유기동물 보호 게시판의 경우 list.jsp로 이동
		    } else if (status === '입양 후기') {
		        ff.action = 'list3.jsp'; // 실종 카테고리의 경우 list2.jsp로 이동
		    }

		    ff.submit();
		}
    </script>

    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../js/ajax-load.js"></script>
    <script src="../js/003.js"></script>
</body>
</html>
