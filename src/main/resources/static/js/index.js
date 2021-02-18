$(document).ready(function () {
	$("#facebook_page_id").change(function () {
		var selectedVal = $(this).val();
		if (selectedVal != "") {
			$("#sync_button").show();
		} else {
			$("#sync_button").hide();
		}
		// $("#page_id_frm").val(selectedVal);
		// var accessToken = $("#" + selectedVal).val();
		// var pageName = $("#" + selectedVal).attr("data-page-name");
		// console.log(pageName);
		// $("#access_token_frm").val(accessToken);
		// $("#page_name_frm").val(pageName);
	});

	$(".permission-checkbox").change(function () {
		$("#fb_button").hide();
		$(".permission-checkbox").each(function () {
			if ($(this).is(":checked")) {
				$("#fb_button").show();
			}
		});
	});
});


function step2() {
	console.log("In step 2");
	alert("Login success");
	$("#step_1_body").slideUp();
	$("#step_2_body").show();
	var subscription = "[";
    if($("#lead_gen_permission").is(":checked")){
      subscription = subscription + "'leadgen',";
    }
    if($("#message_permission").is(":checked")){
      subscription = subscription + "'messages',";
    }
    if($("#mention_permission").is(":checked")){
      subscription = subscription + "'mention',";
    }
    subscription = subscription + "'feed']";
	console.log(subscription);
	//TODO call FB server
	var optionHtml = "<option></option>";
		var id = 0; var pageName = "Demo1";
	optionHtml += "<option value=\"" + id + "\">" + pageName + "</option>";
	var id = 1; var pageName = "Demo2";
	optionHtml += "<option value=\"" + id + "\">" + pageName + "</option>";
	$("#facebook_page_id").html(optionHtml);

}

function step3() {
	console.log("Selected Page : "+$("#facebook_page_id :selected").text()+" "+ $("#facebook_page_id :selected").val());
	alert("Syncing page with KaptureCRM")
	console.log("In step 3");
	$("#step_2_body").slideUp();
	$("#step_3_body").show();
	sendDataToServer();
	var msgAjax = "success";
	//msgAjax="failed";
	if (msgAjax == "success") {
		$("#fb_page_success_status").show();
	} else {
		$("#fb_page_fail_status").show();
	}
}
function sendDataToServer() {
	var fbFromData = $("#fb-saved-data").serialize();
	console.log(fbFromData);
	$.ajax({
		url: "http://localhost:8080/save-facebook-page-configuration",
		type: 'POST',
		data: fbFromData,
		success: function (msgAjax) {
			//var msgAjax="success";
			console.log(msgAjax);
			$("#step_2_body").hide();
			$("#step_3_body").show();
			if (msgAjax == "success") {
				$("#fb_page_success_status").show();
			} else {
				$("#fb_page_fail_status").show();
			}
			//crm_loader_hide();
		},
		error: function () {
			//crm_loader_hide();
		}
	});
}
