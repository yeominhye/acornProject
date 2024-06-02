<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
     <link href="https://cdn.jsdelivr.net/npm/quill@2.0.1/dist/quill.snow.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/quill@2.0.1/dist/quill.js"></script>
    <link  rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/atom-one-dark.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/routePost2.css" >
	<script defer src="${pageContext.request.contextPath}/resources/js/map.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	

    <!-- icon key -->
    <script src="https://kit.fontawesome.com/7fa6781ad2.js" crossorigin="anonymous"></script>
    
</head>
<script type="text/javascript">    
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#coverImagePreview').attr('src', e.target.result).show();
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
 // editor의 내용 input으로 전달
		function send(){
  	
			document.getElementById("contentMessage").style.display = "none";
  
		  	let editor  = document.querySelector(".ql-container");
		  	let content =  editor.innerHTML;
		  	let  boardContent  = document.querySelector("#boardContent");
		  	boardContent.value= content;
		  	
		    document.frm.submit();

  }
  
</script>
<body>
       
    <div class="wrap">
     <!-- nav -->
       <%@ include file="../nav.jsp" %>
        
        <!-- header -->

        <div class="container">
			<form action="/project/board/createMap_process.do" method="post" id="createMapForm" name="frm" enctype="multipart/form-data">	
            <div class="title-container">
                <!-- 이미지 영역 -->
                <div class="image-box">
                    <div id="img-container"></div>
                    <input class="imgUploader" type="file"  name="boardImg" accept="image/*" onchange="loadFiles(this)" >
                </div>
                <!-- 타이틀 영역 -->
               
                <div class="title-box">
         		    <input type="hidden" id="userCode" name="userCode" value="${user.userCode}">
                    <div class="icon-region">
                        <select name="boardRegion" id="boardRegion" required>
		                    <option value="0">서울</option>
		                    <option value="1">인천</option>
		                    <option value="2">대전</option>
		                    <option value="3">대구</option>
		                    <option value="4">경기</option>
		                    <option value="5">부산</option>
		                    <option value="6">울산</option>
		                    <option value="7">광주</option>
		                    <option value="8">강원</option>
		                    <option value="9">충북</option>
		                    <option value="10">충남</option>
		                    <option value="11">경북</option>
		                    <option value="12">경남</option>
		                    <option value="13">전북</option>
		                    <option value="14">전남</option>
		                    <option value="15">제주</option>
		                    <option value="16">세종</option>
	                	</select>
                    </div>
                    <div class="title-section">제목: <input type="text" id="boardTitle" name="boardTitle" placeholder="제목" required></div>
                    <div class="writer-section">
                        <p>${routeBoard.nickname}</p><img src="check.png" alt="">
                    </div>
                    <div class="date-section"> 날짜: <input type="text" id="boardTourdays" name="boardTourdays" readonly required></div>
                    <div class="theme-section"> 카테고리: 
                    	<select name="boardTheme" id="boardTheme" required>
		                    <option value="1">나홀로 힐링</option>
		                    <option value="2">연인과 함께</option>
		                    <option value="3">친목 다지기~</option>
		                    <option value="4">가족 나들이</option>
		                    <option value="5">모임 여행</option>
	                	</select>
                    </div>
                    
                    <div class="point-section">
                        <i class="fa-brands fa-product-hunt fa-2x"></i>
                       <input type="number" id ="boardPoint" min="0" value="0" step="100" name="boardPoint" class="price" required>
                    </div>
                    
                  
                </div>
                
                 <div class="review-container">
	                <h2># 총평</h2>
	                 <!-- Create the editor container -->
				    <div id="contentMessage" style="display:none; color:red;"></div>
				    <div id="toolbar-container">
						
				        <span class="ql-formats">
				          <select class="ql-font"></select>
				          <select class="ql-size"></select>
				        </span>
				        <span class="ql-formats">
				          <button class="ql-bold"></button>
				          <button class="ql-italic"></button>
				          <button class="ql-underline"></button>
				          <button class="ql-strike"></button>
				        </span>
				        <span class="ql-formats">
				          <select class="ql-color"></select>
				          <select class="ql-background"></select>
				        </span>
				        <span class="ql-formats">
				          <button class="ql-script" value="sub"></button>
				          <button class="ql-script" value="super"></button>
				        </span>
				        <span class="ql-formats">
				          <button class="ql-header" value="1"></button>
				          <button class="ql-header" value="2"></button>
				          <button class="ql-blockquote"></button>
				          <button class="ql-code-block"></button>
				        </span>
				        <span class="ql-formats">
				          <button class="ql-list" value="ordered"></button>
				          <button class="ql-list" value="bullet"></button>
				          <button class="ql-indent" value="-1"></button>
				          <button class="ql-indent" value="+1"></button>
				        </span>
				        <span class="ql-formats">
				          <button class="ql-direction" value="rtl"></button>
				          <select class="ql-align"></select>
				        </span>
				        <span class="ql-formats">
				          <button class="ql-link"></button>
				          <button class="ql-image"></button>
				          <button class="ql-video"></button>
				          <button class="ql-formula"></button>
				        </span>
				        <span class="ql-formats">
				          <button class="ql-clean"></button>
				        </span>
				      </div>
				    
				      <div id="editor"></div>
				      <input type="hidden" id="boardContent" name="boardContent" required>
	            </div>
            </div>
			</form>
			
			
            <hr class="divider first">

            <!-- 경로 영역 -->
            <div class="route-container">

                <div class="route-index">
                    <div class="index-button">
                        <h1>1</h1>
                    </div>
                    <div class="index-button">
                        <button type="button" id="addDayBtn">일정 추가</button>
                    </div>
                </div>

                <div class="route-box">

                    <div class="route-upperside">
                        <div class="map" id="map" ></div>
                        <div class="toolTab">
			                <div class="toolBtn">
			                    <button id="myButton">
			                        <div class="btnImg">
			                            <img src="${pageContext.request.contextPath}/resources/img/search.png" alt="">
			                        </div>
			                        Search
			                    </button>
			                </div>
			                <div class="toolBtn">
			                    <button id="test">
			                        <div class="btnImg">
			                            <img src="${pageContext.request.contextPath}/resources/img/checkmark.png" alt="">
			                        </div>
			                        Test
			                    </button>
			                </div>
			                <div class="toolBtn">
			                    <button id="line">
			                        <div class="btnImg">
			                            <img src="${pageContext.request.contextPath}/resources/img/gps-route.png" alt="">
			                        </div>
			                        Line
			                    </button>
			                </div>
			                <div class="toolBtn">
			                    <button id="linedelete">
			                        <div class="btnImg">
			                            <img src="${pageContext.request.contextPath}/resources/img/eraser.png" alt="">
			                        </div>
			                        Delete
			                    </button>
			                </div>
			            </div>
                        
                        <div id="searchTab" class="bg_white" class="slide">
			                <div class="option">
			                    <div>
			                    <form onsubmit="searchPlaces(); return false;">
			                    <input type="text" class="searchInput" value="이태원 맛집" id="keyword" size="5"> 
			                    <button type="submit">검색하기</button> 
			                	</form>
			                    </div>
			               </div>
			                <hr>
			                <ul id="placesList"></ul>
			                <div id="pagination"></div>
			            </div>
			            
			               <div class="btn-container">
							   <button class="cancle-button" onclick="history.back()">목록보기</button>
							   <button type="button" onclick="send()" class="submit-button" > 전체 저장</button>
				            </div>
                    </div>

					<form action="/project/board/dayPlans.do" method="post" id="dayPlanForm">
	                    <div class="route-lowerside">
	                    	<div class="map-place-list-section">
	                            <h2>#상세코스</h2>
	                            <div class="place-list">
								    <input type="hidden" name="days[${dayIndex - 1}].day" id="dayIndex" placeholder="dayIndex" required> 
								    <div id="clickLatlng" class="click"></div>
		                        </div>
	                        </div>
	                    	<div class="day-comment-list">
		                        <h2># 코멘트</h2>
		                        <div class="day-comment">
		                        <textarea rows="" cols="" name="days[${dayIndex - 1}].dayInfo" id="dayInfo" placeholder="간단한 설명을 작성해주세요." required class="commentTextarea"></textarea>	                        </div>
	                        </div>
	                       
	                    </div>
	                    <button type="button" id="dayBtn">임시 저장</button>
					</form>
                </div>


            </div>

     
            <div class="return-to-list-button"></div>
        </div>
		<%@ include file="../footer-sub.jsp" %>
    </div>
	
	<!-- Include the Quill library -->
	<script src="https://cdn.jsdelivr.net/npm/quill@2.0.1/dist/quill.js"></script>
	
	<!-- Initialize Quill editor -->
	<script>
	const quill = new Quill('#editor', {
	  modules: {
	    syntax: true,
	    toolbar: '#toolbar-container',
	  },
	  placeholder: 'Compose an epic...',
	  theme: 'snow',
	});
	</script>
	
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e4e2ed92d2d2bdb6c1837e8f4e3094f&libraries=services,clusterer,drawing"></script>
	<script>
		$(document).ready(function() {
		    var dayIndex = 1; 
		    var toggle = 0;
		
		    document.getElementById("boardTourdays").value = dayIndex;
		    document.getElementById("dayIndex").value = dayIndex;
		
		    $("#addDayBtn").on('click', function() {
		        if (toggle === 1) {
		            dayIndex++;
		            document.getElementById("dayIndex").value = dayIndex;
		            document.getElementById("boardTourdays").value = dayIndex;    
		            document.getElementById("dayInfo").value = '';
		            document.getElementById("clickLatlng").innerHTML = '';
		            deleteAll();
		            toggle = 0;
		        } else {
		            alert("저장한 후에 일정을 추가해주세요.");
		        }
		    });
		
		    $("#dayBtn").on('click', function() {
		        var dayInfo = $("#dayInfo").val();
		        var clickLatlngDiv = document.getElementById("clickLatlng");
		        var positionInfos = clickLatlngDiv.getElementsByClassName("positionInfo");
		        
		        if (positionInfos.length === 0) {
		            alert("명소를 추가해주세요.");
		            return;
		        }
		        
		        var jsonData = {
		            day: dayIndex,
		            dayInfo: dayInfo,
		            markers: []
		        };
		        
		        var valid = true;
		        
		        for (var i = 0; i < positionInfos.length; i++) {
		            var positionInfo = positionInfos[i];
		            var markerIndex = i;
		            var title = positionInfo.querySelector("#markerTitle_" + markerIndex).value;
		            var latitude = positionInfo.querySelector("#latitude_" + markerIndex).value;
		            var longitude = positionInfo.querySelector("#longitude_" + markerIndex).value;
		            var position = positionInfo.querySelector("#position_" + markerIndex).value;
		            var explain = positionInfo.querySelector("#explain_" + markerIndex).value;
		            
		            if (!title || !latitude || !longitude || !position || !explain) {
		                valid = false;
		                break;
		            }
		            
		            var markerData = {
		                title: title,
		                latitude: latitude,
		                longitude: longitude,
		                position: position,
		                explain: explain
		            };
		            jsonData.markers.push(markerData);
		        }
		
		        if (!valid) {
		            alert("모든 필드를 채워주세요.");
		            return;
		        }
		        $.ajax({
		            type: "POST",
		            url: "${pageContext.request.contextPath}/board/dayPlans.do",
		            contentType: "application/json",
		            data: JSON.stringify(jsonData),
		            success: function(data) {
		                console.log("Success:", data);
		                alert('저장 성공!');
		                toggle = 1;
		            },
		            error: function(error) {
		                console.error("Error:", error);
		            }
		        });
		    });
		});
		
		
	</script>
	
	<script>

    function loadFiles(input) {
        const files = input.files;
        const container = document.getElementById('img-container');

        container.innerHTML = '';

        const maxPreviews = 3;
        for (let i = 0; i < Math.min(files.length, maxPreviews); i++) {
            const file = files[i];
            const newImage = document.createElement("img");

            newImage.src = URL.createObjectURL(file);
            newImage.style.width = "100%";
            newImage.style.height = "100%";
            newImage.style.objectFit = "cover";

            const imgContainer = document.createElement('div');
            imgContainer.className = 'uploadImg';
            imgContainer.appendChild(newImage);
            container.appendChild(imgContainer);
        }
    }

	</script>

</body>
</html>