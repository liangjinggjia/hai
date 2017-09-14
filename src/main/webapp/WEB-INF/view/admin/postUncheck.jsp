<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var uncheckDataGrid;
    $(function() {
        uncheckDataGrid = $('#uncheckDataGrid').datagrid({
            url : '${path }/check/getuncheck',
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            sortName : 'createTime',
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
                field : 'postId',
                width : 40
            } ] ],
            columns : [ [ {
                field : 'postType',
                title : '类别',
                width : 150
            }, {
                field : 'postTitle',
                title : '标题',
                width : 300
//                formatter: function(value,row,index){
//                    return '<a style="color:blue" href="/arbcase/case-'+row.id+'">'+row.collectNo+'</a>';
//                }
            }, {
                field : 'postUnitId',
                title : '单位',
                width : 100
            }, {
                field : 'postAuthor',
                title : '作者',
                width : 80
            }, {
                field : 'postDate',
                title : '日期',
                width : 80
            }, {
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/check/modify">
                            str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-align-justify icon-black\'" onclick="modifyFun(\'{0}\');" >详细</a>',row.postId);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/check/preview">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-page icon-black\'" onclick="previewFun(\'{0}\');" >预览</a>', row.postId);
                        </shiro:hasPermission>

                    return str;
                }
            } ] ],
            onLoadSuccess:function(data){
//给按钮赋显示用的名称
                $('.resource-easyui-linkbutton-edit').linkbutton({text:'详细'});
                $('.resource-easyui-linkbutton-del').linkbutton({text:'预览'});
            }
        });
    });
//用于搜索栏
    function searchUncheckFun() {
        $("#uncheckDataGrid").empty();
        uncheckDataGrid.datagrid('load', $.serializeObject($('#searchUncheckForm')));
    }
    function cleanUncheckFun() {
        $('#searchUncheckForm input').val('');
        uncheckDataGrid.datagrid('load', {});
    }
    function modifyFun(id) {
        if (id != undefined) {
            var opts = {
                title : id+'详细',
                border : false,
                closable : true,
                fit : true,
                toolbar : '#modifyToolbar',
//                iconCls : node.iconCls
            };
            var url = "/check/postuncheckdetail/"+id;
            if (url && url.indexOf("http") == -1) {
                url = '${path }' + url;
            }
//加载center的内容
                opts.content = '<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:99.5%;"></iframe>';
                addTab(opts);
            }
    }

    function previewFun(id) {
        if (id != undefined) {
            var url="/post/"+id;
            window.open(url);
        }

    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchUncheckForm">
            <table>
                <tr>
                    <th>关键词:</th>
                    <td><input name="keyWord" placeholder="请输入关键词"/></td>
                    <th>创建时间:</th>
                    <td>
                        <%--<input name="createdateStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" />至--%>
                        <%--<input  name="createdateEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" />--%>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchUncheckFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanUncheckFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:false"  style="overflow: hidden;">
        <table id="uncheckDataGrid"></table>
    </div>
</div>
