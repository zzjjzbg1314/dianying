<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="author" content="www.frebsite.nl" />
		<meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />

		<title>jQuery.mmenu - Demo</title>
		<!-- douban  start-->
		
		<link href="https://img3.doubanio.com/f/shire/82d7c82f084d5157d7b87a17c76af984dd23dbbf/css/douban.css" rel="stylesheet" type="text/css">
		<link href="https://img3.doubanio.com/f/shire/ae3f5a3e3085968370b1fc63afcecb22d3284848/css/separation/_all.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="https://img3.doubanio.com/f/movie/e9d9543ebc06f2964039a2e94898f84ce77fc070/js/movie/lib/jquery.js"></script>
    	<script type="text/javascript" src="https://img3.doubanio.com/f/shire/f067a26090389e2f0433e64d90f3121eac481d1a/js/douban.js"></script>
    	<script type="text/javascript" src="https://img3.doubanio.com/f/shire/0efdc63b77f895eaf85281fb0e44d435c6239a3f/js/separation/_all.js"></script>	
		
		<!-- douban end -->
		<link rel="stylesheet" href="/gaofen-dianying/resources/css/demo.css" />
		<link rel="stylesheet" href="/gaofen-dianying/resources/css/jquery.mmenu.all.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
		<style type="text/css">
			#menu {
				background: #eee;
			}

			.mm-listview > li > a {
				font-weight: bold;
				font-size: 16px;
				transition: padding 0.5s ease;
			}
			.mm-listview > li > a:hover {
				padding-left: 40px;
			}
			.mm-listview li:nth-child( 1 ) { background: #ffe; }
			.mm-listview li:nth-child( 2 ) { background: #efe; }
			.mm-listview li:nth-child( 3 ) { background: #dff; }
			.mm-listview li:nth-child( 4 ) { background: #eef; }
			.mm-listview li:nth-child( 5 ) { background: #fef; }
			.mm-listview li:nth-child( 5 ) { background: #fef; }
			.mm-listview li:nth-child( 6 ) { background: #ffe; }
		</style>

		<script src="/gaofen-dianying/resources/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/gaofen-dianying/resources/js/jquery.mmenu.all.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#menu")
					.mmenu({
		extensions 	: [ "theme-white", "justified-listview", "border-full", "shadow-page" ],
		navbar 		: false
					}, {
					}).on( 'click',
						'a[href^="#/"]',
						function() {
							alert( "Thank you for clicking, but that's a demo link." );
							return false;
						}
					);
			});
		</script>
	</head>
	<body>
		<div id="page">
			<div class="header">
				<a href="#menu"></a>
				高分电影
			</div>
			<div class="content">
				<!-- content start -->
				
				
				
				
				
				<!-- content end -->
				
			</div>
		</div>
		<nav id="menu">
			<ul>
				<li><a href="#/">励志/剧情</a></li>
				<li><a href="#/">印度/动作</a></li>
				<li><a href="#/">战争/犯罪</a></li>
				<li><a href="#/">科幻/魔幻</a></li>
				<li><a href="#/">喜剧/爱情</a></li>
				<li><a href="#/">动画/记录</a></li>
			</ul>
		</nav>
	</body>
</html>
