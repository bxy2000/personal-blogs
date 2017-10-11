<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../share/_include_meta.jsp" />

<title>播思客 | 博主管理</title>

<jsp:include page="../share/_include_css.jsp" />

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">
		
		<jsp:include page="../share/header.jsp" />
		
		<jsp:include page="../share/sidebar.jsp" />

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					博主管理 
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a class="currentpage" href="${pageContext.request.contextPath}/admin/user/index">博主列表</a></li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<a href="${pageContext.request.contextPath}/admin/user/create" class="btn btn-sm btn-success">
							<span class="fa fa-plus" aria-hidden="true"> 新增</span>
						</a>
						<button id="btnDelete" class="btn btn-sm btn-danger">
							<span class="fa fa-remove" aria-hidden="true"> 删除</span>
						</button>						
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
						<form id="frmUser" action="" method="post">
							<table class="table table-bordered table-hover">
								<tr>
									<th>
										<input type="checkbox" onclick="selectAll(this.checked)" />
									</th>
									<th>ID</th>
									<th>登录id</th>
									<th>姓名</th>
									<th>性别</th>
									<th>出生日期</th>
									<th>联系方式</th>
									<th>邮箱</th>
									<th>地址</th>
									<th>城市</th>
									<th>省份</th>
									<th style="width:160px;">操作</th>
								</tr>
								
								<c:forEach var="user" items="${users.rows }">
									<tr>
										<td>
											<input type="checkbox" name="ids" value="${user.id}" />
										</td>
										<td>${user.id }</td>
										<td>${user.username }</td>
										<td>${user.realname }</td>
										<td>${user.gender }</td>
										<td>${user.birthday }</td>
										<td>${user.mobile }</td>
										<td>${user.email }</td>
										<td>${user.address}</td>
										<td>${user.city}</td>
										<td>${user.province}</td>
										<td>
											<a href="${pageContext.request.contextPath}/admin/user/edit/${user.id}" class="btn btn-xs btn-info">
												<span class="fa fa-edit" aria-hidden="true"> 编辑</span>
											</a>
											<button type="button" class="btn btn-xs btn-warning" onclick="confirmDelete('${pageContext.request.contextPath}/admin/user/delete/${user.id}')">
												<span class="fa fa-remove" aria-hidden="true"> 删除</span>
											</button>
										</td>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
							<span class="page-number">第 ${users.index }页 &frasl; 共 ${users.total}页</span>
			              	<ul class="pagination pagination-sm no-margin pull-right">
			                	<li>
			                		<a href="${pageContext.request.contextPath}/admin/user/index/${users.prev}">&laquo;</a>
			                	</li>
			                	<c:forEach var="i" begin="1" end="${users.total}" step="1">
			                		<c:choose>
				                		<c:when test="${users.index == i }">
				                			<li class="active">
				                				<a href="${pageContext.request.contextPath}/admin/user/index/${i}">${i }</a>
				                			</li>
				                		</c:when>
				                		<c:otherwise>
				                			<li>
				                				<a href="${pageContext.request.contextPath}/admin/user/index/${i}">${i }</a>
				                			</li>
				                		</c:otherwise>
			                		</c:choose>
			                	</c:forEach>
			                	<li>
			                		<a href="${pageContext.request.contextPath}/admin/user/index/${users.next}">&raquo;</a>
			                	</li>
			        		</ul>
					</div>
				</div>
			</section>
		</div>

		<jsp:include page="../share/footer.jsp" />
	</div>
	
	<jsp:include page="../share/_include_js.jsp" />
	
	<script type="text/javascript">
		$(function(){
			$('#btnDelete').click(function(){
				if(confirm('确认删除吗？')){
					$('#frmUser').prop('action', '${pageContext.request.contextPath}/admin/user/delete');
					$('#frmUser').submit();
				}
			});
		});
	
		function selectAll(checked){
			$(':checkbox').each(function(){
				$(this).prop("checked", checked);
			});
		}

		function confirmDelete(url){
			if(confirm('确认删除吗？')){
				window.location.href = url;
			}
		}
	</script>
</body>
</html>
