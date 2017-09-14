<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../commom.jsp"%>
<%--<script type="text/javascript" src="${base}/css/charge.css" charset="utf-8"></script>--%>
<script type="text/javascript" src="${base}/js/jquery.form.js"></script>

<script type="text/javascript">
       function turn(number){
            var options = {
                dataType:"json",
                success: function(result) {
                    if (result.success == false) {
//                        title：显示在头部面板上的标题文本。
//                        msg：要显示的消息文本。
//                        icon：要显示的图标图片。可用的值是：error、question、info、warning。
//                        fn：当窗口关闭时触发的回调函数。
                    parent.$.messager.alert("操作提示", ""+result.msg,"error");
                    parent.refreshTab();}
                    if (result.success == true) {
                        parent.$.messager.alert("操作提示", ""+result.msg);
                        parent.refreshTab();}
                },
                error : function(result){
                    alert(result);
                }
            };
            $("#"+number).ajaxSubmit(options); // jquery 表单提交,提交完后就不会跳转
            return false;  // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
        };
</script>
<style type="text/css">
tr{width: 450px;}
td{
    height: 35px;
    margin: 20px;}
</style>
<c:forEach var="turn" items="${turns}">
    <form id="${turn.id}" class="turn" action="/check/updateturn" enctype="multipart/form-data" method="post">
    <c:set var="newbutton">button${turn.id}</c:set>
    <table>
        <input  name="id" value="${turn.id}" style="display: none"></td>
        <tr>
            <td>文章ID</td><td><input  name="postid" value="${turn.postid}"></td><td rowspan="4"><img width="375px" height="160px"  src="/pic/${turn.picture}"></td>
        </tr>
        <tr>
            <td>轮播图片</td><td><input type="file"  name="pic"  size="34"/></td>
        </tr>
        <tr>
            <td>标题</td><td><input name="introduce" value="${turn.introduce}"size="50"></td>
        </tr>
        <tr>
            <td><input type="button" id="${newbutton}" value="提交" onclick="turn(${turn.id});"></td>
        </tr>
    </table>
    </form>
</c:forEach>
