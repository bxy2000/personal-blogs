<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>播思客 | 系统登录</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/global/plugins/ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/global/plugins/admin-lte/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/global/plugins/iCheck/square/blue.css">

</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="${pageContext.request.contextPath}"><b>播思客</b> | 技术博文</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">系统登录 <span style="color:red;">${error}</span></p>

			<form action="${pageContext.request.contextPath}/admin/validate" method="post">
				<div class="form-group has-feedback">
					<input type="text" name="username" value="${username}" class="form-control" placeholder="用户名" required="required">
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="password" class="form-control" placeholder="密码" required="required">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label>	<input type="checkbox"> 记住我
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="${pageContext.request.contextPath}/assets/global/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>
