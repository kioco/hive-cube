<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="zh">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Resource - Hive Cube</title>
<jsp:include page="../public/css.jsp"></jsp:include>
</head>
<style type="text/css">
.node circle {
	cursor: pointer;
	fill: #fff;
	stroke: steelblue;
	stroke-width: 1.5px;
}

.node text {
	font-size: 14px;
}

path.link {
	fill: none;
	stroke: #ccc;
	stroke-width: 1.5px;
}
</style>
<body>
	<jsp:include page="../public/navbar.jsp"></jsp:include>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						Resource Manager <small>overview</small>
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">×</button>
						<i class="fa fa-info-circle"></i> <strong>Display system
							resource module, you can add and delete it.</strong>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<button type="button" id="config-home-btn"
								class="btn btn-sm btn-success">
								<span class="fa fa-edit fa-fw"></span> Add Parent
							</button>
							<button type="button" id="config-children-btn"
								class="btn btn-sm btn-primary">
								<span class="fa fa-sitemap fa-fw"></span> Add Children
							</button>
							<button type="button" id="config-delete-btn"
								class="btn btn-sm btn-danger">
								<span class="fa fa-trash-o fa-fw"></span> Delete
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-tasks fa-fw"></i> Menu Graph
							<div class="pull-right"></div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="hc_graph_home"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
			<!-- home -->
			<div class="modal fade" aria-labelledby="hcModalLabel"
				aria-hidden="true" id="hc_home_dialog" tabindex="-1" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal">×</button>
							<h4 class="modal-title" id="hcModalLabel">
								Parent
							</h4>
						</div>
						<!-- /.row -->
						<form role="form" action="/hc/system/resource/add/home/"
							method="post" onsubmit="return contextFormValid();return false;">
							<div class="modal-body">
								<fieldset class="form-horizontal">
									<div class="form-group">
										<label for="path" class="col-sm-2 control-label">Name</label>
										<div class="col-sm-10">
											<input id="hc_resource_home_name"
												name="hc_resource_home_name" type="text"
												class="form-control" placeholder="Resource Manager">
										</div>
									</div>
									<div class="form-group">
										<label for="path" class="col-sm-2 control-label">URL</label>
										<div class="col-sm-10">
											<input id="hc_resource_home_url" name="hc_resource_home_url"
												type="text" class="form-control"
												placeholder="/system/resource">
										</div>
									</div>
									<div id="alert_mssage" style="display: none"
										class="alert alert-danger">
										<label> Oops! Please make some changes .</label>
									</div>
								</fieldset>
							</div>
							<div id="remove_div" class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancle</button>
								<button type="submit" class="btn btn-primary" id="create-btn">Sure
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- children -->
			<div class="modal fade" aria-labelledby="hcModalLabelChild"
				aria-hidden="true" id="hc_child_dialog" tabindex="-1" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal">×</button>
							<h4 class="modal-title" id="hcModalLabelChild">Children Menu
							</h4>
						</div>
						<!-- /.row -->
						<form role="form" action="/hc/system/resource/add/children/"
							method="post"
							onsubmit="return contextChildFormValid();return false;">
							<div class="modal-body">
								<fieldset class="form-horizontal">
									<div class="form-group">
										<label for="path" class="col-sm-2 control-label">Parent
											Menu</label>
										<div class="col-sm-10">
											<select id="res_parent_id" name="res_parent_id"
												class="form-control">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="path" class="col-sm-2 control-label">Name</label>
										<div class="col-sm-10">
											<input id="hc_resource_child_name"
												name="hc_resource_child_name" type="text"
												class="form-control" placeholder="Start">
										</div>
									</div>
									<div class="form-group">
										<label for="path" class="col-sm-2 control-label">URL</label>
										<div class="col-sm-10">
											<input id="hc_resource_child_url"
												name="hc_resource_child_url" type="text"
												class="form-control" placeholder="/system/resource/add">
										</div>
									</div>
									<div id="alert_mssage_child" style="display: none"
										class="alert alert-danger">
										<label> Oops! Please make some changes .</label>
									</div>
								</fieldset>
							</div>
							<div id="remove_div" class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancle</button>
								<button type="submit" class="btn btn-primary" id="create-btn">Sure
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- delete -->
			<div class="modal fade" aria-labelledby="hcModalLabelDelete"
				aria-hidden="true" id="hc_delete_dialog" tabindex="-1" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal">×</button>
							<h4 class="modal-title" id="hcModalLabelDelete">Delete</h4>
						</div>
						<!-- /.row -->
						<form role="form"
							action="/hc/system/resource/delete/parent/or/children/"
							method="post"
							onsubmit="return contextDeleteFormValid();return false;">
							<div class="modal-body">
								<fieldset class="form-horizontal">
									<div class="form-group">
										<label for="path" class="col-sm-2 control-label">Parent
											Menu</label>
										<div class="col-sm-10">
											<select id="res_child_root_id" name="res_child_root_id"
												class="form-control">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="path" class="col-sm-2 control-label">Children
											Menu</label>
										<div class="col-sm-10">
											<select id="res_child_id" name="res_child_id"
												class="form-control">
											</select>
										</div>
									</div>
									<div id="alert_mssage_delete" style="display: none"
										class="alert alert-danger">
										<label> Oops! Please make some changes .</label>
									</div>
								</fieldset>
							</div>
							<div id="remove_div" class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancle</button>
								<button type="submit" class="btn btn-danger" id="create-btn">Delete
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
</body>
<jsp:include page="../public/script.jsp">
	<jsp:param value="plugins/d3/d3.js" name="loader" />
	<jsp:param value="plugins/d3/d3.layout.js" name="loader" />
	<jsp:param value="main/system/resource.js" name="loader" />
</jsp:include>
<script type="text/javascript">
	function contextFormValid() {
		var hc_resource_home_name = $("#hc_resource_home_name").val();
		var hc_resource_home_url = $("#hc_resource_home_url").val();
		var reg = /^[\u4e00-\u9fa5]+$/;
		if (hc_resource_home_url.length == 0 || hc_resource_home_name.length == 0 || reg.test(hc_resource_home_url)) {
			$("#alert_mssage").show();
			setTimeout(function() {
				$("#alert_mssage").hide()
			}, 3000);
			return false;
		}

		return true;
	}

	function contextChildFormValid() {
		var hc_resource_child_name = $("#hc_resource_child_name").val();
		var hc_resource_child_url = $("#hc_resource_child_url").val();
		var reg = /^[\u4e00-\u9fa5]+$/;
		if (hc_resource_child_url.length == 0 || hc_resource_child_name.length == 0 || reg.test(hc_resource_child_url)) {
			$("#alert_mssage_child").show();
			setTimeout(function() {
				$("#alert_mssage_child").hide()
			}, 3000);
			return false;
		}

		return true;
	}
</script>
</html>
