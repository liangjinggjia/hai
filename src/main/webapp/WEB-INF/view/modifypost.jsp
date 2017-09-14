<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="commom.jsp"%>
<html>
<head>
    <title>input</title>
    <script type="text/javascript" charset="utf-8" src="${base}/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${base}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${base}/js/jquery.form.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="${base}/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${base}/ueditor/ueditor.all.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${base}/ueditor/lang/zh-cn/zh-cn.js"></script>

    <link rel="stylesheet" type="text/css" href="${base}/css/charge.css" />
    <link rel="stylesheet" type="text/css" href="${base}/css/bootstrap.min.css" />

</head>
<script type="text/javascript">
    function pass(id){
       $("#modify").submit();
        //调用index.jsp方法
        parent.myclosetabs(id);
    }

    function reject(id){
        if (id == null) {
        }
        parent.$.modalDialog({
            title : '退稿',
            width : 500,
            height : 300,
            href : '${path }/check/gotoreason/'+id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    var f = parent.$.modalDialog.handler.find('#rejectForm');
                    f.submit();
//                    parent.rejecttounchecktabs(id);

                }
            } ]
        });
    }
    function previewFun(id) {
        if (id != undefined) {
            var url = "/post/" + id;
            window.open(url);
        }
    }

</script>
<nav class="navbar navbar-default navbar-fixed-top">
        <ul class="nav navbar-nav">
<shiro:hasPermission name="/check/pass">
            <li><a class="tool" href="javascript:void(0);"><input class="pass" onclick="pass(${postWithBLOBs.postId})" type="submit"value="公开"></a></li>
</shiro:hasPermission>
<shiro:hasPermission name="/check/reject">
            <li><a class="tool" href="javascript:void(0);"><input class="reject" onclick="reject(${postWithBLOBs.postId})" type="submit" value="退稿"></a></li>
</shiro:hasPermission>
<shiro:hasPermission name="/check/preview">
            <li><a class="tool" href="javascript:void(0);"><input class="preview" onclick="previewFun(${postWithBLOBs.postId})" type="submit" value="预览"></a></li>
</shiro:hasPermission>
        </ul>
</nav>

<div class="position">
<form id="modify" class="add" action="/check/pass" method="post">
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
                <input  type="text" name="postDate" value="<fmt:formatDate value="${postWithBLOBs.postDate}" pattern="yyyy-MM-dd"/>" size="35" maxlength="255">
            </td>
        </tr>
        <tr>
            <td width="10%" class="pn-flabel pn-flabel-h">摘要:</td>
            <td colspan=2 class="pn-fcontent" colspan="1">
                <textarea  type="text" name="postAbstract" rows="5" cols="90">
                    ${postWithBLOBs.postAbstract}
                </textarea>

            </td>
        </tr>

    </table>
    <!-- 加载编辑器+
    的容器 -->

    <div id="container" name="postContent">
    </div>
    <input style="display: none" name="postId" value="${postWithBLOBs.postId}">
</form>
</div>

<div id="content" style="display: none" >${postWithBLOBs.postContent}</div>

<script type="text/javascript">
    var ue = UE.getEditor('container');
    ue.ready(function(){   //启动富文本编辑前，提前加载
        <%--ue.setContent("${postWithBLOBs.postContent}");--%>
//        ue.setContent($("#content").val());
        ue.execCommand('insertHtml', ${postWithBLOBs.postContent});
        var ct= ue.getContent();
    });
</script>

<%--<script type="text/javascript">--%>
    <%--var URL = "http://localhost:8080";--%>
    <%--var ue = UE.getEditor('container', {--%>
        <%--//为编辑器实例添加一个路径，这个不能被注释--%>
        <%--UEDITOR_HOME_URL: URL + '/ueditor/',--%>
        <%--// 服务器统一请求接口路径--%>
        <%--serverUrl: URL + '/ueditor/jsp/controller.jsp',--%>
    <%--});--%>


    <%--/**--%>
     <%--* js获取项目根路径，如： http://localhost:8083/project--%>
     <%--*/--%>
    <%--function getRootPath(){--%>
        <%--//获取当前网址，如： http://localhost:8083/project/share/meun.jsp--%>
        <%--var curWwwPath=window.document.location.href;--%>

        <%--//获取主机地址之后的目录，如： project/share/meun.jsp--%>
        <%--var pathName=window.document.location.pathname;--%>

        <%--var pos=curWwwPath.indexOf(pathName);--%>

        <%--//获取主机地址，如： http://localhost:8083--%>
        <%--var localhostPaht=curWwwPath.substring(0,pos);--%>

        <%--//获取带"/"的项目名，如：/project--%>
        <%--var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);--%>

        <%--//return localhostPaht + projectName;--%>
        <%--return localhostPaht + projectName;--%>
    <%--}--%>
<%--</script>--%>


</body>
</html>