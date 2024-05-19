<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>커뮤니티</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />
<link rel="stylesheet" href="../css/006.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>

<body class="d-flex flex-column min-vh-100 pb-0">

	<!-- 헤더 시작 -->
	<%@ include file="../css/header.jsp"%>

	<!-- 메인 시작 -->
	<main id="read" style="margin-bottom: 200px;">

		<h3 class="text-primary text-opacity-10 mt-5">커뮤니티</h3>

		<div style="margin: auto; max-width: 760px;">

			<hr style="border: 2px solid navy;">
			<ul id="table">
				<li>
					<ul class="row">
						<li><c:out value="${vo.postitle}" /></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</li>
				<li>
					<ul class="row">
						<li style="font-weight: normal;"><c:out
								value="${vo.usernick}" /></li>
						<li><fmt:formatDate value="${vo.posttime}" type="both" /></li>
						<li>조회수</li>
						<li><c:out value="${vo.viewcnt}" /></li>
					</ul>
				</li>
				<li id="content">
					<hr style="border: 2px solid navy;">
					<ul>
						<li></li>
						<li class="border rounded p-3"><img
							style="img-fit: cover; width: 100%; height: 100%;"
							alt="${vo.postpic}" src="/upload/${vo.postpic}"
							style="border: 1px solid gray; margin-bottom: 5px; width: 400px; height: 400px;">
							<pre><c:out value="${vo.postcontent}" />
							</pre></li>
					</ul>
				</li>
			</ul>
			<div style="text-align: center; margin-bottom: 10px;">
				<form action="" method="post">
					<c:if test="${user.usernick eq vo.usernick}">
						<input type="hidden" name="postidx" value="${vo.postidx}">
						<input type="hidden" name="page" value="${page}">
						<a class="button" href="javascript:formexecute(1)">수정</a>
						<a class="button" href="javascript:formexecute(2)">삭제</a>
					</c:if>
					<a class="button" href="list.jsp?page=${page}">목록</a>
				</form>
			</div>

			<script type="text/javascript">
            function execute(f){
                let url;
                let message;
                if(f === 1){
                    message = '글 수정하시겠습니까?';
                } else if(f === 2){
                    message = '글 삭제하시겠습니까?';
                }
                const yn = confirm(message);
                if(yn) {
                    url = (f === 1) ? 'update.jsp?postidx=' + ${vo.postidx} : (f === 2) ? 'delete.jsp?postidx=' + ${vo.postidx} : '#';
                    location.href=url+'&page='+${page};
                } else {
                    alert('취소합니다.');
                }
            }
            function formexecute(f){
                let url;
                let message;
                if(f === 1){
                    message = '글 수정하시겠습니까?';
                } else if(f === 2){
                    message = '글 삭제하시겠습니까?';
                }
                const yn = confirm(message);
                if(yn) {
                    url = (f === 1) ? 'update.jsp' : (f === 2) ? 'delete.jsp' : '#';
                    document.forms[1].action=url
                    document.forms[1].submit()
                } else {
                    alert('취소합니다.');
                }
            }
        </script>

			<hr>
			<!-- 댓글 등록/삭제를 위한 form. 댓글 수정은 구현 안합니다. -->
			<form action="commentAction.jsp" method="post">
				<input type="hidden" name="postidx" value="${vo.postidx}"> <input
					type="hidden" name="commentidx" value="0"> <input
					type="hidden" name="commentnick" value="${user.usernick}">
				<input type="hidden" name="f" value="0"> <input
					type="hidden" name="page" value="${page}">

				<c:if test="${vo.postcate == '실종' or vo.postcate == '유기동물 보호 게시판'}">
				<ul>
					<li>
						<ul class="row">
							<li>작성자</li>
							<li><input name="commentnick" class="input"
								value="${user.usernick}" readonly></li>
						</ul>
					</li>
					<li>
						<ul style="display: flex;">
							<li><textarea rows="5" cols="80" name="commentContent"
									style="resize: none; margin-right: 20px;"
									placeholder="타인의 권리를 침해하거나 명예를 훼손하는 댓글은 운영원칙 및 관련 법률에 제재를 받을 수 있습니다."
									class="input"></textarea></li>
							<li style="align-self: center; margin-bottom: 20px;"><c:if
									test="${sessionScope.user != null}">
									<button class="btn btn-primary rounded-pill" type="button"
										onclick="executeCmt(1,0)">저장</button>
								</c:if> <c:if test="${sessionScope.user == null}">
									<button type="button" onclick="location.href='../login.jsp'">로그인</button>
								</c:if></li>
						</ul>
					</li>
					<li><span>댓글</span> <span>[<c:out
								value="${vo.commentcnt}" />]
					</span>
						<hr></li>

					<!-- 댓글 목록 : cmtlist 애트리뷰트 필요. -->
					<c:forEach var="cmt" items="${cmtlist}">
						<li>
							<ul class="crow">
								<li><c:out value="${cmt.commentnick}" /></li>
								<li><c:out value="${cmt.commentDate}" /></li>
								<c:if test="${user.usernick==cmt.commentnick}">
									<li><a href="javascript:executeCmt(2,'${cmt.commentidx}')">삭제</a></li>
								</c:if>
							</ul>
						</li>
						<li><pre class="cmtcontent"><c:out value="${cmt.commentContent}" />
							</pre></li>
					</c:forEach>

				</ul>
				</c:if>
			</form>

		</div>
	</main>

	<!-- 푸터 시작 -->
	<%@ include file="../css/footer.jsp"%>

	<script type="text/javascript">
    function executeCmt(fval, cidx) {
        const frm = document.forms[2];
        if (fval === 1) {
            if (frm.commentContent.value == '') {
                alert('글 내용은 필수 입력입니다.');
                frm.commentContent.focus();
                return;
            } else {
                frm.f.value = fval;
                frm.submit();
            }
        } else if (fval === 2) {
            const yn = confirm('댓글 삭제 하시겠습니까?');
            if (yn) {
                frm.f.value = fval;
                frm.commentidx.value = cidx;
                frm.submit();
            }
        }
    }
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
