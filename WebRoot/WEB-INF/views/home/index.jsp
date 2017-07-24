<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="../share/_include_meta.jsp" />

<title>播思客 | 技术博文</title>
<meta name="keywords" content="">
<meta name="description" content="" />

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
                	<c:forEach var="article" items="${articles.rows}">
						<article id="${article.id}" class="post">
							<div class="post-head">
								<h1 class="post-title">
									<a href="${pageContext.request.contextPath}/home/read/${article.id}?tid=${param.id}">${article.title }</a>
								</h1>
								<div class="post-meta">
									<span class="author">作者：<a href="${pageContext.request.contextPath}/home/read/${article.id}?tid=${param.id}">${article.author}</a></span> &bull;
									<time class="post-date " datetime="${article.createDate}" title="${article.createDate}">${article.createDate}</time>
								</div>
							</div>
							<div class="post-content">
								<p>
									${article.profile}
								</p>
							</div>
							<div class="post-permalink">
								<a href="${pageContext.request.contextPath}/home/read/${article.id}?tid=${param.id}" class="btn btn-default">阅读全文</a>
							</div>
						
							<footer class="post-footer clearfix">
								<div class="pull-left tag-list">
									<i class="fa fa-folder-open-o"></i>
								</div>
								<div class="pull-right share">
								</div>
							</footer>
						</article>
                	</c:forEach>
                	
                	<c:choose>
						<c:when test="${articles.count == 0 }">
							暂无文章
						</c:when>
						<c:otherwise>
							<nav>
							    <span class="page-number">第 ${articles.index }页 &frasl; 共 ${articles.total}页</span>
								<ul class="pagination navbar-right">
									<li><a href="${pageContext.request.contextPath}/home/index/${articles.prev}?tid=${param.tid}" aria-label="前一页">
											<span aria-hidden="true">&laquo;</span>
									</a></li>
									<c:forEach var="i" begin="1" end="${articles.total}" step="1">
										<c:choose>
											<c:when test="${articles.index == i}">
												<li class="active"><a href="${pageContext.request.contextPath}/home/index/${i}?tid=${param.tid}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="${pageContext.request.contextPath}/home/index/${i}?tid=${param.tid}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li><a href="${pageContext.request.contextPath}/home/index/${articles.next}?tid=${param.tid}" aria-label="后一页">
											<span aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>						
						</c:otherwise>
                	</c:choose>
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
						<h4 class="title">热门文章</h4>
						<div class="content hot">
							<ul>
								<c:forEach var="article" items="${hots }">
									<li><a href="${pageContext.request.contextPath }/home/read/${article.id}?tid=${param.tid}">${article.title }</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>	

					<div class="widget">
						<h4 class="title">推荐文章</h4>
						<div class="content hot">
							<ul>
								<c:forEach var="article" items="${promotions }">
									<li><a href="${pageContext.request.contextPath }/home/read/${article.id}?tid=${param.tid}">${article.title }</a></li>
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