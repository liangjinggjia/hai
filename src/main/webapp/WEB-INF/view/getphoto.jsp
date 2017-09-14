<%@include file="commom.jsp" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <link href="${base}/css/hai.css" rel="stylesheet" type="text/css">
    <link href="${base}/css/photo/newsdetail.css" rel="stylesheet" type="text/css">
    <script type='text/javascript' src="${base}/js/jquery-3.1.1.min.js"></script>
    <script type='text/javascript' src="${base}/js/photo/jquery.SuperSlide.2.1.1.js"></script>
    <script type='text/javascript' src="${base}/js/photo/newsdetail.js"></script>
</head>
<body>
<div class="header">
    <div class="inner">
        <img width="1100" height="105" src="${base}/images/head.jpg" border="0">
    </div>
</div>

<nav class="main-navigation">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="collapse navbar-collapse" id="main-menu">
                    <ul class="menu">
                        <li><a href="${base}/hai/main">首页</a></li>
                        <li><a href="${base}/post/more">新闻</a></li>
                        <li class="nav-current"><a href="${base}/photo/more">雄鹰风采</a></li>
                        <li><a href="${base}/history" target="_blank">荣光历史</a></li>
                        <li><a href="/about/">关于</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<div class="photos">
    <div class="title">${photos.title}</div>
    <div class="date"><fmt:formatDate value="${photos.date}" pattern="yyyy-MM-dd"/></div>
    <!--图片轮换开始-->
    <div class="bodymodal">
    </div>
    <%--图片第一张一张时出现的--%>
    <div class="firsttop">
        <div class="firsttop_right">
            <div class="close2">
                <a class="closebtn1" title="关闭" href="javascript:void(0)"></a>
            </div>
            <div class="replay">
                <h2 id="div-end-h2">
                    已到第一张图片了。
                </h2>
                <p>
                    <a target="_blank" class="replaybtn1" href="javascript:">重新播放</a>
                </p>
            </div>
            <div class="pictwo">
                <ul>
                    <c:if test="${!empty aft}">
                        <li>
                            <a href="${base}/photo/${aft.photocollectionId}" title="${aft.title}"><img
                                    src="${base}/pic/${aft.photodetailList[0].photo}" alt="${aft.title}"/></a>
                            <div class="imgdivtext">
                                <a href="${base}/photo/${aft.photocollectionId}" title="${aft.title}">上一图集</a>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${!empty pre}">
                        <li>
                            <a href="${base}/photo/${pre.photocollectionId}" title="${pre.title}"><img
                                    src="${base}/pic/${pre.photodetailList[0].photo}" alt="${pre.title}"/></a>
                            <div class="imgdivtext">
                                <a href="${base}/photo/${pre.photocollectionId}" title="${pre.title}">下一图集</a>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div class="returnbtn">
                <a title="返回首页" href="${base}/photo/more">返回首页&gt;&gt;</a>
            </div>
        </div>
    </div>
    <!--图片最后一张时出现的-->
    <div class="endtop">
        <div class="firsttop_right">
            <div class="close2">
                <a class="closebtn2" title="关闭" href="javascript:void(0)"></a>
            </div>
            <div class="replay">
                <h2 id="H1">
                    已到最后一张图片了。
                </h2>
                <p>
                    <a target="_blank" class="replaybtn2" href="javascript:">重新播放</a>
                </p>
            </div>
            <div class="pictwo">
                <ul>
                    <c:if test="${!empty aft}">
                        <li>
                            <a href="${base}/photo/${aft.photocollectionId}" title="${aft.title}"><img
                                    src="${base}/pic/${aft.photodetailList[0].photo}" alt="${aft.title}"/></a>
                            <div class="imgdivtext">
                                <a href="${base}/photo/${aft.photocollectionId}" title="${aft.title}">上一图集</a>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${!empty pre}">
                        <li>
                            <a href="${base}/photo/${pre.photocollectionId}" title="${pre.title}"><img
                                    src="${base}/pic/${pre.photodetailList[0].photo}" alt="${pre.title}"/></a>
                            <div class="imgdivtext">
                                <a href="${base}/photo/${pre.photocollectionId}" title="${pre.title}">下一图集</a>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div class="returnbtn">
                <a href="${base}/photo/more">返回首页&gt;&gt;</a>
            </div>
        </div>
    </div>
    <!--轮播过程-->
    <div class="detail_context_pic">
        <div class="detail_context_pic_top">
            <a href="#"><img src="" alt="" id="pic1" curindex="0"/></a>
            <a id="preArrow" href="javascript:void(0)" class="contextDiv" title="上一张"><span id="preArrow_A"></span></a>
            <a id="nextArrow" href="javascript:void(0)" class="contextDiv" title="下一张"><span id="nextArrow_A"></span></a>
            <div id="miaoshuwarp">
                <div class="miaoshu">
                </div>
            </div>
        </div>
        <!--图片轮播-->
        <div class="detail_context_pic_bot">
            <div class="detail_picbot_left">
                <a href="javascript:void(0)" id="preArrow_B"><img src="${base}/images/photo/left1.jpg" alt="上一个"/></a>
            </div>
            <div class="detail_picbot_mid">
                <ul>
                    <c:forEach var="photodetail" items="${photos.photodetailList}">
                        <li>
                            <a href='javascript:void(0);'>
                                <img src='${base}/pic/${photodetail.photo}' title='${photodetail.introduce}'
                                     alt='${photodetail.introduce}' bigimg='${base}/pic/${photodetail.photo}'
                                     text='${photodetail.introduce}'/>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="detail_picbot_right">
                <a href="javascript:void(0)" id="nextArrow_B"><img src="${base}/images/photo/right1.jpg" alt="下一个"/></a>
            </div>
        </div>
    </div>
    <!--图片轮换结束-->
</div>

</body>
</html>