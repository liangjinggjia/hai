<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var photoDataGrid;
    $(function() {
        photoDataGrid = $('#photoDataGrid').datagrid({
            url : '${path }/check/getphoto',
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
//            sortName : 'postDate',
//            sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
//            定义树节点的id（用于父子关系和parentField相关）和名字（用于页面显示节点名称）
//            idField : 'id',
//            treeField : 'name',
//            parentField : 'pid',
            fit : true,
            fitColumns : false,
            border : false,
            frozenColumns : [ [ {
                title : 'ID',
                field : 'photocollectionId',
                width : 40
            } ] ],
            columns : [ [ {
                field : 'title',
                title : '标题',
                width : 500
            }, {
                field : 'number',
                title : '相片数量',
                width : 100
            }, {
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/check/modify">
                            str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-black\'" onclick="photodetailFun(\'{0}\');" >修改</a>',row.photocollectionId);
                        </shiro:hasPermission>
                    return str;
                }
            } ] ],
            onLoadSuccess:function(data){
//给按钮赋显示用的名称
                $('.resource-easyui-linkbutton-edit').linkbutton({text:'修改'});

            }
        });
    });
//用于搜索栏
    function searchphotoFun() {
        $("#photoDataGrid").empty();
        photoDataGrid.datagrid('load', $.serializeObject($('#searchphotoForm')));
    }
    function cleanphotoFun() {
        $('#searchphotoForm input').val('');
        photoDataGrid.datagrid('load', {});
    }
    function photodetailFun(id) {
        if (id != undefined) {
            var opts = {
                title : id+'相集',
                border : false,
                closable : true,
                fit : true,
                toolbar : '#modifyToolbar',
//                iconCls : node.iconCls
            };
            var url = "/check/photodetail/"+id;
            if (url && url.indexOf("http") == -1) {
                url = '${path }' + url;
            }
//加载center的内容
                opts.content = '<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:99.5%;"></iframe>';
                addTab(opts);
            }
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchphotoForm">
            <table>
                <tr>
                    <th>关键词:</th>
                    <td><input name="keyWord" placeholder="请输入关键词"/></td>
                    <%--<th>创建时间:</th>--%>
                    <td>
                        <%--<input name="createdateStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" />至--%>
                        <%--<input  name="createdateEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" />--%>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchphotoFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanphotoFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:false"  style="overflow: hidden;">
        <table id="photoDataGrid"></table>
    </div>
</div>
