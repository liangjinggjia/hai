<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/commons/global.jsp" %>
<%@ include file="/commons/basejs.jsp" %>
<%@include file="../commom.jsp" %>
<html>
<head>
    <title>input</title>
    <link rel="stylesheet" type="text/css" href="${base}/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${staticPath }/static/ajaxfileupload.js" charset="utf-8"></script>
    <script type="text/javascript" src="${base}/js/jquery.form.js"></script>
    <script type="text/javascript">
        var i = -1;
        function addone() {

            var ss = "<table id='table" + i + "'><tr><td><input onclick='removeFun(" + i + ");' type='button' value='删除该图片' ></td> </tr>" +
                    "<tr><td>图片</td><td><input id='newphoto" + i + "' type='file'  name='newphoto'  size='34' onchange='uploadNewPhotoFun(" + i + ")'/></td></tr>" +
                    "<tr><td><img id='photo" + i + "'width='375px' height='160px'></td></tr>" +
                    "<tr><td>简介</td><td><textarea name='introduce' rows='5' cols='50'></textarea></td></tr>" +
                    "<tr style='display: none'><td><input name='id' value='" + i + "'/></td></tr>" +
                    "<tr style='display: none'><td><input id='uploadedphoto" + i + "' name='photo' /></td></tr></table>";

            $("#photoscontent").append(ss);
            i--;
        }
        function removeFun(id) {
            $("#table" + id).remove();
        }
        function uploadNewPhotoFun(id) {
            $.ajaxFileUpload(
                    {
                        url: '/check/uploadnewphoto', //用于文件上传的服务器端请求地址
                        secureuri: false, //一般设置为false
                        fileElementId: 'newphoto' + id, //文件上传空间的id属性
                        dataType: 'text', //返回值类型 一般设置为json
                        success: function (data, status)  //服务器成功响应处理函数
                        {
                            $("#photo" + id).attr("src", "/pic/" + data);
// 假设有默认值的情况下，如果用val()赋值了，那么当修改这个值得时候，google不能获取最新的值,所以不用val（）
                            $("#uploadedphoto" + id).attr("value", "" + data);
                        }
                    }
            );
            return false;
        }
        function updatephotoFun() {
            var idarr = new Array();
            var introducearr = new Array();
            var photoarr = new Array();
            var options = {
                beforeSubmit: function validate(formData, jqForm, options) { //在这里对表单进行验证，如果不符合规则，将返回false来阻止表单提交，直到符合规则为止
                    var titleValue = $('input[name=title]').fieldValue();
                    var dateValue = $('input[name=date]').fieldValue();
                    var photoValue = $('input[name=photo]').fieldValue();
                    if (!titleValue[0] || !dateValue[0]) {
                        parent.parent.$.messager.alert('提示', '标题，日期不可为空');
                        return false;
                    }
                    for (var i = 0; i < photoValue.length; i++) {
                        if (!photoValue[i]) {
                            parent.parent.$.messager.alert('提示', '照片不可为空');
                            return false;
                        }
                    }
                    return true;
                },
                success: function (result) {
                    parent.parent.$.messager.alert("操作提示", "相集已更新");
                    parent.refreshTab();
                    <%--parent.$('#index_tabs').tabs('close', ${photos.photocollectionId}+"相集");--%>
                },
                error: function (result) {
                    alert("操作失败" + result);
                }
            };
//idarr
            $("input[name='id']").each(
                    function () {
                        idarr.push($(this).val());
                    }
            );
            $("#idarr").val(idarr);

//introducearr
            $("textarea[name='introduce']").each(
                    function () {
                        introducearr.push($(this).val());
                    }
            );
            $("#introducearr").val(introducearr);
//photoarr
            $("input[name='photo']").each(
                    function () {
                        photoarr.push($(this).val());
                    }
            );
            $("#photoarr").val(photoarr);

            $("#photosform").ajaxSubmit(options);
            return false;
        }
    </script>
    <style type="text/css">
        tr {
            width: 450px;
        }

        td {
            height: 35px;
            margin: 20px;
        }
    </style>

</head>
<form id="photosform" action="${base}/check/photodetailmodify" enctype="multipart/form-data" method="post">
    <tr>
        <td>标题</td>
        <td><input name="title" value="${photos.title}"></td>
    </tr>
    <tr>
        <td>日期</td>
        <td><input name="date" value="<fmt:formatDate value="${photos.date}" pattern="yyyy-MM-dd"/>"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" /></td>
    </tr>
    <tr>
        <td><input type="button" value="提交" onclick="updatephotoFun()"></td>
        <td><input type="button" value="重置" onclick="$('#photosform').resetForm();"></td>
    </tr>
    <input name="photocollectionId" style="display: none" value="${photos.photocollectionId}"/>
    <div id="photoscontent">
    <c:forEach var="photodetail" items="${photos.photodetailList}">
        <table id="table${photodetail.id}">
            <tr>
                <td><input type="button" value="删除该图片" onclick="removeFun(${photodetail.id});"></td>
                    <%--<td><input type="button" value="删除该图片" onclick="$('#table'+${photodetail.id}).remove();"></td>--%>
            </tr>
            <tr>
                <td>图片</td>
                <td><input id="newphoto${photodetail.id}" name="newphoto" type="file" size="34"
                           onchange="uploadNewPhotoFun(${photodetail.id});"/></td>
            </tr>
            <tr>
                <td><img id="photo${photodetail.id}" width="375px" height="160px" src="/pic/${photodetail.photo}"></td>
            </tr>
            <tr>
                <td>简介</td>
                <td><textarea name="introduce" rows="5" cols="50">${photodetail.introduce}</textarea></td>
            </tr>
            <tr style="display: none">
                <td><input name="id" value="${photodetail.id}"/></td>
            </tr>
            <tr style="display: none">
                <td><input id="uploadedphoto${photodetail.id}" name="photo" type="text" value="${photodetail.photo}"/>
                </td>
            </tr>
        </table>
        <%--<input name="id" style="display: none" value="${photodetail.id}"/>--%>
        <%--<input id="uploadedphoto${photodetail.id}" name="photo" style="display: none" value="${photodetail.photo}"/>--%>
    </c:forEach>
    </div>
    <tr>
        <input type="button" value="再来一张" onclick="addone()">
    </tr>
    <input type="hidden" id="idarr" name="idarr"/>
    <input type="hidden" id="introducearr" name="introducearr"/>
    <input type="hidden" id="photoarr" name="photoarr"/>
</form>


</body>
</html>