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
    <link href="${base}/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
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
                        <li><a href="${base}/hai/main">首页</a></li>
                        <li class="nav-current"><a href="${base}/post/more">新闻</a></li>
                        <li><a href="${base}/photo/more">雄鹰风采</a></li>
                        <li><a href="${base}/history" target="_blank">荣光历史</a></li>
                        <li><a href="/about/">关于</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
<div class="size03">
    <div class="hotlist">
        <div class="list-title">
            <p>热点速递</p>
        </div>
        <ul>
            <c:forEach var="latest" items="${latest}">
                <li>
                    <a title="${latest.postTitle}" class="index-ellipsis-extend" href="${base}/post/${latest.postId}" target="_blank">${latest.postTitle}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="article_border">
    <ul>
        <li class="show_title">${post.postAuthor}</li>
        <li class="show_date">
            作者：<span class="dat">${post.postAuthor}</span>
            发布时间：<span class="dat"><fmt:formatDate value="${post.postDate}" pattern="yyyy-MM-dd"/></span>
            <span class="dat">字体：［<a href="javascript:setSize(20)">大</a> <a href="javascript:setSize(18)">中</a> <a href="javascript:setSize(16)">小</a>］</span>
        </li>
        <li class="Zoom" id="zoom">　　
            ${post.postContent}
        </li>
    </ul>
</div>
<div >
    <img width=100% height="105" src="${base}/images/foot.jpg" border="0" >
</div>


<script src="${base}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    function setSize(size){
        document.getElementById("zoom").style.fontSize=size+'px';
    }
</script>

</body>
</html>