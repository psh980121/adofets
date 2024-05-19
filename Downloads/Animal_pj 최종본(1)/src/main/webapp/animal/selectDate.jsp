<%@page import="org.iclass.dto.Animal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문예약하기</title>
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=fd0458dd2581769bcd6f4a1afd2cc428&libraries=services"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style type="text/css">
input[type="date"] {
        border: none;
        position: relative; 
        width: 50%;
        padding: 10px;
        background: url(cat.png) no-repeat right 10px
          center / 35px auto; 
        background-color: #bbbbbb;
        box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
        text-align: center;
        font-size: 100%;
      }

      /* 실제 캘린더 아이콘을 클릭하는 영역을 의미하는 선택자
      이 영역을 확장해서 input의 어떤 곳을 클릭해도 캘린더를 클릭한 것과 같은 효과를 만들자! */
      input[type="date"]::-webkit-calendar-picker-indicator {
        position: absolute; 
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background: transparent; 
        color: transparent; 
        cursor: pointer;
      }

      /* type이 date인 input의 placeholder를 커스텀하기 위한 선택자
      기본적으로 type date인 input은 placeholder가 먹히지 않기 때문이다! */
      input[type="date"]::before {
        content: attr(
          placeholder
        ); 
        width: 100%;
        height: 100%;
      }

      /* input에 어떠한 유효값이 입력된 상태인지 확인하는 선택자
      날짜를 선택하면 유효값이 입력된다.
      이 속성을 활용하고자 한다면 반드시 태그에 required 속성을 달아줘야한다. */
      input[type="date"]:valid::before {
        display: none; 
      }
</style>
</head>
<body style="text-align: center;">
<h3 class="mt-2">오시는 길</h3>
<div id="map" style="width:550px;height:350px; margin: auto; border: 1px solid black;"></div>

<%
// 세션에서 변수 읽기
Animal animal = (Animal) session.getAttribute("Animal");

// 변수가 null인지 확인하고 사용
String desertionNo = "";
String age = "";
String careAddr = "";
String careNm = "";
String filename= "";

if (animal != null) {
    desertionNo = animal.getDesertionNo();
    age = animal.getAge();
    careAddr = animal.getCareAddr();
    careNm = animal.getCareNm();
    filename = animal.getFilename();
    // 이하 변수들을 사용하십시오.
} else {
   out.print("오류");
}
%>

<p>동물 번호: <%= desertionNo %></p>
<p>보호소 주소: <%= careAddr %></p>
<p>보호소 이름: <%= careNm %></p>

<!-- selectedItem 정보를 파라미터로 전달 -->
<form action="SaveToDB.jsp" method="post">
    <input type="hidden" name="desertionNo" value=<%= desertionNo %>>
    <input type="hidden" name="careAddr" value=<%= careAddr %>>
    <input type="hidden" name="filename" value=<%= filename %>>
    
    <!-- selectedItem 정보를 추가 -->
    
    <div class="d-flex justify-content-center"> 
    <input
      type="date"
      placeholder="날짜를 선택해주세요."
      required
      value="{props.date}"
      onChange="{props.changeHandler}"
      id="dateInput"
      name="selectedDate" required
      min="{props.isFullRange"? undefined:getDate()}
    />
    <button class="btn btn-outline-secondary ms-4" id="saveButton">저장하기</button></div>
</form>

<script>
    var geocoder = new kakao.maps.services.Geocoder();
    var addr = '<%= careAddr %>';
    var latitude = null; // 위도
    var longitude = null; // 경도
    
    var callback = function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            console.log(result);
        
             latitude = result[0].y; // 위도
             longitude = result[0].x; // 경도

        }
    };
    
    geocoder.addressSearch(addr, function(result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
          // 결과값으로 받은 위치를 마커로 표시합니다
          var marker = new kakao.maps.Marker({
            map: map,
            position: coords
          });

          // 인포윈도우로 장소에 대한 설명을 표시합니다
          var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%= careNm %></div>'
          });
          infowindow.open(map, marker);

          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
          map.setCenter(coords);
        }
      });

    var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
    var mapOption = {
            center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
            level: 4, // 지도의 확대 레벨
            mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
        }; 

    // 지도를 생성한다 
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 현재 날짜 가져오기
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    var day = today.getDate();

    if (month < 10) {
        month = '0' + month;
    }

    if (day < 10) {
        day = '0' + day;
    }

    // 현재 날짜를 yyyy-mm-dd 형식으로 구성
    var minDate = year + '-' + month + '-' + day;

    // dateInput 요소의 min 속성 설정
    document.getElementById('dateInput').setAttribute('min', minDate);
</script>
</body>
</html>
