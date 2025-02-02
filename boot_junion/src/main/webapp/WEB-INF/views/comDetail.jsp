<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기업상세정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jobpostingIndividualSupport.css"> -->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>-->
<!-- 지도 API -->
<script type="text/javascript"
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48ca63ceb0746787c922c8da8f33b705&libraries=services"></script>

</head>
<style>
	:root 
	{
	  /* 컬러 모음 */
	  --main-color:#FFA500;
	  --color-black: #111;
	  --color-white: #fff;
	  --color-gray: #787878;
	  --input-gray: #e5e5ec;
	  --button-gray: #f7f7f7;
	  --border-color-gray: #dadada;
	  --font-size32: 32px;
	  --font-size24: 24px;
	  --font-size20: 20px;
	  --font-size16: 16px;
	  --font-size14: 14px;
	  --font-size12: 12px;
	}



/*    섹션    */

section 
{
    display: flex;
    justify-content: center;
	padding-top: 90px;
}

.wrap
{
    min-width: 1200px;
    padding: 70px 0 90px 0;
    box-sizing: border-box;
    display: flex;
}

.wrap .left
{
    max-width: 720px ;
    justify-content: left;
    
}


.wrap .left .company
{
    display: flex;
    align-items: flex-start;
    margin-bottom: 32px;

}
/* 
.wrap .left .company .imgg
{   
    width: 720px;
    border-radius: 15px;


    /* margin-left: auto;
    align-items: top;
} */


.uploadResult img
	{
		width: 720px;
		height: 410px;
    	border-radius: 15px;
	}


.wrap .main
{
    display: flex;
    align-items: flex-start;
    margin-bottom: 58px;
}


/* 서브 1 시작 */


.wrap .main .sub1
{
    max-width: 620px ;
    max-height: 100px ;
    margin-right: auto;

    color: var(--color-grayblack);
    font-weight: 200;

}



/* .ageSex 
{
  display: flex;
  align-items: center;
  margin-top: 8px;
}

.ageSex .age 
{
  margin-right: 12px;
} */


.wrap .main .sub1 .name,
.wrap .main .sub1 .locationC
{
    font-size: var(--font-size20);
    font-weight: 200;
}
.wrap .main .sub1 .title
{
    font-weight: 600;
}

.wrap .main .sub1 .locationC
{
    font-size: var(--font-size16);

}
.wrap .main .sub1 .title
{
    font-size: var(--font-size24);
}

.wrap .main .sub1 .name
{
    padding-bottom: 20px;
}

/* 서브 2 시작 */

.wrap .main .sub2
{
    max-width: 90px ;
}

/* 북마크 배경 색 및 테두리 제거 */
.side  .iconn,
.wrap .main .sub2 .icon
{
    font-size:20px;
	border: none;
	background-color: var(--color-white);

}

/* 해당 태그 위에 위치하는 마우스 커서의 모양 변경 */
.fa-bookmark
{
	cursor: pointer;
}
.fa-bookmark.active
{
	color: var(--main-color);
}


.wrap .column
{
    display: grid; grid-template-columns: 1fr; gap: 70px; 
    min-width: 720px; min-height: 400px;

}

.wrap .column .columnA
{
    padding-bottom: 10px;
    border-bottom: 1px solid var(--input-gray);

}
/* .wrap .column .border
{

} */


.wrap .column .columnAA,
.wrap .column .col8 .content
{
    font-size: var(--font-size16);
    color: var(--color-gray);
    margin-top: 20px;
    
}
.wrap .column .columnBB
{
    font-size: var(--font-size16);
    color: var(--color-gray);
    margin-top: 20px;
}


.wrap .column .columnA .title
{
    font-weight: 100;
    font-size: var(--font-size20);

}
.wrap .column .columnAA .detail
{
    font-weight: 100;
	line-height: 30px;

}
.wrap .column .columnAA .detail,
.wrap .column .col8 .comname1 .name,
.wrap .column .col8 .comname2 .name

{
    font-weight: 100;
    font-size: var(--font-size16);
    /* color: var(--color-gray); */
    color: var(--color-black);

}




.wrap .column .col8 .content
{
    display: grid; grid-template-columns: 1fr 1fr; grid-row-gap: 16px;

}

.wrap .column .col7 .loc
{
    font-size: var(--font-size14);
    font-weight: 100;
    color: var(--color-black);

}
    
.wrap .column .col7 .columnBB .kakaomap
{
    border-radius: 6px;
}

.wrap .column .col7 .columnBB .loc
{
    margin: 10px 6px;
    font-size: var(--font-size14);
    font-weight: 100;
}

.wrap .column .col8 .comname2
{
    
    margin-left: auto;
}

/* .wrap
{
    min-width: 1200px;
    padding: 50px 0;
    box-sizing: border-box;
}

.wrap .left
{
    max-width: 720px ;
    justify-content: left;
    
}


.wrap .left .company
{
    display: flex;
    align-items: flex-start;
    margin-bottom: 32px;

} */



.columnAA .detail .sectionConBody .Bodycon button.tech 
{
  margin: 10px 12px 10px 0;
  border: 1px solid var(--input-gray);
  border-radius: 6px;
  padding: 12px 20px;
  width: initial;
  

}


.columnAA .detail
{
    font-size: var(--font-size16);
    font-weight: 200px;
}

.wrap .columnAA .tech .mm1 {
	color: var(--color-grayblack);
	    font-size: var(--font-size14);
		margin: 10px 12px 10px 0;
		background-color: var(--button-gray);
		border: 1px solid var(--input-gray);
		border-radius: 6px;
		padding: 12px 20px;
		width: initial;
	    font-weight: 200;
		
}


/* 라이트 시작 */

.wrap .right
{
    
    margin-left: auto;  
    min-width: 375px;
}




.wrap .right .box2,
.wrap .right .box4
{
    margin-top: 10px;
    
}



.wrap .right .box2 .box,
.wrap .right .box3 .box,
.wrap .right .box4 .box
{
    margin-top: 10px;
    
    
}





.wrap .right .side
{
    align-items: flex-start;
}

.wrap .right  .box2,
.wrap .right  .box3
{
    margin: 10px 12px 10px 0;
    border: 1px solid var(--input-gray);
    border-radius: 15px;
    padding: 12px 20px;
    width: initial;
    display: flex;
}

.wrap .right .pos .box3
{

    justify-content: center;

    min-width: 375px;
    

}

.wrap .right .box2 .box
{
    /* max-height: 100px ; */
    margin-right: auto;
    color: var(--color-grayblack);
    font-weight: 200;
    max-width: 290px;
    
}

.wrap .right .box3 .m1,
.wrap .right .box3 .m2
{
    font-size: var(--font-size14);

}


/* max-width: 340px; */


.wrap  .right  .t,
.wrap .right .box2 .t1,
.wrap .right .box2 .t2,
.wrap .right .box2 .t3,
.wrap .right .box3 .p1,
.wrap .right .box4 .p1
{
    font-size: var(--font-size16);
	color: var(--color-black);
    font-weight: 200;
}




.wrap .right .box2 .t1
{
    margin-bottom: 10px;
}
.wrap .right .box2 .t2
{
    margin-bottom: 20px;
}
.wrap .right .box2 .t3
{
    font-size: var(--font-size14);
    margin-bottom: 13px;
}
.wrap .right .boxbox
{
    margin-top: 10px;
}





/* max-width: 620px ;
max-height: 100px ;
margin-right: auto;

color: var(--color-grayblack);
font-weight: 200; */



.wrap .right .box3 .m1
{
    color: var(--color-grayblack);
    font-weight: 500;

}

.wrap .right .box3 .m2
{
    color: var(--color-grayblack);
    font-weight: 500;
}




.columnAA .detail .sectionConBody .Bodycon.tech 
{
  display: block;
  max-width: 1200px;
}



/* 라이트 버튼시작*/
.pos
{
    display: flex;
    justify-content: center;
}


.pos .box3
{
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    &:hover 
    {
        background: var(--main-color);
        color: #fff;
		border: 1px solid var(--main-color);
    }
}

.box3
{
    border: 1px solid var(--input-gray);
    border-radius: 6px;
    height: 46px;
    width: 375px;
    margin: 0 8px;

}
.pos .m1
{
    font-size: var(--font-size18);
    font-weight: 200;
    /* line-height: 2; */
    
}
/*버튼끝*/









/* 라이트 끝 */

</style>

<body>
	<%@ include file="header.jsp" %>
	<%@ include file="quickMenu.jsp" %>

	
<!-- 섹션-->
<section>            
	<div class="wrap">


		<div class="left">


			<!-- 컴퍼니 시작-->

			<div class="company">
				<div class="uploadResult">
					<ul>

					</ul>
				</div>
				<!-- <img class="imgg" src="images/company.svg" alt="#"> -->
			</div>
			<div class="main">
				<div class="sub1">
					<h5 class="name">${company.com_name}</h5>
					<h5 class="locationC">${company.com_location} · ${company.com_year}</h5>
				</div>
				<div class="sub2">
					<button class="icon">
						<!-- <i class="fa-regular fa-bookmark" style = font-size:20px;></i> -->
						<i id="mainBookmark" class="fa-regular fa-bookmark"></i>
					</button>
	  
				</div>
			</div>


			<!-- 컬럼 시작-->


			<div class="column"> 


			<div class="col1">
				<div class="columnA">
					<h5 class="title">회사 소개</h5>
				</div>
				<div class="boerder"></div>
				<div class="columnAA">
					<h5 class="detail">
						${company.com_content}
					</h5>
				</div>
			</div>

			<div class="col6">  <!-- 기술스택 시작-->
				<div class="columnA">
					<h5 class="title">기술 스택 • 툴</h5>
				</div>
				<div class="columnAA">
					<h5 class="detail">
						<div class="sectionConBody tech">
							<div class="Bodycon tech">                            
								<!-- <button class="tech">
									<h5 class="mm1">JAVA</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">iOS</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">Android</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">PHP</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">ASP</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">.NET</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">JavaScript</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">Node.js</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">React.js</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">Vue.js</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">DB</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">C</h5>
								</button>
								<button class="tech">
									<h5 class="mm1">C++</h5>
								</button> -->


							</div>                        
						</div> <!-- sectionConBody 끝 -->
					</h5>
				</div>
			</div>  <!-- 기술스택 끝-->




			<div class="col7 dislocation">
				<div class="columnA">
					<h5 class="title">회사 위치</h5>
				</div>
				<div class="columnBB">
					<!-- <h5 class="detail">/// -->
					<!-- <div class="kakaomap" id="map" style="width:730px;height:250px;">
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de7cac757fedb4da8958fa692849033d"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
	
			var map = new kakao.maps.Map(container, options);
		</script>
	</div> -->
					<div id="map" style="width:100%;height:350px;"></div>
					<h5 class="loc">${company.com_location}</h5>
					<!-- </h5> -->
				</div>
			</div>

			<div class="col8">
				<div class="columnA">
						<h5 class="title">
							기업정보
						</h5>
					</div>
					<div class="content">
						<div class="comname1">
							<h5 class="name">
								연혁
							</h5>
						</div>
						<div class="comname2">
							<h5 class="name">
								${company.experience_years}년 (${company.com_year} 설립)
							</h5>
						</div>
						<div class="comname1">
							<h5 class="name">
								매출액  (2024년)
							</h5>
						</div>
						<div class="comname2">
							<h5 class="name">
								${company.com_sale}
							</h5>
						</div>
						<div class="comname1">
							<h5 class="name">
								기업유형
							</h5>
						</div>
						<div class="comname2">
							<h5 class="name">
								${company.com_type}
							</h5>
						</div>
						<div class="comname1">
							<h5 class="name">
								평균연봉
							</h5>
						</div>
						<div class="comname2">
							<h5 class="name">
								${company.com_salary}
							</h5>
						</div>
						<div class="comname1">
							<h5 class="name">
								대표자명
							</h5>
						</div>
						<div class="comname2">
							<h5 class="name">
								${company.com_CEO}
							</h5>
						</div>
						<div class="comname1">
							<h5 class="name">
								홈페이지
							</h5>
						</div>
						<div class="comname2">
							<h5 class="name">
								${company.com_site}
							</h5>
						</div>
						<div class="comname1">
							<h5 class="name">
								가입 사원수 (인원)
							</h5>
						</div>
						<div class="comname2">
							<h5 class="name">
								${company.com_employee} 명
							</h5>
						</div>
					</div>
			</div>



		</div><!-- 컬럼 끝-->
		</div> <!-- left 끝-->

		<div class="right">
			
			<div class="box1">
				<h5 class="t">진행 중인 채용 공고</h5>
			</div>


			<div class="side">

				<c:forEach var="dto" items="${noticeList}">
					<a href="/jobPostDetail?notice_num=${dto.notice_num}">
						<div class="box2">
							<div class="box">
								<div class="t1">${dto.notice_department} ∙ ${dto.notice_contactType}</div>
								<h5 class="t2"> ${dto.notice_title}</h5>
								<h5 class="t3">${dto.notice_area1} ${dto.notice_area2} ∙ <span class="career">경력</span><span class="noticeCareer">${dto.notice_career}</span> ∙ ${dto.notice_endDate}</h5>
							</div>
							<div class="boxbox">
								<button class="iconn">
									<c:choose>
										<c:when test="${fn:contains(scrapList, dto.notice_num)}">
											<i id="bookmark${dto.notice_num}" class="fa-solid fa-bookmark active" onclick="return false;"></i>
										</c:when>
										<c:otherwise>
											<i id="bookmark${dto.notice_num}" class="fa-regular fa-bookmark" onclick="return false;"></i>
										</c:otherwise>
									</c:choose>
								</button>
							</div>
						</div>
					</a>
				</c:forEach>

				<div class="pos" >
					<button class="box3" id="selectPost">
						<form id="selectEmail" action="jobPostList">
							<input type="hidden" id="com_email" name="com_email">
							<h5 class="m1" id="otherNotice">더 많은 채용공고 보기</h5>
						</form>
					</button>
				</div>

			</div> <!-- side 끝-->
			



		</div> <!--right 끝-->



	</div> <!-- wrap 끝-->
</section> <!--section 끝 -->

		<%@ include file="footer.jsp" %>
</body>







</html>

<script>
	$(document).ready(function () {
		
		// 24.08.12 스택값을 가져와 버튼 형태로 출력
		var comStack = "${company.com_stack}";
		console.log("stack 확인 : "+comStack);
		if(comStack.length > 0){
			const stacks = comStack.split(','); // 콤마로 나눠서 배열로 저장
            let output = "";
            for (let i = 0; i < stacks.length; i++) {
                // output += "<span class='mm1'>" + stacks[i].trim() + "</span>"; 통일성을 위해 button으로 변경
                output += "<button class='mm1'>" + stacks[i].trim() + "</button>";
            }
            $('.col6 .tech').html(output);
		}


				// 24.08.12 하진 : 채용 공고에 기업이 회사 위치를 설정하지 않은 경우, 해당 태그 부분 숨김처리 로직 추가
				var getlocation ="${company.com_location}";

				if(getlocation){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level: 3 // 지도의 확대 레벨
						};  

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(getlocation, function(result, status) {

				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {

					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
					});

					map.setCenter(coords);
					} 
				});  
				}else{
				$(".dislocation").css("display","none");
				}
			// });//end of document ready function

// 	$(document).ready(function(){


		//24.08.07 : 하진
		// 관심 기업 DB 정보가 있을 경우, 해당 이미지 활성화
		let scrap_email = "${scrapEmail}";//스크랩 DB에서 정보를 조회, com_email 값을 가져옴
			if (scrap_email) {
				const mainBookmark = document.getElementById("mainBookmark");
				mainBookmark.classList.replace("fa-regular","fa-solid");
				mainBookmark.classList.add("active");
			}


		// 24.08.13 하진 : 더 많은 공고 페이지 연결
		var postList = "${postNum}";
		console.log("확인용 " + postList);
			if (postList == 0) {
				$("#otherNotice").text("전체 공고 보러 가기");
				$(".t").css({"display":"none"});
				$("#selectPost").click(function() {
				$(this).addClass("active");
				location.href = "jobPostList";
				});
			} else{
				$("#selectPost").click(function() {
					// alert("해당 기업의 공고 보러 가기를 클릭!");
					$(this).addClass("active");

				// hiddenClass 안에 com_email 값을 담는 부분
				var hiddenEmail = $(".hiddenClass");
				var comEmail = "${company.com_email}";
				
				$("#com_email").val(comEmail);

				// ID가 selectEmail인 폼 요소를 찾아서 제출
				var form = $("#selectEmail");  // 폼 요소의 ID를 selectEmail로 가정
				// if (form.length > 0) {
					form.submit();
				// }
			});
		}


		// var data ="${comImage}";
		// console.log("comImage = "+data);
		// var uploadResultContainer = $('.uploadResult ul');
		// // function showUploadResult(uploadResultArr, uploadResultContainer) {
		// 	(function(data, uploadResultContainer) {
		// 	if (!data || data.length === 0) {
		// 		// uploadResultContainer.append('<img class="imgg" src="images/company.svg" alt="#">');
		// 		return;
		// 	}

		// 		var str = "";

		// 		$(data).each(function (i, obj) {
		// 			console.log("여기까지 내가 왔따!!");
		// 			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

		// 			str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
		// 			str += "<div>";
		// 			str += "<span style='display:none;'>" + obj.fileName + "</span>";
		// 			str += "<img src='/comListDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";
		// 			str += "</div></li>";
		// 		});

		// 	uploadResultContainer.empty().append(str);
		// })
		
		
		//24.07.30 지수
		//파일 가져오기
		var comEmail = "${company.com_email}";
		console.log("com_email=>"+comEmail);
		var uploadResultContainer = $(this).find('.uploadResult ul');

		if (comEmail) {
			$.ajax({
				url: '/comFileList',
				type: 'GET',
				data: { com_email : comEmail },
				dataType: 'json',
				success: function(data) {
					showUploadResult(data, uploadResultContainer);//파일보여주기 function 호출
				},
				error: function(xhr, status, error) {
					console.error('Error fetching file list for notice_num ' + noticeNum + ':', error);
				}
			});
		} 

		function showUploadResult(uploadResultArr, uploadResultContainer){//파일보여주기 function
		   if (!uploadResultArr || uploadResultArr.length == 0) {
				uploadResultContainer.empty().append('<img src="images/company.svg" alt="#"> ');
			   return;
		   }
		   
		   var str = "";
	   
		  // $(uploadResultArr).each(function (i, obj) {//파일 여러개일때 전부 다 보여줘는
			if (uploadResultArr.length > 0) { // 배열에 요소가 있는지 확인
				var obj = uploadResultArr[0]; // 첫 번째 요소 가져오기 파일 하나만 보여주기
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
	
				str += "<li data-path='" + obj.uploadPath + "'";
				str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
				str += "<div>";
				str += "<span style='display:none;'>" + obj.fileName + "</span>";
			//    str += "<img src='/registDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
				str += "<img src='/display?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
				str += "</div></li>";
			}
		   uploadResultContainer.empty().append(str);
	   }//파일 가져오기 끝




	});//end of document ready function


	





	//24.08.07 : 하진 : 사이드 공고 관심공고 추가/삭제 로직
	var user_type = "${login_usertype}";
	$(".side .fa-bookmark").click(function() {
          if(user_type == 1){
          
			var getid = $(this).attr("id");//해당 북마크의 id를 찾음
			const regex = /[^0-9]/g;// 정규표현식 : 숫자가 아닌 수들을 찾음
			const result = getid.replace(regex,"");
			const notice_num = parseInt(result);
            const user_email = "${login_email}";
			var bookmark = document.getElementById(getid);

			$.ajax({
				type : "POST",
				url : "/scrapNotice",
				data : {notice_num : notice_num, 
						user_email : user_email
					},
					success : function(result){ 
						if (result == true) {
							alert("관심 공고 목록에 추가되었습니다.");
							bookmark.classList.replace("fa-regular","fa-solid");
							bookmark.classList.add("active");
						}else{
							alert("관심 공고에서 삭제되었습니다.");
							bookmark.classList.replace("fa-solid","fa-regular");
							bookmark.classList.remove("active");
						}
					}
				});
			}else if(!user_type){//user_type이 없으면 login 페이지로 이동
			location.href="/login";
			}
    });//end of fa-bookmark click function


	// 24.08.07 하진 : 관심 기업 등록
	$("#mainBookmark").click(function() {
		console.log("mainBookmark clcik");
		if(user_type == 1){
			const urlParams = new URLSearchParams(location.search);
			var com_email = urlParams.get('com_email');//이렇게 해도 되고 아니면 이미 값을 가지고 갔기 때문에 출력해도 됨
					
			const user_email = "${login_email}";

			let getid = $(this).attr("id");//해당 북마크의 id를 찾음
			var bookmark = document.getElementById(getid);

			$.ajax({
				type : "POST",
				url : "/comListScrap",				
				data : {
					user_email : user_email,
					com_email : com_email
					},
				success : function(response){
						if(response == true){
							alert("관심 기업으로 등록되었습니다.");//아예 class명을을 삭제, 변경이 아니고 추가일 경우
							bookmark.classList.replace("fa-regular","fa-solid");
							bookmark.classList.add('active');
							}else{
							alert("관심 기업에서 삭제되었습니다.");
							bookmark.classList.replace("fa-solid","fa-regular");
							bookmark.classList.remove('active');

						}
					}
			});//end of ajax
		}else if(!user_type){//user_type이 없으면 login 페이지로 이동
        location.href="/login";
        }
	});//end of mainBookmark clcik function

// 	var actionForm = $("#actionForm");

// 	//	페이지번호 처리
// 	// $(".paginate_button").on("click", function (e){
// 	$(".paginate_button a").on("click", function (e){
// 		//기본 동작 막음: 페이지 링크를 통해서 이동
// 		e.preventDefault();
// 		console.log("click~!!!");
// 		console.log("@# href=>"+$(this).attr("href"));
		
// 		// stmt.executeUpdate(s);

// 		// 게시글 클릭후 뒤로가기 누른후 다른 페이지 클릭할때 &boardNo=번호 계속 누적되는거 방지
// 		var bno = actionForm.find("input[name='board_no']").val();
// 		if(bno != ""){
// 			actionForm.find("input[name='board_no']").remove();
// 		}

// 		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
// 		// actionForm.submit();
// 		actionForm.attr("action","boardList").submit();
// 	});//end of paginate_button clcik

	
	
	
// 	// 	게시글 처리
// 	$(".move_link").on("click", function(e){
// 		e.preventDefault();

// 		console.log("@# move_link click~!!!");
// 		console.log("@# href=>"+$(this).attr("href"));

		
		
// 		var targetBno = $(this).attr("href");
	
// 		// 게시글 클릭후 뒤로가기 누른후 다른 게시글 클릭할때 &boardNo=번호 계속 누적되는거 방지
// 		var bno = actionForm.find("input[name='board_no']").val();
// 		if(bno != ""){
// 			actionForm.find("input[name='board_no']").remove();
// 		}

// 		// "content_view?boardNo=${dto.boardNo}" 를 actionForm 로 처리
// 		actionForm.append("<input type='hidden' name='board_no' value='"+targetBno+"'>");
// 		// actionForm.submit();
// 		// 컨트롤러에 content_view 로 찾아감
// 		actionForm.attr("action","boardDetailView").submit();
// 	});//end of move_link click
	
	
// 	var searchForm = $("#searchForm");
	
	
// 	// search 버튼 클릭
// //	$("#searchForm").on("click", function(){
// 	$("#searchForm button").on("click", function(){
// 		// alert("검색");
		
		
// 		// 아래는 검색 종류까지만 할때 참고
// 		//  if (!searchForm.find("option:selected").val()){
// 		//	 alert("검색종류를 선택하세요");
// 		// 	 return false;
// 		//  }
		
// 		if(searchForm.fin("option:selected").val() != "" && !searchForm.find ("input[name = 'keyword']").val()){
// 			alert("키워드를 입력하세요");
// 			return false;
			
// 		}
		
// 		searchForm.attr("action","boardList").submit();
		
// 	}); // searchForm click 끝
	
	
// 	// type 콤보박스 변경
// 	$("#searchForm select").on("change",function(){
// 		// 전체일때
// 		if(searchForm.find("option:selected").val() == ""){
// 			// 키워드를 null값으로 변경함
// 			searchForm.find("input[name = 'keyword']").val("");
// 		}
// 	}); // searchForm select change 끝
</script>













