<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript" src="${base}/js/jquery.form.js"></script>
<script type="text/javascript">
    $('#rejectForm').form({
        url : '${path }/check/reject',
        onSubmit : function() {
            progressLoad();
            var isValid = $(this).form('validate');
            if (!isValid) {
                progressClose();
            }
            return isValid;
        },
        success : function(result) {
            progressClose();
            result = $.parseJSON(result);
            if (result.success) {
                parent.rejecttounchecktabs();
                parent.$.modalDialog.handler.dialog('close');
            } else {
                parent.$.messager.alert('提示', result.msg, 'warning');
            }
        }
    });


</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="rejectForm" method="post" action="check/reject" >
            <div class="light-info" style="overflow: hidden;padding: 3px;">
                <div>密码不修改请留空。</div>
            </div>
            <table class="grid">
                <tr>
                    <td>文章ID</td>
                    <td><input name="postId" value="${postId}"/></td>
                </tr>
                <tr>
                    <td>退稿原因</td>
                </tr>
                <tr>
                    <td colspan='2'>
                    <textarea  type="text" name="rejectReason" rows="3" cols="60">
                    </textarea>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>