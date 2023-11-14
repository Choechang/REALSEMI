<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.Member"%>
<%

   String contextPath = request.getContextPath();
   Member loginUser = (Member)session.getAttribute("loginUser");
   String alertMsg = (String)session.getAttribute("alertMsg");


%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
    <meta name="description" content="">
    <meta name="keyword" content="">
    <title>당신 근처의 당근</title>
    <link rel="stylesheet" href="./resources/css/common.css">
    <link rel="stylesheet" href="./resources/css/content.css">
    <link rel="stylesheet" href="./resources/css/font.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<style>
/* reset */
*,
*:before,
*:after{box-sizing: border-box;}
html,body,div,span,iframe,object,embed,h1,h2,h3,h4,h5,h6,dl,dt,dd,ul,ol,li,a,abbr,address,b,bdo,blockquote,cite,code,del,dfn,p,pre,em,i,ins,kbd,q,s,samp,strong,sub,sup,u,var,img,map,area,form,fieldset,legend,input,textarea,select,button,label,keygen,table,caption,thead,tbody,tfoot,tr,th,td,article,aside,audio,bdi,canvas,datalist,details,dialog,figcaption,figure,footer,header,main,mark,menu,menuitem,meter,nav,output,progress,section,rp,rt,ruby,summary,time,video,wbr,hr{margin: 0; padding: 0;}
html,body{width: 100%; height: 100%;}
html{overflow-y: scroll;}
body{font: 1rem/1 'Roboto', 'Noto Sans KR', '.SFNSText-Regular','San Francisco','Segoe UI','Helvetica Neue','Lucida Grande',sans-serif;font-weight: 400;color: #333;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;-webkit-font-smoothing: antialiased;}
article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary{display:block;}
h1,h2,h3,h4,h5,pre,input,button,select,textarea{font: inherit;}
input,button,select,textarea{color: inherit;-webkit-appearance: none; border-radius: 0;}
a{color: inherit; text-decoration: none;}
input, select, label, img, button{vertical-align: middle;}
table{width: 100%; border-collapse: collapse; border-spacing: 0;}
img{border:0;}
fieldset{border:0; min-width:0; width:100%}
ul, ul li{list-style: none;}
ol{margin-left: 15px;}
a,button,label{cursor: pointer;}
button{background: transparent;   border: 0;}
i,em,address{font-style: normal;}
a{color: inherit; -webkit-tap-highlight-color: transparent;}
a[href]{color: inherit; -webkit-tap-highlight-color: inherit;}
abbr{text-decoration: none;}
/* common */
legend,
.sr-only{overflow: hidden; position: absolute; width: 1px; height: 1px; margin: -1px 0 0 -1px; clip: rect(0, 0, 0, 0);}
caption{overflow: hidden; width: 100%; height: 1px; background-color: var(--color-primary-gray100); color: transparent;}
hr.div{width: 100%; border: 0; height: 1px; background-color: var(--color-primary-gray100);}
pre{line-height: 1.5; white-space: pre-wrap; /* CSS3*/
    white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
    white-space: -pre-wrap; /* Opera 4-6 */
    white-space: -o-pre-wrap; /* Opera 7 */
    word-wrap: break-all; /* Internet Explorer 5.5+ */}

/* header */
header {
    width: 100%;
    background: #ffffff;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
    border-bottom: 1px solid #eeeeee;
    display: flex;
    align-items: center;
    height: 72px;
    box-sizing: border-box;
    transition: top .2s ease-in-out;
}
.inner-wrap {
    max-width: 1200px;
    margin: 0 auto;
    width: 100%;
}
header .gnb {
    width: 100%;
    padding: 0 20px;
}
header .gnb h1 a{
    display: block;
    width: 74px;
}
header .gnb h1 img{
    width: 100%;
}
header .gnb .nav {
    display: flex;
    width: 100%;
    align-items: center;
    justify-content: space-between;
}
header .gnb .menu{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
header .gnb .menu > li{
   padding-right: 20px;
}
header .gnb .menu li a{
    font-weight: 700;
    font-size: 16px;
    color: #4d5159;
}
header .gnb .menu li a:hover{
    color: #ff6f0f;
}
header .gnb .search {
    display: flex;
    align-items: center;
    gap: 20px;
}

header .gnb .search .input {
    width: 300px;
    background: #f2f3f6;
    border: none;
    border-radius: 0.6rem;
    padding: 0.8rem 1.4rem;
    box-sizing: border-box;
}

header .gnb .search .input:focus {
    outline: 1px solid #ff6f0f;
  }

header .gnb .search .button {
    background: #fff;
    border: 1px solid #d1d3d8;
    color: #212124;
    font-weight: 700;
    border-radius: 0.4rem;
    padding: 0.8rem 1.4rem;
}

.utill{
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 40px;
}
.utill > div{
    position: relative;
}
.utill > div:first-child:before {
    display: none;
}
.utill > div:before {
    content: "";
    position: absolute;
    top: 4px;
    left: -40px;
    border-right: 1px solid #d8d8d8;
    height: 16px;
    padding-right: 20px;
}
.utill a {
    font-weight: 700;
    font-size: 16px;
    line-height: 24px;
    letter-spacing: -.23px;
}
.utill a:hover {
    text-decoration: underline;
}
.utill div.icon a {
    display: flex;
    align-items: center;
    gap:4px;
}
.utill div a > img {
    width: 16px;
    height: 16px;
}



/* contents */
.contents{
    padding-top: 70px;
}

</style>
<body style="width: 100%; min-width: 1200px; min-height: 100%;">

    <% if(alertMsg != null){ %>
      <script>
         alert("<%=alertMsg%>");
      </script>
      <% session.removeAttribute("alertMsg");%>
   <% }%>
    <!-- header -->
    
    <header class="header" id="header">
        <div class="inner-wrap">
            <div class="gnb">
                <nav class="nav">
                    <h1><a href="<%=contextPath%>"><img style="width: 130px " src="resources/images/img/dang.jpg" alt="daangn logo"><span class="sr-only">당근마켓<span></a></h1>
                    
                    <ul class="menu">
                        <li><a href="<%=contextPath %>/boardlist.bo?cpage=1">중고거래</a></li>
                        <li><a href="<%=contextPath %>/">동네생활</a></li>
                    </ul>
                    
                    <div class="search">
                        <a class="search" href="<%=contextPath %>/searchForm.bo"><span class="input">중고거래하실 물품을 검색해보세요</span><span class="button">검색하기</span></a>
                    </div>
                     
                    <% if(loginUser == null) { %>
                    <div class="utill">
                        <div><a href="<%=contextPath%>/loginForm.me">로그인</a></div>
                        <div><a href="<%=contextPath%>/enrollForm.me">회원가입</a></div>
                    </div>
                    <% } else { %>
                  <!-- case2. 로그인 후 -->
                  <div>
                     <b><%=loginUser.getUserName()%></b>님</a>
                     <a href="<%=contextPath %>/myPage.me">마이페이지</a>
                  </div>
                  <div class="utill">
                       <div><a href="<%=contextPath %>/logout.me">로그아웃</a></div>
                       <div><a href="<%=contextPath %>/enrollForm.bo">글 작성</a></div>       
                  </div>
                  <% } %>
                  </nav>
               </div>
            </div>
        </div>
    </header>
    <!--// header  -->   
</body>
</html>