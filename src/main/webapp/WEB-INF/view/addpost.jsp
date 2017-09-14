<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="commom.jsp"%>
<html>
<head>
    <title>input</title>
    <script type="text/javascript" src="${base}/My97DatePicker/WdatePicker.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="${base}/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${base}/ueditor/ueditor.all.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${base}/ueditor/lang/zh-cn/zh-cn.js"></script>

    <link rel="stylesheet" type="text/css" href="${base}/css/charge.css" />
    <link rel="stylesheet" type="text/css" href="${base}/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${base}/css/font-awesome.min.css" />

</head>
<body>
<form class="add" id="add" action="/charge/add" method="post">
    <table>
        <tr>
            <td width="10%" class="pn-flabel pn-flabel-h">标题:</td>
            <td width="40%" class="pn-fcontent" colspan="1">
            <input  type="text" name="postTitle" value="${postWithBLOBs.postTitle}" size="35" maxlength="255">
            </td>
            <td width="10%" class="pn-flabel pn-flabel-h">作者:</td>
            <td width="40%" class="pn-fcontent" colspan="1">
            <input  type="text" name="postAuthor" value="${postWithBLOBs.postAuthor}" size="35" maxlength="255">
            </td>
        </tr>
        <tr>
            <td width="10%" class="pn-flabel pn-flabel-h">单位:</td>
            <td width="40%" class="pn-fcontent" colspan="1">
                <input  type="text" name="postUnitId" value="${postWithBLOBs.postUnitId}" size="35" maxlength="255">
            </td>
            <td width="10%" class="pn-flabel pn-flabel-h">日期:</td>
            <td width="40%" class="pn-fcontent" colspan="1">
                <input  type="text" name="postDate" value="${postWithBLOBs.postDate}" size="35" maxlength="255">
            </td>
        </tr>
        <tr>
            <td width="10%" class="pn-flabel pn-flabel-h">摘要:</td>
            <td colspan=2 class="pn-fcontent" colspan="1">
                <textarea  type="text" name="postAbstract" value="${postWithBLOBs.postAbstract}"rows="5" cols="90">
                </textarea>
            </td>
        </tr>

    </table>
    <!-- 加载编辑器的容器 -->
    <textarea id="container" name="postContent" style="width: 100%; height:800px; margin: 0 auto;">
    </textarea>

    <i class="icon-cog"></i>
    <input type="submit" value="ck">
</form>
<div class="btn-group btn-group-lg" role="group" aria-label="...">
    <button type="button" class="btn btn-default pass">Left</button>
    <button type="button" class="btn btn-default reject">Middle</button>
    <button type="button" class="btn btn-default ">Right</button>
</div>
<script type="text/javascript">
    var ue = UE.getEditor('container');
</script>


</body>
</html>
