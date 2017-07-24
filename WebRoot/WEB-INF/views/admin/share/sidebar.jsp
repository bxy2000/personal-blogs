<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="treeview">
				<a href="#">
					<i class="fa fa-dashboard"></i> 
					<span>功能导航</span>
				</a>
			</li>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-file-text-o"></i> <span>文章</span> 
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li><a href="${pageContext.request.contextPath}/admin/article/index"><i class="fa fa-circle-o"></i> 文章</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/user/index"><i class="fa fa-circle-o"></i> 博主</a></li>
				</ul>
			</li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
