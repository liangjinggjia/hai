<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/commons/global.jsp" %>
<%@ include file="/commons/basejs.jsp" %>
<%@include file="../commom.jsp"%>

<html>
<head>
    <title>input</title>
    <script type="text/javascript" src="${base}/js/jquery.form.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="${base}/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${base}/ueditor/ueditor.all.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${base}/ueditor/lang/zh-cn/zh-cn.js"></script>

    <link rel="stylesheet" type="text/css" href="${base}/css/bootstrap.min.css" />

</head>
<script type="text/javascript">
    $(function() {
        $("#postUnitId").combotree({
            url : '${base}/organization/tree',
            parentField : 'pid',
            lines : true,
            panelHeight : 'auto'
        })});
    function posttoPassFun(){
        var options = {
            beforeSubmit:function validate(formData, jqForm, options){
                for (var i=0; i < formData.length; i++) {
                    if (!formData[i].value) {
                        parent.$.messager.alert('提示','所有内容不能为空!');
                        return false;
                    }
                }
                return true;
            },
            url:"${base}/check/addtopass",
            success: function(result) {
                parent.postopass();
            },
            error:function(result){
                alert("操作失败"+result);
            }
        };
        $("#modify").ajaxSubmit(options); // jquery 表单提交,提交完后就不会跳转
        return false;  // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
    }
    function posttoCheckFun(){
        var options = {
            beforeSubmit:function validate(formData, jqForm, options){
                for (var i=0; i < formData.length; i++) {
                    if (!formData[i].value) {
                        parent.$.messager.alert('提示','所有内容不能为空!');
                        return false;
                    }
                }
                return false;
            },
            url:"${base}/check/addtocheck",
            success: function(result) {
                parent.postouncheck();
            },
            error:function(result){
                alert("操作失败"+result);
            }
        };
        $("#modify").ajaxSubmit(options); // jquery 表单提交,提交完后就不会跳转
        return false;  // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
    }

</script>
<nav class="navbar navbar-default navbar-fixed-top">
    <ul class="nav navbar-nav">
        <shiro:hasPermission name="/check/pass">
            <li><a class="tool" href="javascript:void(0);"><input class="pass" onclick="posttoPassFun()" type="submit"value="上传发布"></a></li>
        </shiro:hasPermission>
        <shiro:hasPermission name="/check/gotoadd">
            <li><a class="tool" href="javascript:void(0);"><input class="pass" onclick="posttoCheckFun()" type="submit" value="上传审核"></a></li>
        </shiro:hasPermission>
        <%--<shiro:hasPermission name="/check/preview">--%>
            <%--<li><a class="tool" href="javascript:void(0);"><input class="preview" onclick="previewFun()" type="submit" value="预览"></a></li>--%>
        <%--</shiro:hasPermission>--%>
    </ul>
</nav>

<div class="position">
    <form id="modify" class="add"  method="post">
        <table>
            <tr>
                <td width="10%" class="pn-flabel pn-flabel-h">标题:</td>
                <td width="40%" class="pn-fcontent" colspan="1">
                    <input  type="text" name="postTitle"  size="35" maxlength="255">
                </td>
                <td width="10%" class="pn-flabel pn-flabel-h">作者:</td>
                <td width="40%" class="pn-fcontent" colspan="1">
                    <input  type="text" name="postAuthor" size="35" maxlength="255">
                </td>
            </tr>
            <tr>
                <td width="10%" class="pn-flabel pn-flabel-h">单位:</td>
                <td width="40%" class="pn-fcontent" colspan="1">
                    <select id="postUnitId" name="postUnitId" style="width: 140px; height: 29px;" ></select>
                </td>
                <td width="10%" class="pn-flabel pn-flabel-h">日期:</td>
                <td width="40%" class="pn-fcontent" colspan="1">
                    <input name="postDate" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td width="10%" class="pn-flabel pn-flabel-h">摘要:</td>
                <td colspan=2 class="pn-fcontent" colspan="1">
                <textarea  type="text" name="postAbstract" rows="5" cols="90">
                </textarea>
                </td>
            </tr>
        </table>
        <!-- 加载编辑器+
        的容器 -->
            <textarea id="container" name="postContent"></textarea>
    </form>
</div>

<script type="text/javascript">
    var ue = UE.getEditor('container');
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