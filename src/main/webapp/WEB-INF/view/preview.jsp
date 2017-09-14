<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="commom.jsp"%>
<html>
<head>
    <title>input</title>
</head>
<body>
<br>
${postWithBLOBs.postTitle}
<br>
作者${postWithBLOBs.postAuthor}日期${postWithBLOBs.postDate}
<br>
${postWithBLOBs.postContent}

</body>
</html>
