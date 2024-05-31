<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/routePost.css" >

    <!-- icon key -->
    <script src="https://kit.fontawesome.com/7fa6781ad2.js" crossorigin="anonymous"></script>
</head>

<body>
       
    <div class="wrap">
     <!-- nav -->
       <%@ include file="../nav.jsp" %>
        
        <!-- header -->

        <div class="container">

            <div class="btn-container">
                <button class="post-btn">수정</button>
                <button class="post-btn right">삭제</button>
            </div>

            <div class="title-container">
                <!-- 이미지 영역 -->
                <div class="image-box">
                    <img src="https://via.placeholder.com/300x400.jpg" alt="">
                </div>
                <!-- 타이틀 영역 -->
                <div class="title-box">
                    <div class="icon-region">
                        <p><c:choose>
                                <c:when test="${routeBoard.boardRegion == 0}">서울</c:when>
                                <c:when test="${routeBoard.boardRegion == 1}">인천</c:when>
                                <c:when test="${routeBoard.boardRegion == 2}">대전</c:when>
                                <c:when test="${routeBoard.boardRegion == 3}">대구</c:when>
                                <c:when test="${routeBoard.boardRegion == 4}">경기</c:when>
                                <c:when test="${routeBoard.boardRegion == 5}">부산</c:when>
                                <c:when test="${routeBoard.boardRegion == 6}">울산</c:when>
                                <c:when test="${routeBoard.boardRegion == 7}">광주</c:when>
                                <c:when test="${routeBoard.boardRegion == 8}">강원</c:when>
                                <c:when test="${routeBoard.boardRegion == 9}">충북</c:when>
                                <c:when test="${routeBoard.boardRegion == 10}">충남</c:when>
                                <c:when test="${routeBoard.boardRegion == 11}">경북</c:when>
                                <c:when test="${routeBoard.boardRegion == 12}">경남</c:when>
                                <c:when test="${routeBoard.boardRegion == 13}">전북</c:when>
                                <c:when test="${routeBoard.boardRegion == 14}">전남</c:when>
                                <c:when test="${routeBoard.boardRegion == 15}">제주</c:when>
                                <c:when test="${routeBoard.boardRegion == 16}">세종</c:when>
                            </c:choose></p>
                    </div>
                    <div class="title-section">${routeBoard.boardTitle}</div>
                    <div class="writer-section">
                        <p>${routeBoard.nickname}</p><img src="check.png" alt="">
                    </div>
                    <div class="date-section">${routeBoard.boardTourdays}일</div>
                    <div class="theme-section"><c:choose>
                                <c:when test="${routeBoard.boardTheme == 1}">#나홀로 힐링</c:when>
                                <c:when test="${routeBoard.boardTheme == 2}">#연인과 데이트</c:when>
                                <c:when test="${routeBoard.boardTheme == 3}">#친구들과</c:when>
                                <c:when test="${routeBoard.boardTheme == 4}">#가족 나들이</c:when>
                                <c:when test="${routeBoard.boardTheme == 5}">#모임 단체 여행</c:when>
                            </c:choose></div>
                    <div class="mark-section">
                        <div class="likes">
                            <i class="fa-regular fa-heart"></i>
                            <!-- 클릭 변경 아이콘 -->
                            <!-- <i class="fa-solid fa-heart"></i> -->
                            <span>123</span>
                        </div>
                        <div class="bookmark">
                            <i class="fa-regular fa-bookmark"></i>
                            <!-- 글 스크랩 시 변경 아이콘 -->
                            <!-- <i class="fa-solid fa-bookmark"></i>  -->
                        </div>
                        <div class="views"><span>views</span><span> ${routeBoard.boardViews }</span></div>
                    </div>

                    <div class="point-section">
                        <!-- 아이콘 못 고르겠어.. -->
                        <i class="fa-brands fa-product-hunt fa-2x"></i>
                        <i class="fa-solid fa-coins fa-2x"></i>
                        <i class="fa-solid fa-sack-dollar fa-2x"></i>
                        <span class="price">${routeBoard.boardPoint }</span>
                    </div>
                </div>

            </div>

            <hr class="divider first">

            <!-- 경로 영역 -->
            <div class="route-container">

                <div class="route-index">
                    <div class="index-button">
                        <h1>1</h1>
                    </div>
                    <div class="index-button">
                        <h1>2</h1>
                    </div>
                    <div class="index-button">
                        <h1>3</h1>
                    </div>
                </div>

                <div class="route-box">

                    <div class="route-upperside">
                        <div class="map" id="map" style="width: 60%; height:350px;">map 들어갈 영역 가로 60%</div>
                        <div class="map-place-list-section">
                            <h2>#상세코스</h2>
                            <div class="place-list">
                            	

                            </div>
                        </div>
                    </div>

                    <div class="route-lowerside">
                        <h2># 코멘트</h2>
                        <div class="day-comment">
                            <!-- test -->
                            <p>

                                각급 선거관리위원회는 선거인명부의 작성등 선거사무와 국민투표사무에 관하여 관계 행정기관에 필요한 지시를 할 수 있다. 누구든지 체포 또는 구속을 당한 때에는
                                적부의
                                심사를 법원에 청구할 권리를 가진다. 대통령은 국민의 보통·평등·직접·비밀선거에 의하여 선출한다. 국가는 농수산물의 수급균형과 유통구조의 개선에 노력하여
                                가격안정을
                                도모함으로써 농·어민의 이익을 보호한다.
                                국회의원은 그 지위를 남용하여 국가·공공단체 또는 기업체와의 계약이나 그 처분에 의하여 재산상의 권리·이익 또는 직위를 취득하거나 타인을 위하여 그 취득을
                                알선할 수
                                없다. 국회의원이 회기전에 체포 또는 구금된 때에는 현행범인이 아닌 한 국회의 요구가 있으면 회기중 석방된다. 대통령은 제1항과 제2항의 처분 또는 명령을 한
                                때에는
                                지체없이 국회에 보고하여 그 승인을 얻어야 한다.


                                There are many variations of passages of Lorem Ipsum available, but the majority have
                                suffered alteration in some form, by injected humour, or randomised words which don't
                                look
                                even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to
                                be
                                sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum
                                generators on the Internet tend to repeat predefined chunks as necessary, making this
                                the
                                first true generator on the Internet. It uses a dictionary of over 200 Latin words,
                                combined
                                with a handful of model sentence structures, to generate Lorem Ipsum which looks
                                reasonable.
                                The generated Lorem Ipsum is therefore always free from repetition, injected humour, or
                                non-characteristic words etc.
                                There are many variations of passages of Lorem Ipsum available, but the majority have
                                suffered alteration in some form, by injected humour, or randomised words which don't
                                look
                                even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to
                                be
                                sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum
                                generators on the Internet tend to repeat predefined chunks as necessary, making this
                                the
                                first true generator on the Internet. It uses a dictionary of over 200 Latin words,
                                combined
                                with a handful of model sentence structures, to generate Lorem Ipsum which looks
                                reasonable.
                                The generated Lorem Ipsum is therefore always free from repetition, injected humour, or
                                non-characteristic words etc.

                            </p>

                        </div>
                    </div>

                </div>


            </div>

            <hr class="divider second">

            <!-- 총평 영역 -->
            <div class="review-container">
                <h2># 총평</h2>
                <div class="review-section">
                    <p>
                        대한민국의 국민이 되는 요건은 법률로 정한다. 연소자의 근로는 특별한 보호를 받는다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다. 대법원은 법률에 저촉되지 아니하는
                        범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국가는 균형있는 국민경제의 성장 및 안정과 적정한 소득의 분배를 유지하고, 시장의
                        지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다. 통신·방송의 시설기준과 신문의 기능을 보장하기
                        위하여 필요한 사항은 법률로 정한다. 국가안전보장에 관련되는 대외정책·군사정책과 국내정책의 수립에 관하여 국무회의의 심의에 앞서 대통령의 자문에 응하기 위하여
                        국가안전보장회의를 둔다.

                        대통령의 임기는 5년으로 하며, 중임할 수 없다. 모든 국민은 자기의 행위가 아닌 친족의 행위로 인하여 불이익한 처우를 받지 아니한다. 정당은 법률이 정하는 바에 의하여
                        국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다. 국가는 사회보장·사회복지의 증진에 노력할 의무를 진다. 사회적 특수계급의
                        제도는 인정되지 아니하며, 어떠한 형태로도 이를 창설할 수 없다. 감사위원은 원장의 제청으로 대통령이 임명하고, 그 임기는 4년으로 하며, 1차에 한하여 중임할 수 있다.
                        모든 국민은 헌법과 법률이 정한 법관에 의하여 법률에 의한 재판을 받을 권리를 가진다.

                        Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of
                        classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a
                        Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin
                        words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in
                        classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32
                        and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,
                        written in 45 BC. This book is a treatise on the theory of ethics, very popular during the
                        Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in
                        section 1.10.32.

                        The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.
                        Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced
                        in their exact original form, accompanied by English versions from the 1914 translation by H.
                        Rackham.
                    </p>
                </div>
            </div>

            <!-- 댓글영역 -->
            <div class="comment-container">
                <h2>댓글</h2>
                <div class="comment-section">
               <div id="no-comments-message" style="display: none;">작성된 댓글이 없습니다.</div>
                    <div class="comment-box">
                         
                        <div class="each-comment">
                            <div class="comment-nickname">
                                <p>예원의 뽀대왕쟈님</p>
                            </div>
                            <div class="comment-content">
                                김예원님 한글 공백포함 400글자로 제한하겠습니다. 감사합니다. 수정 / 삭제 버튼은 css 안 넣어두겠습니다.
                            </div>
                            <div class="comment-date">2024.05.18</div>
                            <div class="edit-section">
                                <button class="edit-button">수정</button>
                                <button class="delete-button">삭제</button>
                            </div>
                        </div>

                        <div class="each-comment">
                            <div class="comment-nickname">
                                <p>김예원</p>
                            </div>
                            <div class="comment-content">
                                왜냐하면 위치 잡는중이걸랑요 꾸벅~ 다른 댓글들은 남이 썼을 때~~ 테스트~~
                            </div>
                            <div class="comment-date">2024.05.18</div>
                        </div>

                        <div class="each-comment">
                            <div class="comment-nickname">
                                <p>테스트중</p>
                            </div>
                            <div class="comment-content">
                                css 완성 아닙니다. 세부 수정 해야 해요~~! 
                            </div>
                            <div class="comment-date">2024.05.18</div>
                        </div>

                        <div class="each-comment">
                            <div class="comment-nickname">
                                <p>4th글쓴이</p>
                            </div>
                            <div class="comment-content">
                                김예원님 한글 공백포함 400글자로 제한하겠습니다. 감사합니다. 연소자의 근로는 특별한 보호를 받는다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다.
                                대법원은
                                법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국가는 균형있는 국민경제의 성장 및 안정과
                                적정한
                                소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다.
                                통신·방송의 시설기준과 신문의 기능을 보장하기 위하여 필요한 사항은 법률로 정한다. 국가안전보장에 관련되는 대외정책·군사정책과 국내정책의 수립에 관하여
                                국무회의의
                                심의에 앞서 대통령의 자문에 응하기 위하여 국가안전보장회의를 둔다.
                            </div>
                            <div class="comment-date">2024.05.18</div>
                        </div>

                        <div class="each-comment">
                            <div class="comment-nickname">
                                <p>5th글쓴이</p>
                            </div>
                            <div class="comment-content">
                                김예원님 한글 공백포함 400글자로 제한하겠습니다. 감사합니다. 연소자의 근로는 특별한 보호를 받는다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다.
                                대법원은
                                법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국가는 균형있는 국민경제의 성장 및 안정과
                                적정한
                                소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다.
                                통신·방송의 시설기준과 신문의 기능을 보장하기 위하여 필요한 사항은 법률로 정한다. 국가안전보장에 관련되는 대외정책·군사정책과 국내정책의 수립에 관하여
                                국무회의의
                                심의에 앞서 대통령의 자문에 응하기 위하여 국가안전보장회의를 둔다.
                            </div>
                            <div class="comment-date">2024.05.18</div>
                        </div>
                    </div>
                    <form action="#">
                        <div class="write-comment-section">

                            <textarea class="write-comment-form" name="" id="" placeholder="불쾌감을 주는 댓글은 무통보 삭제됩니다."></textarea>
                            <!-- <button class="add-comment-button">등록</button> -->
                            <button class="add-comment-button arrow"><i class="fa-solid fa-arrow-up"></i></button>
                        </div>
                    </form>

                </div>
            </div><!-- 댓글 영역 끝-->
            <div class="return-to-list-button"><button>목록보기</button></div>
        </div>
		<%@ include file="../footer-sub.jsp" %>
    </div>
	
    
</body>

<script>

    var indexBtn = document.getElementsByClassName("index-button");

    function handleClick(event) {

        if (event.currentTarget.classList.contains("clicked")) {

            event.currentTarget.classList.remove("clicked");
        } else {
            for (var i = 0; i < indexBtn.length; i++) {
                indexBtn[i].classList.remove("clicked");
            }
            event.currentTarget.classList.add("clicked");
        }
    }

    function init() {

        if (indexBtn.length > 0) {
            indexBtn[0].classList.add("clicked");
        }

        for (var i = 0; i < indexBtn.length; i++) {
            indexBtn[i].addEventListener("click", handleClick);
        }
    }

    init();
</script>

<script>
    function checkComments() {
        var comments = document.getElementsByClassName("each-comment");
        var noCommentsMessage = document.getElementById("no-comments-message");
        
        if (comments.length === 0) {
            noCommentsMessage.style.display = "block";
        } else {
            noCommentsMessage.style.display = "none";
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        checkComments();
    });
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b9e8d47e0abc983759ff27255e96150"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(${routeBoard.days[0].markers[0].latitude}, ${routeBoard.days[0].markers[0].longitude}), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [];
<c:forEach var="marker" items="${routeBoard.days[0].markers}" varStatus="innerLoop">
    positions.push({
        title: '<c:out value="${marker.title}" />', 
        /* latlng: new kakao.maps.LatLng(33.450705, 126.570677) */
        latlng: new kakao.maps.LatLng(<c:out value="${marker.latitude}" />, <c:out value="${marker.longitude}" />)
    });
 </c:forEach>

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}

var dayIndex = 1;
</script>



</html>