<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../share/_include_meta.jsp" />

<title>播思客 | 博文管理</title>

<jsp:include page="../share/_include_css.jsp" />

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">
		
		<jsp:include page="../share/header.jsp" />
		
		<jsp:include page="../share/sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					博文管理 
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/article/index">文章列表</a></li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<a href="${pageContext.request.contextPath}/admin/article/create" class="btn btn-sm btn-success">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"> 新增</span>
						</a>
						<button id="btnDelete" class="btn btn-sm btn-danger">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"> 删除</span>
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
						<form id="frmArticle" action="${pageContext.request.contextPath}/admin/article/delete" method="post">
							<table class="table table-bordered table-hover">
								<tr>
									<th>
										<input type="checkbox" onclick="selectAll(this.checked)" />
									</th>
									<th>ID</th>
									<th>标题</th>
									<th>作者</th>
									<th>发表时间</th>
									<th style="width:160px;">操作</th>
								</tr>
								
								<c:forEach var="article" items="${articles.rows }">
									<tr>
										<td>
											<input type="checkbox" name="ids" value="${article.id}" />
										</td>
										<td>${article.id }</td>
										<td>${article.title }</td>
										<td>${article.author }</td>
										<td>${article.createDate }</td>
										<td>
											<a href="${pageContext.request.contextPath}/admin/article/edit/${article.id}" class="btn btn-xs btn-info">
												<span class="glyphicon glyphicon-edit" aria-hidden="true"> 编辑</span>
											</a>
											<button type="button" class="btn btn-xs btn-warning" onclick="confirmDelete('${pageContext.request.contextPath}/admin/article/delete/${article.id}')">
												<span class="glyphicon glyphicon-minus" aria-hidden="true"> 删除</span>
											</button>
										</td>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
							<span class="page-number">第 ${articles.index }页 &frasl; 共 ${articles.total}页</span>
			              	<ul class="pagination pagination-sm no-margin pull-right">
			                	<li>
			                		<a href="${pageContext.request.contextPath}/admin/article/index/${articles.prev}">&laquo;</a>
			                	</li>
			                	<c:forEach var="i" begin="1" end="${articles.total}" step="1">
			                		<c:choose>
				                		<c:when test="${articles.index == i }">
				                			<li class="active">
				                				<a href="${pageContext.request.contextPath}/admin/article/index/${i}">${i }</a>
				                			</li>
				                		</c:when>
				                		<c:otherwise>
				                			<li>
				                				<a href="${pageContext.request.contextPath}/admin/article/index/${i}">${i }</a>
				                			</li>
				                		</c:otherwise>
			                		</c:choose>
			                	</c:forEach>
			                	<li>
			                		<a href="${pageContext.request.contextPath}/admin/article/index/${articles.next}">&raquo;</a>
			                	</li>
			        		</ul>
					</div>
					<!-- /.box-footer-->
				</div>
				<!-- /.box -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../share/footer.jsp" />
	</div>
	
	<jsp:include page="../share/_include_js.jsp" />
	
	<script type="text/javascript">
		$(function(){
			$('#btnDelete').click(function(){
				if(confirm('确认删除吗？')){
					$('#frmArticle').submit();
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
