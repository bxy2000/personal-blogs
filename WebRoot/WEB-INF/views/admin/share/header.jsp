<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="main-header">
	<!-- Logo -->
	<a href="${pageContext.request.contextPath }" class="logo">
		<!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>Bosic</b></span>
		<!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>播思客</b></span>
	</a>
	
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img src="${pageContext.request.contextPath}/assets/img/t1.jpg" class="user-image" alt="User Image">
						<span class="hidden-xs">你好，管理员</span>
					</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header">
							<img src="${pageContext.request.contextPath}/assets/img/t1.jpg" class="img-circle" alt="User Image">
							<p>
								白向阳 - 系统管理员 <small>2015年8月加入</small>
							</p>
						</li>
						<!-- Menu Body -->
						<li class="user-body">
							<div class="row">
								<div class="col-xs-4 text-center">
									<a href="#">信息1</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">信息2</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">信息3</a>
								</div>
							</div> <!-- /.row -->
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">用户信息</a>
							</div>
							<div class="pull-right">
								<a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-default btn-flat">退出</a>
							</div>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</header>
