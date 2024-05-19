<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>       
<!DOCTYPE html>
<html>
<head>
    <title>보호소 커뮤니티</title>
    <meta charset="UTF-8">
</head>
<body>
    <main id="write">
        <h3>유기동물 보호중 :: 커뮤니티</h3>
        <hr style="color:white;">
        <form method="post" action="createpostaction.jsp" onsubmit="return isValid()" enctype="multipart/form-data">
            <table>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" name="postitle" size="50">	
                    </td>
                </tr>
                <tr>
				<th>작성자</th>
				<td>
				<input type="text" name="usernick" size="50" value="${user.userid}">
				</td>
				</tr>
                
                <tr>
                    <th>내용</th>  
                    <td>
                        <textarea rows="30" cols="80" name="postcontent"></textarea>
                    </td>
                </tr>
               <tr>
    		<th>사진 첨부 (jpg 파일만 가능)</th>
    		<td>
        <input type="file" name="postpic" accept="image/jpg">
    		</td>
			</tr>

                <tr>
                    <td colspan="2" align="center">
                        <button type="submit">저장</button>
                        <button type="reset">다시쓰기</button>
                        <button type="button" onclick="location.href='listView.jsp'">목록</button>  
                    </td>
                </tr>
            </table>
        </form>
    </main> 
    <script type="text/javascript">
        function isValid() {
            let result = true;
            const content = document.forms[0].postcontent;
            const title = document.forms[0].postitle;

            if (title.value == '') {
                alert('글 제목 작성은 필수 입니다.');
                result = false;
                title.focus();
            }

            if (content.value == '') {
                alert('글 내용 작성은 필수 입니다.');
                result = false;
                content.focus();
            }

            return result;
        }
    </script>
</body>
</html>
