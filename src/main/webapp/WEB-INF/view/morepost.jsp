<%@include file="commom.jsp" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8">
    <title>$Title$</title>
    <link href="${base}/css/main.css" rel="stylesheet">
    <link href="${base}/css/hai.css" rel="stylesheet">

    <script type='text/javascript' src="${base}/js/kkpager.js"></script>
    <script type='text/javascript' src="${base}/js/jquery-3.1.1.min.js"></script>
    <script type='text/javascript'src="${base}/js/handlebars-v4.0.5.js"></script>


</head>
<body>
<div class="header">
    <div class="inner">
        <img width="1100" height="105" src="${base}/images/head.jpg" border="0">
    </div>

</div>
<nav class="main-navigation">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="collapse navbar-collapse" id="main-menu">
                    <ul class="menu">
                        <li class="nav-current"><a href="${base}/hai/main">首页</a></li>
                        <li><a href="${base}/post/more">新闻</a></li>
                        <li><a href="${base}/photo/more">雄鹰风采</a></li>
                        <li><a href="${base}/history" target="_blank">荣光历史</a></li>
                        <li><a href="/about/">关于</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
<div class="container01">
    <div class="size07">
        <div>
            <form action="javascript:void(0);" name="search" id="queryDiv">
                <table border="0" align="center" cellpadding="0" cellspacing="0" class="tab_search">
                    <tr>
                        <td>
                            <%--<input type="text" id = "textInput" title="Search" class="searchinput" onblur="if(this.value=='')value='请输入关键词';" onfocus="if(this.value=='请输入关键词')value='';" value="请输入关键词" size="10"/>--%>
                            <input type="text" id="textInput" title="Search" class="searchinput" placeholder="请输入关键词"
                                   size="10"/>
                        </td>
                        <td>
                            <input type="image" id="queryButton" width="21" height="17" class="searchaction"
                                   alt="Search" src="../../images/search.gif" border="0" hspace="2"/>
                        </td>
                    </tr>
                </table>
            </form>
            <h3><span id="blocktitle">中大新闻</span> <span class="newsdown" id="blocktitle01">NEWS &amp; EVENTS</span></h3>
            <%--<div id = "queryDiv">--%>
            <%--<input id = "textInput" type="text" >--%>
            <%--<button id = "queryButton" class="btn btn-primary" type="button">查询</button>--%>
            <%--</div>--%>
        </div>
        <form id="ajax">
            <table class="table table-bordered" id='tableResult'>
                <ul id="tableBody">
                </ul>
            </table>
            <!-- 底部分页按钮 -->
            <div id="bottomTab"></div>
        </form>
    </div>
    <div class="size03">
        <div class="hotlist">
            <div class="list-title">
                <p>热点速递</p>
            </div>
            <ul>
                <c:forEach var="post" items="${latest}">
                    <li>
                        <a title="${post.postTitle}" class="index-ellipsis-extend" href="${base}/post/${post.postId}"
                           target="_blank">${post.postTitle}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<%--导航栏js--%>
<script type="text/javascript">
    var urlstr = window.document.location.pathname;
    var urlstatus = false;
    $(".menu > li").each(function () {
        var lihref = $(this).children("a").attr('href');
        if (($(this).children("a").attr('href')).indexOf(urlstr) > -1 && $(this).attr('href') != '') {
            $(this).addClass('nav-current');
            urlstatus = true;
        } else {
            $(this).removeClass('nav-current');
        }
    });

    if (!urlstatus) {
        $(".menu > a").eq(0).addClass('nav-current');
    }
</script>
<!--id可以用来唯一确定一个模版,type是模版固定的写法-->
<script id="table-template" type="text/x-handlebars-template">
    {{#each dataList}}
    <div class="hang">
        <div class="posttime">{{postDate}}</div>
        <h6>{{postTitle}}</h6>
        <a href="${base}/post/{{postId}}" target="_blank">
            <div class="postabstract">
                <p>{{postAbstract}}</p>
            </div>
        </a>
    </div>
    {{/each}}
</script>
<script type='text/javascript'>
    var PAGESIZE = 10;
    //获取当前项目的路径
    var urlRootContext = (function () {
//location.pathname返回URL的域名后的部分。例如 http://www.dreamdu.com/xhtml/ 返回/xhtml/但不含后面的参数
        var strPath = window.document.location.pathname;
//indexOf() 方法可返回某个指定的字符串值在字符串中首次出现的位置
//substring() 方法用于提取字符串中介于两个指定下标之间的字符（第二个参数可省），注意是之间所以是0，+1
        var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
        return postPath;
    })();


    //生成表格
    function buildTable(keyWord, pageNumber, pageSize) {
        //        “/post/getall”会变成post/post/getall
        var url = urlRootContext + "/getall"; //请求的网址
        var reqParams = {'keyWord': keyWord, 'pageNumber': pageNumber, 'pageSize': pageSize};//请求数据
        $.ajax({
            type: "POST",
            url: url,
            data: reqParams,
            async: false,
            dataType: "json",
            success: function (data) {
                if (data.isError == false) {
                    var pageSize = data.pageSize == 0 ? 1 : data.pageSize;
                    var pageNo = data.pageNo == 0 ? 1 : data.pageNo;
                    var totalPage = data.pages == 0 ? 1 : data.pages;//总页面数目
                    var totalRecords = data.total == 0 ? 1 : data.total;//总条数
                    //生成分页控件 根据分页的形式在这里设置
                    kkpager.init({
                        pno: pageNo,
                        //总页码
                        total: totalPage,
                        //总数据条数
                        totalRecords: totalRecords,
                        //页面条数
                        pageSize: pageSize
                    });
                    kkpager.generPageHtml();

                    var dataList = data.dataList;

                    if (dataList.length > 0) {

                        $("#tableBody").empty();//清空表格内容
//注册一个Handlebars模版，通过id找到某一个模版，获取模版的html框架
// $("#table-template").html()是jquery的语法，不懂的童鞋请恶补。。。
                        var myTemplate = Handlebars.compile($("#table-template").html());
//将json对象用刚刚注册的Handlebars模版封装，得到最终的html，插入到基础table中。
                        $('#tableBody').html(myTemplate(data));
                        postDotFun();
                    } else {
                        $("#tableBody").append('<tr><th colspan ="4"><center>查询无数据</center></th></tr>');
                    }
                } else {
                    alert(data.errorMsg);
                }
            },
            error: function (e) {
                alert("查询失败:" + e);
            }
        });
    }
    function postDotFun() {
        $(".postabstract").each(function (i) {
            var divH = $(this).height();
            var $p = $("p", $(this)).eq(0);
            while ($p.outerHeight() > divH) {
                $p.text($p.text().replace(/(\s)*([a-zA-Z0-9]+|\W)(\.\.\.)?$/, "..."));
            }
            ;
        });
    }

    //渲染完就执行
    $(function () {
        //refreshData(20,1,10,json.length);
        var pageSize = 10;
        var pageNo = 1;
//      builderUQTQueryMsg(getJsonArrayByPageSize(pageSize,pageNo));
//
//      var totalPage = getTotllePage(pageSize);
//      var totalRecords = json.length;

        var totalPage = 10;
        var totalRecords = 200;
        //生成分页控件 根据分页的形式在这里设置
        kkpager.init({
            pno: pageNo,
            //总页码
            total: totalPage,
            //总数据条数
            totalRecords: totalRecords,
            //页面条数
            pageSize: pageSize
        });
        kkpager.generPageHtml();
        //使用kkpager分页插件，更新数据必须要buildTable(keyworld,1,PAGESIZE)来创建函数，不带条件时要""(若可以实现条件查询那么sql语句就改)
        buildTable("", 1, pageSize);//默认空白查全部
        postDotFun();
        //创建结算规则
        $("#queryButton").bind("click", function () {
            if ($("#textInput").val() == "请输入关键词") {
                $("#textInput").val("");
            }
            var keyWorld = $("#textInput").val();
            buildTable(keyWorld, 1, PAGESIZE);
        });

    });

</script>

<%--show命令用于直接跳转到特定的page，与直接点击操作按钮的效果是一样的。使用方法，如：$('#example').bootstrapPaginator("show",3) 直接跳转到第3页，$('#example').bootstrapPaginator("show",100)直接跳转到100页。--%>
</body>
</html>
