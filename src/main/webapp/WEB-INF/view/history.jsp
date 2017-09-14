<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="commom.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery网站发展历史时间轴 - 站长素材</title>
<link rel="stylesheet" type="text/css" href="${base}/history/css/history.css">
<script type="text/javascript" src="${base}/history/js/jquery.js"></script>
<script type="text/javascript" src="${base}/history/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${base}/history/js/jquery.easing.js"></script>
<script type="text/javascript" src="${base}/history/js/history.js"></script>

</head>
<body>

<div id="arrow">
	<ul>
		<li class="arrowup"></li>
		<li class="arrowdown"></li>
	</ul>
</div>

<div id="history">

	<div class="title">
		<h2>网站成长史</h2>
		<div id="circle">
			<div class="cmsk"></div>
			<div class="circlecontent">
				<div thisyear="1951" class="timeblock">
					<span class="numf" style="background-position: 0px -24px;"></span>
					<span class="nums" style="background-position: 0px -216px;"></span>
					<span class="numt" style="background-position: 0px -120px;"></span>
					<span class="numfo" style="background-position: 0px -24px;"></span>
					<div class="clear"></div>
				</div>
				<div class="timeyear">YEAR</div>
			</div>
			<a href="#" class="clock"></a>
		</div>
	</div>
	
	<div id="content">
		<ul class="list">
			<li style="margin-top:-550px;">
				<div class="liwrap">
					<div class="lileft">
						<div class="date">
						    <span class="md">0905</span>
							<span class="year">2016</span>
						</div>
					</div>
					
					<div class="point"><b></b></div>
					
					<div class="liright">
						<div class="histt"><a href="#">HTML5 CSS3 发展历程 发布</a></div>
						<div class="hisct">修正了上一版本中的错误，欢迎大家测试，如果发现问题请联系我们,谢谢。</div>
					</div>
				</div>
			</li>
			<li>
				<div class="liwrap">
					<div class="lileft">
						<div class="date">
						    <span class="md">0807</span>
							<span class="year">2015</span>
						</div>
					</div>
					
					<div class="point"><b></b></div>
					
					<div class="liright">
						<div class="histt"><a href="#">HTML5 CSS3 发展历程 发布</a></div>
						<div class="hisct">随着用户的访问量增大,功能不能满足需求，我们进行了重大更新，对设计和功能都进行大幅度的升级,增加了原创，欣赏版块</div>
					</div>
				</div>
			</li>
			<li>
				<div class="liwrap">
					<div class="lileft">
						<div class="date">	
							<span class="md">0528</span>
							<span class="year">2013</span>
						</div>
					</div>
					
					<div class="point"><b></b></div>
					
					<div class="liright">
						<div class="histt"><a href="#">官方微博</a></div>
						<div class="hisct">推出了HTML5 CSS3 官方微博</div>
					</div>
				</div>
			</li>
			<li>
				<div class="liwrap">
				
					<div class="lileft">
						<div class="date">
						    <span class="md">0524</span>
							<span class="year">2013</span>
						</div>
					</div>
					
					<div class="point"><b></b></div>
					
					<div class="liright">
						<div class="histt"><a href="#">HTML5 CSS3 发展历程 上线</a></div>
						<div class="hisct">虽然功能还未健全，但是我们已迫不及待的让它去接受广大用户的火眼金睛</div>
					</div>
				</div>
			</li>
			<li>
				<div class="liwrap">
					<div class="lileft">
						<div class="date">
                            <span class="md">0508</span>
							<span class="year">2002</span>
						</div>
					</div>
					
					<div class="point"><b></b></div>
					
					<div class="liright">
						<div class="histt"><a href="#">初期讨论</a></div>
						<div class="hisct">在集体探讨下，发现目前的HTML5 CSS3 发展历程已经不能满足需求，集体讨论=，这时候，韩老师之前的设计稿被端上了会议桌。</div>
					</div>
				</div>
			</li>
			<li>
				<div class="liwrap">
					<div class="lileft">
						<div class="date">
							<span class="md">0701</span>
							<span class="year">1999</span>
						</div>
					</div>
					
					<div class="point"><b></b></div>
					
					<div class="liright">
						<div class="histt"><a href="#">灵感迸发</a></div>
						<div class="hisct">某天晚上的凌晨三点一刻，预想建立这样一个功能的网站，专为网页设计师。</div>
					</div>
				</div>
			</li>
			<li>
				<div class="liwrap">
				
					<div class="lileft">
						<div class="date">
							<span class="md">0524</span>
							<span class="year">1984</span>
						</div>
					</div>
					
					<div class="point"><b></b></div>
					
					<div class="liright">
						<div class="histt"><a href="#">HTML5 CSS3 发展历程 上线</a></div>
						<div class="hisct">虽然功能还未健全，但是我们已迫不及待的让它去接受广大用户的火眼金睛</div>
					</div>
				</div>
			</li>
			<li>
				<div class="liwrap">
					<div class="lileft">
						<div class="date">
						    
							<span class="year">1951</span>
						</div>
					</div>
					
					<div class="point"><b></b></div>
					
					<div class="liright">
						<div class="histt"><a href="#">初见成效</a></div>
						<div class="hisct">代码笔记第一版上线</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>
<div style="text-align:center;clear:both">
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
</div>
</body>
</html>