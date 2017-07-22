<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="share/_include_meta.jsp" />

<title>播思客 | 管理首页</title>

<jsp:include page="share/_include_css.jsp" />

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">
		
		<jsp:include page="share/header.jsp" />
		
		<jsp:include page="share/sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					管理后台
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">欢迎</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">个人博客系统更新日志</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<ul>
							<li>版本 V0.01</li>
							<li>
								<ul>
									<li>2017.7.20 创建本项目</li>
								</ul>
							</li>
						</ul>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						
					</div>
					<!-- /.box-footer-->
				</div>
				<!-- /.box -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="share/footer.jsp" />
	</div>
	
	<jsp:include page="share/_include_js.jsp" />
</body>
</html>
