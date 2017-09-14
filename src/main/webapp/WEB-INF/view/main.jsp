<%@ page import="java.util.Date" %>
<%@ page import="com.zhou.hai.charge.statistical.CountXml" %>
<%@include file="commom.jsp"%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${base}/css/hai.css" rel="stylesheet" type="text/css">
</head>

<body>

<%  CountXml xmlcount = CountXml.getInstance();
    if (session.isNew()) {
    xmlcount.addcount(new Date());//增加访问量
}
%>

<%--总访问量：  <%=xmlcount.getTotalCount() %><br>--%>
<%--本年访问量：<%=xmlcount.getYearCount() %><br>--%>
<%--本月访问量：<%=xmlcount.getMonthCount() %><br>--%>
<%--本周访问量：<%=xmlcount.getWeekCount() %><br>--%>
<%--本日访问量：<%=xmlcount.getDayCount() %><br>--%>
<div class="header">
    <div class="inner">
        <img width="1100" height="105" src="${base}/images/head.jpg" border="0" >
    </div>
</div>
<nav class="main-navigation">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="collapse navbar-collapse" id="main-menu">
                    <ul class="menu">
                        <li class="nav-current"><a href="${base}/hai/main">首页</a></li>
                        <li><a href="${base}/post/more">新闻</a></li>
                        <li><a href="${base}/photo/more">雄鹰风采</a></li>
                        <li><a href="${base}/history" target="_blank">荣光历史</a></li>
                        <li><a href="/about/">关于</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <!--轮播-->
        <div class="col-md-8">
            <div class="wrapper"><!-- 最外层部分 -->
                <div class="banner"><!-- 轮播部分 -->
                    <ul class="imgList"><!-- 图片部分 -->
                        <c:forEach var="turn" items="${turnList}">
                        <li><a href="${base}/post/${turn.postid}"><img src="${base}/pic/${turn.picture}" width="100%" height="320px" alt="${turn.introduce}"></a></li>
                        </c:forEach>
                    </ul>
                    <div class="bg"></div> <!-- 图片底部背景层部分-->
                    <ul class="infoList"><!-- 图片左下角文字信息部分 -->
                        <c:forEach var="turn" items="${turnList}">
                        <li>${turn.introduce}</li>
                        </c:forEach>
                    </ul>
                    <ul class="indexList"><!-- 图片右下角序号部分 -->
                        <li class="indexOn">1</li>
                        <li>2</li>
                        <li>3</li>
                        <li>4</li>
                        <li>5</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--轮播侧栏-->
        <div class="col-md-4" sidebar>
            <div class="homePageIconDiv rightBorder">
                <a href="#">
                <div class="homePageIcon">

                    <img alt="Generic placeholder image" src="${base}/images/icon2.png">

                </div>
                <div class="pos02">
                <h2 class="text_center">海天饺子馆</h2>
                <p class="text_center">海空雄鹰团诞生于高邮的“老虎五团”<br>被国防部授予“海空雄鹰团”称号。</p>
                </div>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="pos01">
        <!--第一列-->
        <div class="cols01">
            <!--新闻start-->
            <div class="channel_shadow">
                <div class="channel">
                    <h3><span class="newsmore"><a href="${base}/post/more">进入&gt;&gt;</a></span><span class="blocktitle" >中大新闻</span> <span class="newsdown">NEWS &amp; EVENTS</span></h3>
                    <div class="newslist01">
                        <ul>
                            <c:forEach var="post" items="${postList}">
                            <li>
                                <span class="newstime"><fmt:formatDate value="${post.postDate}" pattern="MM-dd"/></span>
                                <a title="${post.postTitle}" class="index-ellipsis" href="${base}/post/${post.postId}" target="_blank">${post.postTitle}</a>
                            </li>

                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!--新闻end-->
        </div>
        <!--第二列-->
        <div class="cols02">
            <!--图新start-->
            <div class="channel_shadow">
                <div class="channel">
                    <h3><span class="newsmore"><a href="http://news2.sysu.edu.cn">进入&gt;&gt;</a></span><span class="blocktitle">中大新闻</span> <span class="newsdown">NEWS &amp; EVENTS</span></h3>
                    <div class="newslist01">
                        <ul>
                            <li>
                                <span class="newstime">01-06</span>
                                <a title="药学前沿大讲堂第286讲：抗衡阴离子协助的不对称催化氢化反应" class="index-ellipsis" href="https://oa.sysu.edu.cn/oa/info/sysu/000000005958ee940159721ba9752c49/index" target="_blank">药学前沿大讲堂第286讲：抗衡阴离子协助的不对称催化氢化反应</a>
                            </li>
                            <li>
                                <span class="newstime">01-06</span>
                                <a title="药学前沿大讲堂第285讲：教育改革的思路与行动" class="index-ellipsis" href="https://oa.sysu.edu.cn/oa/info/sysu/000000005958ee9401597219906f2c46/index" target="_blank">药学前沿大讲堂第285讲：教育改革的思路与行动</a>
                            </li>
                            <li>
                                <span class="newstime">01-05</span>
                                <a title="(1-5PM4:00)岭南学术论坛－管理学系列Seminar" class="index-ellipsis" href="https://oa.sysu.edu.cn/oa/info/sysu/000000005958ee940159633d7e1e0788/index" target="_blank">(1-5PM4:00)岭南学术论坛－管理学系列Seminar</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <!--图新end-->
            <!--通知start-->
            <div class="channel_shadow">
                <div class="channel">
                    <h3><span class="newsmore"><a href="http://news2.sysu.edu.cn">进入&gt;&gt;</a></span><span class="blocktitle">中大新闻</span> <span class="newsdown">NEWS &amp; EVENTS</span></h3>
                    <div class="newslist01">
                        <ul>
                            <li>
                                <span class="newstime">01-06</span>
                                <a title="药学前沿大讲堂第286讲：抗衡阴离子协助的不对称催化氢化反应" class="index-ellipsis" href="https://oa.sysu.edu.cn/oa/info/sysu/000000005958ee940159721ba9752c49/index" target="_blank">药学前沿大讲堂第286讲：抗衡阴离子协助的不对称催化氢化反应</a>
                            </li>
                            <li>
                                <span class="newstime">01-06</span>
                                <a title="药学前沿大讲堂第285讲：教育改革的思路与行动" class="index-ellipsis" href="https://oa.sysu.edu.cn/oa/info/sysu/000000005958ee9401597219906f2c46/index" target="_blank">药学前沿大讲堂第285讲：教育改革的思路与行动</a>
                            </li>
                            <li>
                                <span class="newstime">01-05</span>
                                <a title="(1-5PM4:00)岭南学术论坛－管理学系列Seminar" class="index-ellipsis" href="https://oa.sysu.edu.cn/oa/info/sysu/000000005958ee940159633d7e1e0788/index" target="_blank">(1-5PM4:00)岭南学术论坛－管理学系列Seminar</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <!--通知start-->

        </div>
    </div>
</div>

<div >
    <img width=100% height="105" src="${base}/images/foot.jpg" border="0" >
</div>


<script src="${base}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    var urlstr = window.document.location.pathname;
    var urlstatus=false;
    $(".menu > li").each(function () {
        var lihref=$(this).children("a").attr('href');
        if (($(this).children("a").attr('href')).indexOf(urlstr) > -1 && $(this).attr('href') != '') {

            $(this).addClass('nav-current'); urlstatus = true;

        } else {

            $(this).removeClass('nav-current');

        }

    });

    if (!urlstatus) {$(".menu > a").eq(0).addClass('nav-current'); }
</script>
<script type="text/javascript">
    var curIndex = 0;  //当前index
    //   alert(imgLen);
    // 定时器自动变换2.5秒每次
    var autoChange = setInterval(function(){
        if(curIndex <  $(".imgList li").length-1){
            curIndex ++;
        }else{
            curIndex = 0;
        }
        //调用变换处理函数
        changeTo(curIndex);
    },2500);

    $(".indexList").find("li").each(function(item){
        $(this).hover(function(){
            clearInterval(autoChange);
            changeTo(item);
            curIndex = item;
        },function(){
            autoChange = setInterval(function(){
                if(curIndex <  $(".imgList li").length-1){
                    curIndex ++;
                }else{
                    curIndex = 0;
                }
                //调用变换处理函数
                changeTo(curIndex);
            },2500);
        });
    });
    function changeTo(num){
        $(".imgList").find("li").removeClass("imgOn").hide().eq(num).fadeIn().addClass("imgOn");
        $(".infoList").find("li").removeClass("infoOn").eq(num).addClass("infoOn");
        $(".indexList").find("li").removeClass("indexOn").eq(num).addClass("indexOn");
    }
</script>
</body>
</html>