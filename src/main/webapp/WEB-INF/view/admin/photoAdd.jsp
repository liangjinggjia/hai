<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../commom.jsp"%>
<script type="text/javascript" src="${base}/js/jquery.form.js"></script>

<script type="text/javascript">
       function addone() {
           var ss = "<tr><td>图片</td><td><input type='file'  name='photo'  size='34'/></td></tr>" +
                   "<tr><td>简介</td><td><textarea name='introduce' rows='5' cols='50'></textarea></td></tr>";
//                alert($("#photos").html())
//                $("#photos").html+ss;

           $("#photos").append(ss);
           //$("#photos").html($("#photos").html() + ss);
           //document.getElementById("photos").innerHTML+=ss;
       }


       function setphotoFun() {
           var introducearr = new Array();
           var options={
               beforeSubmit:function validate(formData, jqForm, options) { //在这里对表单进行验证，如果不符合规则，将返回false来阻止表单提交，直到符合规则为止
                   var titleValue = $('input[name=title]').fieldValue();
                   var dateValue = $('input[name=date]').fieldValue();
                   var photoValue = $('input[name=photo]').fieldValue();
                   if (!titleValue[0] || !dateValue[0]){
                       parent.parent.$.messager.alert('提示','标题，日期不可为空');
                       return false;
                   }
                   for(var i=0;i<photoValue.length;i++){
                       if(!photoValue[i]){
                           parent.parent.$.messager.alert('提示','照片不可为空');
                           return false;
                       }
                   }
                   return true;
               },
               success: function(result) {
                   parent.parent.$.messager.alert("操作提示", "相集已提交");
                   parent.$('#index_tabs').tabs('close', "相集发布");
               },
               error:function(result){
                   alert("操作失败"+result);
               }
           };
           $("input[name='introduce']").each(
                   function() {
                       introducearr.push($(this).val());
                   }
           );
           $("#introducearr").val(introducearr);
           $("#photosform").ajaxSubmit(options);
//           阻止表单默认提提交
           return false;
       }
</script>
<style type="text/css">
tr{width: 450px;}
td{
    height: 35px;
    margin: 20px;}
</style>
<form  id="photosform" action="${base}/check/setphotos" enctype="multipart/form-data" method="post">
    <table id="photos">
        <tr>
            <td>标题</td><td><input  name="title" ></td></td>
        </tr>
        <tr>
            <td width="10%" class="pn-flabel pn-flabel-h">日期:</td>
            <td width="40%" class="pn-fcontent" colspan="1">
                <input name="date" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly"  />
            </td>
        </tr>
        <tr>
            <input type="button" value="再来一张" onclick="addone()">
        </tr>
        <tr>
            <td>图片</td><td><input type="file" name="photo" size="34"></td>
        </tr>
        <tr>
            <td>简介</td><td><textarea name="introduce" rows="5" cols="50" placeholder="简介可以为空"></textarea></td>
        </tr>
        <tr>
            <td><input type="button" value="提交" onclick="setphotoFun()"></td>
        </tr>
        <input type="hidden" id="introducearr" name="introducearr"/>
    </table>
</form>