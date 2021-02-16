<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style type="text/css">
	.padding-50 {
	    padding: 50px;
	}
</style>
<body class="page-md page-header-fixed page-sidebar-closed-hide-logo ">

<!-- BEGIN CONTAINER -->
	<div class="page-container">
	
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<!-- BEGIN PAGE HEADER-->
				<!-- BEGIN PAGE HEAD -->
				<div class="page-head">
					<!-- BEGIN PAGE TITLE -->
					<div class="page-title">
						<h1>Facebook Page Configuration</h1>
					</div>
					<!-- END PAGE TITLE -->
					<!-- BEGIN PAGE TOOLBAR -->

					<!-- END PAGE TOOLBAR -->
				</div>
				<!-- END PAGE HEAD -->
				<!-- BEGIN PAGE BREADCRUMB -->
				<ul class="page-breadcrumb breadcrumb">
					<li>
						<a href="/">Home</a>
						<i class="fa fa-circle"></i>
					</li>
					<li>
						Configuration
						<i class="fa fa-circle"></i>
					</li>
					<li>
						Facebook Page Configuration Setup
					</li>
				</ul>
				<!-- END PAGE BREADCRUMB -->
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="portlet box green-meadow">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-facebook"></i> Connect With Facebook
						</div>
					</div>
					<div id="step_1_body" class="portlet-body">
						<div class="row" style="padding-bottom: 20px;">
		                	<div class="col-md-12 text-center">
		                		<div class="form-group" style="padding-top:30px;">
									<label class="checkbox-inline"><input class="form-control permission-checkbox" type="checkbox" name="permission" value="feed"> Post, Comment And Reply</label>
									<label class="checkbox-inline"><input id="message_permission" class="form-control permission-checkbox" type="checkbox" name="permission" value="messages"> Message And Chat</label>
									<label class="checkbox-inline"><input id="mention_permission" class="form-control permission-checkbox" type="checkbox" name="permission" value="mention"> Page Mention</label>
									<label class="checkbox-inline"><input id="lead_gen_permission" class="form-control permission-checkbox" type="checkbox" name="permission" value="leadgen"> Lead Generation</label>
								</div>
		                	</div>
				        </div>
	                	<div class="row" id="fb_button" style="display: none">
	                		<div class="col-md-12 text-center">
	                			<div class="padding-50">
		                			<img src="/static/images/login_with_facebook.png" onclick="FacebookLogin()" style="width: 350px;cursor: pointer;"/>
	                			</div>
	                		</div>
	                	</div>
			        </div>
			    </div>
			    <div class="portlet box green-meadow">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-facebook"></i> Select Page For Configure
						</div>
					</div>
					<div id="step_2_body" class="portlet-body" style="display: none;">
	                	<div class="row" style="padding-top: 50px;">
	                		<div class="col-md-4"></div>
	                		<div class="col-md-4">
	                			<div class="form-group">
									<label class="control-label">Select Facebook Page</label>
									<select class="form-control select2me" data-placeholder="Select..." name="facebook_page_id" id="facebook_page_id">
										<option></option>
									</select>
		                		</div>
		                	</div>
		                	<div class="col-md-4"></div>
		                </div>
<!-- 		                <div class="row" style="padding-bottom: 20px;"> -->
<!-- 		                	<div id="permission_box" class="col-md-12 text-center" style="display: none"> -->
<!-- 		                		<div class="form-group" style="padding-top:30px;"> -->
<!-- 									<label class="checkbox-inline"><input class="form-control permission-checkbox" type="checkbox" name="permission" value="feed"> Feed & Post</label> -->
<!-- 									<label class="checkbox-inline"><input class="form-control permission-checkbox" type="checkbox" name="permission" value="conversations,messages"> Message & Chat</label> -->
<!-- 									<label class="checkbox-inline"><input class="form-control permission-checkbox" type="checkbox" name="permission" value="mention"> Page Mention</label> -->
<!-- 									<label class="checkbox-inline"><input class="form-control permission-checkbox" type="checkbox" name="permission" value="leadgen"> Lead Generation</label> -->
<!-- 								</div> -->
<!-- 		                	</div> -->
<!-- 				        </div> -->
				        <div class="row" id="sync_button" style="display: none">
				        	<div class="col-md-12 text-right">
				        		<button class="btn blue" onclick="enableWebhookAndSave()">Enable Page Data Sync With Kapture</button>
				        	</div>
				        </div>
				    </div>
			    </div>
			    <div class="portlet box green-meadow">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-facebook"></i> Status And Confirmation
						</div>
					</div>
					<div id="step_3_body" class="portlet-body" style="display: none;">
	                	<div class="row" style="padding-top: 50px;">
	                		<div class="col-md-3"></div>
	                		<div class="col-md-6">
	                			<div id="fb_page_success_status" class="row" style="display: none;">
			                		<div class="col-md-12 text-center">
									    <div class="" style="margin-bottom: 20px;">
									        <img src="/static/crm/img/green_success.png" style="width: 70px;">
									    </div>
			                			<div class="" style="font-size: 18px;">Facebook Page configured successfully.</div>
			                			<small>For more details setup check at Configuration->Partner Configuration->Facebook Setup</small>
			                		</div>
			                	</div>
		                	</div>
		                	<div class="col-md-3"></div>
		                </div>
		                <div class="row" style="padding-bottom: 50px;">
	                		<div class="col-md-3"></div>
	                		<div class="col-md-6">
			                	<div id="fb_page_fail_status" class="row" style="display: none;">
			                		<div class="col-md-12 text-center">
									    <div class="" style="margin-bottom: 20px;">
									        <img src="/static/crm/img/error_icon.png" style="width: 70px;">
									    </div>
			                			<div class="" style="font-size: 18px;">Oops!!! Facebook Page configuration Failed.</div>
			                			<small>Please try again with valid page login access.</small>
			                		</div>
			                	</div>
		                	</div>
		                	<div class="col-md-3"></div>
		                </div>
				    </div>
			    </div>
				<!-- END PAGE CONTENT-->
			</div>
		</div>
		<form id="fb-saved-data">
			<input type="hidden" id="page_id_frm" name="page_id" value=""/>
			<input type="hidden" id="page_name_frm" name="page_name" value=""/>
			<input type="hidden" id="access_token_frm" name="access_token" value=""/>
		</form>
		<div id="access_token_data">
		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->
	
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
crossorigin="anonymous"></script>
</html>
