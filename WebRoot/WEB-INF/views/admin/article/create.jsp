<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../share/_include_meta.jsp" />

<title>播思客 | 新增博文</title>

<jsp:include page="../share/_include_css.jsp" />
<!-- Select2 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.min.css">

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
					<li><a class="currentpage" href="${pageContext.request.contextPath}/admin/article/index">文章</a></li>
					<li class="active">新增</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">新增博文</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<form action="${pageContext.request.contextPath}/admin/article/save" method="post" class="form-horizontal">
						<div class="box-body">
							<div class="row">
								<div class="col-md-9">
									<input type="text" id="title" name="title" class="form-control" placeholder="标题">								
								</div>
								<div class="col-md-3">
									<select id="topicId" name="topic.id" class="form-control select2" style="width: 100%;">
										<c:forEach var="t" items="${topics }">
											<option value="${t.id }">${t.topicName }</option>
										</c:forEach>					
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									&nbsp;
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<input type="hidden" name="user.id" value="${user.id }" />
									<input type="text" name="author" value="${user.username }" class="form-control"/>
								</div>
								<div class="col-md-3">
									<input type="text" name="promotion" placeholder="推荐指数" class="form-control"/>
								</div>
								<div class="col-md-3">
									<input type="text" name="hot" placeholder="热门指数" class="form-control"/>
								</div>
								<div class="col-md-3">
									<input type="text" name="top" placeholder="置顶" class="form-control"/>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									&nbsp;
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
			                    	<textarea id="editor1" name="content" rows="15" cols="80">
			                        	${article.content}
			                    	</textarea>
		                    	</div>
	                    	</div>
							<div class="row">
								<div class="col-md-12">
									&nbsp;
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<input type="text" name="slug" class="form-control" placeholder="slug">								
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									&nbsp;
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<input type="text" name="metaKeywords" class="form-control" placeholder="keywords">								
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									&nbsp;
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<input type="text" name="metaDescription" class="form-control" placeholder="description">								
								</div>
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">
								<span> 发表</span>
							</button>
							<a href="${pageContext.request.contextPath}/admin/article/index" class="btn btn-default">
								<span> 取消</span>
							</a>
						</div>
					</form>
				</div>
				<!-- /.box -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../share/footer.jsp" />
	</div>
	
	<jsp:include page="../share/_include_js.jsp" />
	<!-- Select2 -->
	<script src="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.full.min.js"></script>
	<!-- CK Editor -->
	<script src="${pageContext.request.contextPath}/assets/global/plugins/ckeditor/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/assets/global/plugins/tinymce/tinymce.min.js"></script>
	<script type="text/javascript">
		$(function () {
			$(".select2").select2();
			
	    	CKEDITOR.replace('editor1');
			//initMce();
		});
		
		
		function initMce() {
			tinymce.init({
		        selector: "textarea#editor1",
		        plugins: [
		            "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
		            "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
		            "table contextmenu directionality emoticons template textcolor paste fullpage textcolor"
		        ],
	
		        toolbar1: "undo redo | cut copy paste | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
		        toolbar2: " searchreplace | bullist numlist | outdent indent blockquote | link unlink anchor image media code | inserttime preview | forecolor backcolor",
		        toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",
	
		        menubar: false,
		        toolbar_items_size: 'small',
	
		        style_formats: [
		            {title: 'Bold text', inline: 'b'},
		            {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
		            {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
		            {title: 'Example 1', inline: 'span', classes: 'example1'},
		            {title: 'Example 2', inline: 'span', classes: 'example2'},
		            {title: 'Table styles'},
		            {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
		        ],
	
		        templates: [
		            {title: 'Test template 1', content: 'Test 1'},
		            {title: 'Test template 2', content: 'Test 2'}
		        ],
		        language:'zh_CN'
		    });
		}
	</script>
</body>
</html>
