<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 공고 목록</title>
<!-- <link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/posting_list.css"> -->
<link rel="stylesheet" href="css/default.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="js/index.js"></script>     
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
	padding-top : 90px;
    display: flex;
    justify-content: center;

}

.wrap
{
    min-width: 1200px;
    padding: 70px 0;
    box-sizing: border-box;
    display: flex;
}
.devlist
{
    width: 1200px;
}

.selectbox
{
    position: relative;
    margin-bottom: 40px;
}



.selectbox .select .title
{
    padding-left: 20px;   
    margin: 0 0 30px 0;
    border: 1px solid var(--input-gray);
    border-radius: 10px;
    padding: 16px 20px;
    width: 1158px;
    display: flex;
}


.selectbox .icon
{
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    right: 20px;
}


.filterbox
{
    display: flex;
    margin-bottom: 64px;
}


.filterbox .right
{
    width: initial;
    display: flex;
    margin-left: auto;
}


.filterbox .left
{
    display: flex;
}



/* 버튼시작 */

.right .fil2
{
    margin-left: 8px;
    border: 1px solid var(--input-gray);
    background-color: var(--color-white);
    border-radius: 10px;

    width: 80px;
    height: 40px;
    cursor: pointer;
    &:hover 
    {
        background: var(--main-color);
        color: #fff;
    }
}

.left .fil2
{
    border: 1px solid var(--input-gray);
    background-color: var(--color-white);
    border-radius: 10px;

    width: 80px;
    height: 40px;
    cursor: pointer;
    &:hover 
    {
        background: var(--main-color);
        color: #fff;
    }
}




/* 버튼 끝 */


/* .filterbox .fil
{
    margin: 0 14px 0 0;
    border: 1px solid var(--input-gray);
    border-radius: 10px;
    padding: 14px 18px;
    width: initial;
    display: flex;
    background-color: var(--color-white);
} */


.filterbox .fil .filter .last,
.filterbox .fil2 .but1,
.filterbox .fil3 .but1,
.menutitle .company .c1,
.menutitle .location .l1
{
    font-size: var(--font-size14);
    font-weight: 300;
}



.selectbox .title
{
    font-size: var(--font-size16);
    font-weight: 300;
    width: 1200px;
    border: none;
    resize: none;
    
}

.selectbox .title
{
display:inline-block;

    
}




.sbox .select1
{
    height: 40px;
    border-radius: 10px;
    border: solid 1px var(--input-gray);
    padding: 0 15px;
    font-size: var(--font-size14);
    font-weight: 200;
    margin-right: 14px;
}


.menutitle .scrap .fa-bookmark
{
    font-size: 20px;
    /* color: var(--input-gray); */
    color: var(--color-gray);
    cursor: pointer;

}

.menutitle .scrap .fa-bookmark.active
{
    /* font-size: 20px; */
    color: var(--main-color);
}


.menutitle .company
{
    margin-bottom: 4px;
	color : var(--color-gray);
}

.menutitle .location
{
	color : var(--color-gray);
}

.mtlist
{
    display: grid; grid-template-columns:  270px 270px 270px 270px; 
    gap: 40px;
}

.menutitle
{
    max-width: 270px;
    
}


.menutitle .title .t1
{
    font-size: var(--font-size16);
    font-weight: 600;
}

.menubox
{
    display: flex;
    margin-bottom: 16px;
    position: relative;
}

.menubox .img
{
    width: 270px;
    height: 180px;
    /* background-image: url(../images/company.svg); */
    background-position: center;
    background-size: cover;
    border-radius: 10px;

}

.menubox .scrap
{
    position: absolute;
    top: 15px;
    right: 12px
}
.menubox .a:hover
{
    border:1px solid var(--main-color);
    background-color: var(--main-color);
    color: var(--main-color);
}

.menubox .uploadResult img
{
    width: 270px;
    height: 180px;
    border-radius: 10px;
}






.titlebox
{
    width: 270px;
    height: 90px;
}

.titlebox .title
{
    margin-bottom: 8px;
	color : var(--color-black);
}



.mtlist
{
    margin-bottom: 60px;
}
.pagingbox
{
    margin-bottom: 60px;
}

 .paging ul
{
    display: flex;
    justify-content: center;
    gap: 10px;
    list-style: none;
}
.div_page 
{
   margin-top: 40px;   
}

.div_page ul 
{
   display: flex;
    align-items: center;
    justify-content: center;   
   gap: 0 20px;
}

.paginate_button 
{
   text-decoration: none;
   padding: 8px 14px;
   border-radius: 6px;
}
.paginate_button a 
{
   color: #111;
}


</style>
<!-- 사진 이미지 수정하기-->


<body>
<div class="container">
    <%@ include file="../header.jsp" %>
</div>


<!-- 섹션-->
    <section> 
        <div class="wrap">     
            <div class="devlist">

                <div class="selectbox">
                    <div class="select">
                        <input class="title" type="text" placeholder="검색어를 입력해 주세요">
                    </div> <!-- 콘텐트박스 끝-->
                    <div class="icon">
                        <div class="i1">
                            <a href="#" class="fa-solid fa-magnifying-glass" style="color: #ffa500;"></a>
                        </div>
                    </div>
                </div> <!-- selectbox 끝-->




                <div class="filterbox">
                    <div class="left">
						
                        <div class="sbox">
                            <form>
                                <select class="select1" id="select" name="select">
                                  <option value="">직군 · 직무</option>
                                    <option value="s1">공지사항</option>
                                    <option value="s1">이벤트</option>
                                </select>
                              </form>
                        </div> <!-- selectbox 끝 -->
                        <div class="sbox">
                            <form>
                                <select class="select1" id="select" name="select">
                                  <option value="">경력</option>
                                    <option value="s1">공지사항</option>
                                    <option value="s1">이벤트</option>
                                </select>
                              </form>
                        </div> <!-- selectbox 끝 -->
                        <div class="sbox">
                            <form>
                                <select class="select1" id="select" name="select">
                                  <option value="">기술스택</option>
                                    <option value="s1">공지사항</option>
                                    <option value="s1">이벤트</option>
                                </select>
                              </form>
                        </div> <!-- selectbox 끝 -->
                        <div class="sbox">
                            <form>
                                <select class="select1" id="select" name="select">
                                  <option value="">지역</option>
                                    <option value="s1">공지사항</option>
                                    <option value="s1">이벤트</option>
                                </select>
                              </form>
                        </div> <!-- selectbox 끝 -->


                        <button class="fil2">
                            <div class="f1">
                                <h5 class="but1">
                                    마감임박
                                </h5>
                            </div>
                        </button> <!-- 마감임박 버튼 끝-->

                    </div> <!-- 레프트 끝-->

                    <div class="right">
                        <button class="fil2" id="firstButton">
                            <div class="f1">
                                <h5 class="but1">
                                    추천순
                                </h5>
                            </div>
                        </button>
                        <button class="fil2" id="secondButton">
                            <div class="f1">
                                <h5 class="but1">
                                    최신순
                                </h5>
                            </div>
                        </button>
                        <button class="fil2" id="thirdButton">
                            <div class="f1">
                                <h5 class="but1">
                                    조회순
                                </h5>
                            </div>
                        </button>
                    </div>  <!-- 라이트 끝-->

                </div> <!-- filterbox 끝 -->


                <div class="mtlist"> <!--  mtlist 시작-->

					<c:forEach var="dto" items="${jobPost}">
                        <div class="menutitle"> 
                            <div class="menubox">
                                <!-- ${dto.notice_num} --><!--공고 번호를 출력해 봄-->
                                <a href="/jobPostDetail?notice_num=${dto.notice_num}" class="tag" data-notice-num="${dto.notice_num}">
                                <!-- <a href="/jobPostDetail" class="tag"> -->
                                    <div class="img" >
                                        <div class="uploadResult">
                                            <ul>

                                            </ul>
                                        </div>
                                    </div>
                                </a>
                                <div class="scrap">
                                    <div class="s1">
                                        <!-- noticeList : ${noticeList} --><!--해당 유저의 관심 공고 목록을 출력해 봄-->
                                        <c:choose>
                                            <c:when test="${fn:contains(noticeList, dto.notice_num)}">
                                                <i id="bookmark${dto.notice_num}" class="fa-solid fa-bookmark active"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i id="bookmark${dto.notice_num}" class="fa-solid fa-bookmark"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div> 

                            <div class="titlebox">
                                <a href="/jobPostDetail?notice_num=${dto.notice_num}">
                                    <div class="title">
                                        <h5 class="t1">
                                            ${dto.notice_title}
                                        </h5>
                                    </div>
    <!--                            </a>-->
    <!--                            <a href="연동 채용상세/index.html">-->
                                    <div class="company">
                                        <h5 class="c1">                                
                                            ${dto.com_name}
                                        </h5>
                                    </div>
                                    <div class="location">
                                        <h5 class="l1">
                                            ${dto.notice_area1} · ${dto.notice_career}
                                        </h5>
                                    </div>
                                </a>
                            </div> 
                        </div>  
					</c:forEach>
                    

                   
                </div> <!-- milist 끝-->
                <div class="pagingbox">
                    <!-- <h3>${paging}</h3>
                    ${paging.startpage}
                    ${paging.endpage} -->
                    <div class="paging">
                        <ul>
                            <c:if test="${paging.prev}">
                                <!-- <li>[Previous]</li> -->
                                <li class="paginate_button">
                                    <a href="${paging.startpage - 1}">
                                        [Previous]
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach var="num" begin="${paging.startpage}" end="${paging.endpage}">
                                <!-- <li class="paginate_button" ${paging.std.pageNum == num ? "style='background-color: yellow'" : ""}> -->
                                <li class="paginate_button"  ${paging.std.pageNum == num ? "style='border: 1px solid var(--main-color)'" : ""}>
                                    <!-- [${num}] -->
                                    <a href="${num}">
                                        ${num}
                                    </a>
                                </li>
                            </c:forEach>

                            <c:if test="${paging.next}">
                                <!-- <li>[Next]</li> -->
                                <li class="paginate_button">
                                    <a href="${paging.endpage + 1}">
                                        [Next]
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div><!--paging-->
                </div><!--pagingbox-->

                
            </div> <!-- devlist 끝 -->
        </div> <!-- wrap 끝 -->
    </section> <!--section 끝 -->
    
    
    <%@ include file="../footer.jsp" %>
</div>
        <!-- <form id="actionForm" method="get" action="cardPageList"> -->
        <form id="actionForm" method="get" action="jobPostList">
            <input type="hidden" name="pageNum" value="${paging.std.pageNum}">
            <input type="hidden" name="amount" value="${paging.std.amount}">
        </form>
</body>
</html>
<script>

$(document).ready(function() {
  //버튼 클릭시 활성화

  var user_type = "${login_usertype}";
  console.log("user_type = "+user_type);

  //공고 스크랩 관련 로직
  $(".scrap .fa-bookmark").click(function() {
          if(user_type == 1){
          
            const user_email = "${login_email}";
            const href = $(this).parents().siblings().closest("a").prop("href");
            const url = new URL(href);
            const searchParams = new URLSearchParams(url.search);
            const noticeNum = searchParams.get('notice_num');

        $.ajax({
            type : "POST",
            url : "/scrapNotice",
            data : {notice_num : noticeNum, 
                    user_email : user_email
                },
                success : function(result){ 
                    if (result == true) {
                        alert("관심 공고 목록에 추가되었습니다.");
                        $("#bookmark"+noticeNum).addClass('active');
                    }else{
                        alert("관심 공고에서 삭제되었습니다.");
                        $("#bookmark"+noticeNum).removeClass('active');
                    }
                }
            });
        }else if(!user_type){//user_type이 없으면 login 페이지로 이동
        location.href="/login";
        }
    });//end of fa-bookmark click function
});//document).ready(function()

// 페이징 관련 로직
    var actionForm = $("#actionForm");
    $(".paginate_button a").on("click", function(e){
        e.preventDefault();//기본 동작을 막음 : 페이지 링크를 통해서 이동
        // console.log("@# href =>"+$(this).attr("href"));

        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        // actionForm.attr("action","cardPageList").submit();
        actionForm.attr("action","jobPostList").submit();
        
    });



</script>

<script>
// 2024-08-01 지수 (공고 목록 사진 들고오기)

    $(document).ready(function () {
       // tag 반복하면서 데이터 가져옴
       $('.tag').each(function () {
           // tag data-notice-num 속성에서 값을 가져옴
           var noticeNum = $(this).data('notice-num');
           
           // 현재 tag .uploadResult 요소를 선택
           var uploadResultContainer = $(this).find('.uploadResult ul');
   
           if (noticeNum) {
               $.ajax({
                   url: '/cardPageFileList',
                   type: 'GET',
                   data: { notice_num: noticeNum },
                   dataType: 'json',
                   success: function(data) {
                       showUploadResult(data, uploadResultContainer);
                   },
                   error: function(xhr, status, error) {
                       console.error('Error fetching file list for notice_num ' + noticeNum + ':', error);
                   }
               });
           } 
       });
       
   });
   
   function showUploadResult(uploadResultArr, uploadResultContainer){
       if (!uploadResultArr || uploadResultArr.length == 0) {
           return;
       }
   
       var str = "";
   
       $(uploadResultArr).each(function (i, obj) {
           var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
   
           str += "<li data-path='" + obj.uploadPath + "'";
           str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
           str += "<div>";
           str += "<span style='display:none;'>" + obj.fileName + "</span>";
           str += "<img src='/cardPageDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
           str += "</div></li>";
       });
   
       uploadResultContainer.empty().append(str);
   }
   
   // 공고 목록 사진 들고오기 끝 - 지수 
   </script>