function setupLogin(){
	$("#login").click(function(){
	    if(checkValidation("formRegisterUser")){
	      $("#formRegisterUser").attr("action","login");
	      $("#formRegisterUser").submit();
	    }else{
	      return false;
	    }
  	});
  	$("#cadastrar").click(function(){
	    if(checkValidation("formRegisterUser")){
	      $("#formRegisterUser").attr("action","/admin/register");
	      $("#formRegisterUser").submit();
	    }else{
	      return false;
	    }
  	});
}
