window.fbAsyncInit = function() {
  FB.init({
    appId      : '<%=Resource.getValue("FACEBOOK_TICKET_APP_ID")%>',
    cookie     : true,
    xfbml      : true,
    version    : 'v6.0'
  });

  FB.AppEvents.logPageView();
  checkLoginState();
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "https://connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));


function checkLoginState() {
  FB.getLoginStatus(function(response) {
      if (response.status === 'connected') {
        // The user is logged in and has authenticated your
        // app, and response.authResponse supplies
        // the user's ID, a valid access token, a signed
        // request, and the time the access token
        // and signed request each expire.
        var uid = response.authResponse.userID;
        var accessToken = response.authResponse.accessToken;
         console.log('Welcome!  Fetching your information.... ');
         FB.api('/me', function(response) {
           console.log('Good to see you, ' + response.name + '.');
         });
      } else if (response.status === 'authorization_expired') {
        // The user has signed into your application with
        // Facebook Login but must go through the login flow
        // again to renew data authorization. You might remind
        // the user they've used Facebook, or hide other options
        // to avoid duplicate account creation, but you should
        // collect a user gesture (e.g. click/touch) to launch the
        // login dialog so popup blocking is not triggered.
        crm_loader_hide();
      } else if (response.status === 'not_authorized') {
        // The user hasn't authorized your application.  They
        // must click the Login button, or you must call FB.login
        // in response to a user gesture, to launch a login dialog.
        crm_loader_hide();
      } else {
        // The user isn't logged in to Facebook. You can launch a
        // login dialog with a user gesture, but the user may have
        // to log in to Facebook before authorizing your application.
        crm_loader_hide();
      }
   });
}

function FacebookLogin(){
  crm_loader_show();
  var permissionLead = "";
  var permissionChat = "";
  if($("#lead_gen_permission").is(":checked")){
    permissionLead = ",leads_retrieval";
  }
  if($("#message_permission").is(":checked")){
    permissionChat = ",pages_messaging";
  }

  FB.login(function(response) {
    if (response.authResponse) {
      var accessToken = response.authResponse.accessToken;
      exchangeShortLivedToken(accessToken);
      console.log('Welcome!  Fetching your information.... ');
      FB.api('/me', function(response) {
        console.log('Good to see you, ' + response.name + '.');
      });
      crm_loader_hide();
    } else {
      crm_loader_hide();
      console.log('User cancelled login or did not fully authorize.');
    }
},{scope: 'manage_pages,pages_show_list,publish_pages'+permissionChat+permissionLead});
}

function exchangeShortLivedToken(accessToken){
  if(accessToken != ""){
    crm_loader_show();
    $.ajax({
      url : "get-long-lived-fb-access-token",
      type : 'post',
      data : "access_token=" + accessToken,
      success : function(msgAjax) {
        statusChangeCallback(msgAjax)
        crm_loader_hide();
      },
      error : function() {
        crm_loader_hide();
      }
    });
  }
}

function statusChangeCallback(extentedAccessToken){
  console.log(extentedAccessToken);
  crm_loader_show();
  FB.api(
  '/me/accounts',
  'GET',
  {"fields":"name,is_webhooks_subscribed,is_published,is_owned,access_token","access_token":extentedAccessToken},
  function(response1) {
    crm_loader_hide();
    $("#step_1_body").slideUp();
    $("#step_2_body").show();
    console.log(response1);
    var optionHtml = "<option></option>";
    var pageDataArry = response1.data;
    if(pageDataArry.length > 0){
      for(var index=0; index < pageDataArry.length; index++){
        var pageObj = pageDataArry[index];
        var id = pageObj.id;
        var pageName = pageObj.name;
        var accessToken = pageObj.access_token;
        optionHtml +="<option value=\""+id+"\">"+pageName+"</option>";
        $("#access_token_data").append("<input type=\"hidden\" id=\""+id+"\" data-page-name=\""+pageName+"\" value=\""+accessToken+"\"/>");
      }
    }
    $("#facebook_page_id").html(optionHtml);
    selectBoxInit("#facebook_page_id");
  });
}

function exchangeAccessToken(accessToken){

}

$(document).ready(function(){
  $("#facebook_page_id").change(function(){
    var selectedVal = $(this).val();
    if(selectedVal!=""){
      $("#sync_button").show();
    }else{
      $("#sync_button").hide();
    }
    $("#page_id_frm").val(selectedVal);
    var accessToken = $("#"+selectedVal).val();
    var pageName = $("#"+selectedVal).attr("data-page-name");
    $("#access_token_frm").val(accessToken);
    $("#page_name_frm").val(pageName);
  });

  $(".permission-checkbox").change(function(){
    $("#fb_button").hide();
    $(".permission-checkbox").each(function(){
      if($(this).is(":checked")){
        $("#fb_button").show();
      }
    });
  });
});

function enableWebhookAndSave(){
  var pageId = $("#page_id_frm").val();
  var accessToken = $("#access_token_frm").val();
  if(accessToken != "" && pageId != ""){
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
    crm_loader_show();
    $.ajax({
      url : "https://graph.facebook.com/v6.0/"+pageId+"/subscribed_apps?access_token="+accessToken,
      type : 'POST',
      data : "access_token=" + accessToken+"&subscribed_fields="+subscription,
      success : function(msgAjax) {
        console.log(msgAjax);
        if(msgAjax.success){
          sendDataToServer();
        }
        crm_loader_hide();
      },
      error : function() {
        crm_loader_hide();
      }
    });
  }
}


