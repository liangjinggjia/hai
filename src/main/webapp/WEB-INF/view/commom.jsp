<%--
  Created by IntelliJ IDEA.
  User: zhou
  Date: 2016/12/12
  Time: 17:27
  To change this template use File | Settings | File Templates.
<%--&ndash;%&gt;--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<c:set var="base" value="<%=basePath%>"></c:set>

