<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- start navigation -->
<nav class="main-navigation">
	<div class="container ">
		<div class="row ">
			<div class="col-sm-12">
				<div class="navbar-header ">
					<span class="nav-toggle-button collapsed" data-toggle="collapse" data-target="#main-menu">
						<span class="sr-only">Toggle navigation</span><i class="fa fa-bars"></i>
					</span>
				</div>
				<div class="collapse navbar-collapse" id="main-menu">
					<ul class="menu">
						<c:forEach var="t" items="${topics}">
							<c:choose>
								<c:when test="${param.tid == null && t.id == 0 || param.tid != null && param.tid == t.id }">
									<li class="nav-current" role="presentation ">
										<a href="${pageContext.request.contextPath}/home/index/1?tid=${t.id}">${t.topicName}</a>
									</li>					
								</c:when>
								<c:otherwise>
									<li role="presentation">
										<a href="${pageContext.request.contextPath}/home/index/1?tid=${t.id}">${t.topicName}</a>
									</li>					
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</nav>
<!-- end navigation -->

