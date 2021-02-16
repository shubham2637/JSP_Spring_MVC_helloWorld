<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starting with JSP</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<body>
  <h1 style="text-align: center;">Connect With Facebook</h1>
    <div style="width: 70%; padding: 10%;margin:2px auto;" class="container">
   <form action="/postOptions"  method="post" class="form-control">
    <div class="form-check">
        <br>
        <input class="form-check-input permission-checkbox" type="checkbox" name="permission" value="feed">
        <label class="form-check-label pull-right" >
            <b>Post, Comment And Reply</b>
        </label>
      </div>
      <br>
      <div class="form-check">
        <input class="form-check-input permission-checkbox" type="checkbox" value="messages">
        <label class="form-check-label pull-right" >
            <b>Message And Chat</b>
        </label>
      </div>
      <br>
      <div class="form-check">
        <input class="form-check-input permission-checkbox" type="checkbox" value="mention">
        <label class="form-check-label pull-right" >
            <b>Page Mention</b>
        </label>
      </div>
      <br>
         </div>


             <div class="row" id="fb_button" style="display:none">
               <div class="col-md-12 text-center">
                 <div class="padding-50">
                   <img src="static/images/login_with_facebook.png" onclick="FacebookLogin()" style="width: 350px;cursor: pointer;"/>
                 </div>
               </div>
             </div>
       </div>
   </div>

   </form>
   <%
String s[] = request.getParameterValues("facebook_checkbox");
if (s != null && s.length != 0) {
out.println("You have selected the option s: ");
for (int i = 0; i < s.length; i++) {
out.println(s[i] + "\n" + " Thank you");
}
}
%>
    </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
            <script type="text/javascript">
                function FacebookLogin(){
                  //crm_loader_show();
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
                    //  FB.api('/me', function(response) {
                      //  console.log('Good to see you, ' + response.name + '.');
                      //});
                      //crm_loader_hide();
                    } else {
                      //crm_loader_hide();
                      console.log('User cancelled login or did not fully authorize.');
                    }
                },{scope: 'manage_pages,pages_show_list,publish_pages'+permissionChat+permissionLead});
                }

                </script>
                <script>


                (function(d, s, id){
                   var js, fjs = d.getElementsByTagName(s)[0];
                   if (d.getElementById(id)) {return;}
                   js = d.createElement(s); js.id = id;
                   js.src = "https://connect.facebook.net/en_US/sdk.js";
                   fjs.parentNode.insertBefore(js, fjs);
                 }(document, 'script', 'facebook-jssdk'));
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

                </script>

</body>

</html>
