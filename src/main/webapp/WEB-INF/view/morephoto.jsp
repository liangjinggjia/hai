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
    <link href="${base}/css/photo/photo.css" rel="stylesheet">
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">

    <script type='text/javascript' src="${base}/js/bootstrap/js/bootstrap.min.js"></script>
    <script type='text/javascript' src="${base}/js/jquery-3.1.1.min.js"></script>
    <script type='text/javascript' src="${base}/js/photo/photokkpager.js"></script>
    <script type='text/javascript' src="${base}/js/handlebars-v4.0.5.js"></script>
    <script type='text/javascript' src="${base}/js/photo/main.js"></script>

</head>
<div class="header">
    <div class="inner">
        <img width="1100" height="105" src="${base}/images/head.jpg" border="0">
    </div>
</div>
<nav class="main-navigation" style="margin-bottom: 0px;">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="collapse navbar-collapse" id="main-menu">
                    <ul class="menu">
                        <li class="nav-current"><a href="/hai/main">首页</a></li>
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

<div class="wrap wrap_gray pt20">
    <div class="container">
        <div class="row">
            <ul id="tableBody">
            </ul>
            <div id="bottomTab"></div>
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
    <div class="col-sm-3">
        <div class="thumbnail thumbnail_small">
            <a href="${base}/photo/{{photocollectionId}}" class="thumbnail__link">
                {{#photodetailList}}
                <img src="${base}/pic/{{photo}}" style="height: 153px;width: 270px;">
                {{/photodetailList}}
            </a>
            <div class="caption thumbnail__caption">
                <div class="news caption__news">
                    <p class="news__category yellow-line">{{title}}</p>
                    <div class="introduce">
                        <p class="news__text">
                            {{#photodetailList}}
                            {{introduce}}
                            {{/photodetailList}}
                        </p>
                    </div>
                </div>
                <div class="posted">
                    <span class="posted__date">{{date}}</span>
                    <%--<ul class="posted__icon">--%>
                    <%--<li>--%>
                    <%--<span>--%>
                    <%--<i class="icon-comment-empty"></i>29--%>
                    <%--</span>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<span>--%>
                    <%--<i class="icon-eye"></i>2.3k--%>
                    <%--</span>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                </div>
            </div>
        </div>
    </div>
    {{/each}}
</script>
<script type='text/javascript'>
    var PAGESIZE = 12;
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
            async: false,//
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
                        photoDotFun();
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

    function photoDotFun(){
        $(".introduce").each(function(i){
            var divH = $(this).height();
            var $p = $("p", $(this)).eq(0);
            while ($p.outerHeight() > divH) {
                $p.text($p.text().replace(/(\s)*([a-zA-Z0-9]+|\W)(\.\.\.)?$/, "..."));
            };
        });
    }

    //渲染完就执行
    $(function () {
        //refreshData(20,1,10,json.length);
        var pageSize = 12;
        var pageNo = 1;
//      builderUQTQueryMsg(getJsonArrayByPageSize(pageSize,pageNo));
//
//      var totalPage = getTotllePage(pageSize);
//      var totalRecords = json.length;

        var totalPage = 10;
        var totalRecords = 120;
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
        photoDotFun();

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
<script>
    //    $(function () {
    //        $(".introduce").dotdotdot();
    //    });
</script>

<%--show命令用于直接跳转到特定的page，与直接点击操作按钮的效果是一样的。使用方法，如：$('#example').bootstrapPaginator("show",3) 直接跳转到第3页，$('#example').bootstrapPaginator("show",100)直接跳转到100页。--%>
</body>
</html>
