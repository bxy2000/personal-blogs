<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="../share/_include_meta.jsp" />
<title>播思客 | 技术博文</title>
<meta name="keywords" content="${article.metaKeywords }">
<meta name="description" content="${article.metaDescription }" />

<jsp:include page="../share/_include_css.jsp" />
</head>

<body class="home-template">

	<jsp:include page="../share/_header_top.jsp" />

	<jsp:include page="../share/_header_nav.jsp" />

	<!-- start site's main content area -->
	<section class="content-wrap">
		<div class="container">
			<div class="row">
				<main class="col-md-8 main-content">
					<article id="${article.id}" class="post">
						<header class="post-head">
							<h1 class="post-title">${article.title }</h1>
							<section class="post-meta">
								<span class="author">作者：<a href="#">${article.author}</a></span> &bull;
								<time class="post-date" datetime="${article.createDate }" title="${article.createDate }">${article.createDate }</time>
							</section>
						</header>
	
						<section class="post-content">
							${article.content }
	
							<hr />
							<p>原文：<a href="#">${article.title}</a></p>
						</section>
	
						<footer class="post-footer clearfix">
							<div class="pull-left tag-list">
								<i class="fa fa-folder-open-o"></i>
							</div>
	
							<div class="pull-right share">
								<div class="bdsharebuttonbox share-icons">
									<a href="#" class="bds_more" data-cmd="more"></a>
									<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
									<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
									<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
									<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
									<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
								</div>
							</div>
						</footer>
					</article>

				</main>
				<aside class="col-md-4 sidebar">
					<!-- start tag cloud widget -->
					<div class="widget">
						<h4 class="title">社区</h4>
						<div class="content community">
							<p>QQ群：638855813</p>
						</div>
					</div>
					<!-- end tag cloud widget -->

					<div class="widget">
						<h4 class="title">${article.author } 全部文章</h4>
						<div class="content hot">
							<ul>
								<c:forEach var="article" items="${articles }">
									<li><a href="${pageContext.request.contextPath}/home/read/${article.id}?tid=${param.tid}">${article.title}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</aside>
			</div>
		</div>
	</section>

	<jsp:include page="../share/_footer_copyright.jsp" />

	<a href="#" id="back-to-top"><i class="fa fa-angle-up"></i></a>

	<jsp:include page="../share/_include_js.jsp" />
</body>
</html>