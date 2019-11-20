
function ktDiaChiGiaoHang(trangThaiDangNhap){
	var hople = true;
	$(".error").empty();
	
	//Nếu chọn: Địa chỉ tài khoản đã đăng ký => kiểm tra đăng nhập
	if( document.getElementById("loaitk_dangky").checked == true && trangThaiDangNhap == "chuaDN"){
		hople = false;
		alert('Bạn chọn "địa chỉ tài khoản đăng ký" nhưng chưa đăng nhập, mời đăng nhập !');
		return hople;
	}
	
	//Nếu chọn: Chỉnh sửa địa chỉ đã đăng ký, mà không đăng nhập 
	if( document.getElementById("loaitk_chinhsua").checked == true && trangThaiDangNhap == "chuaDN"){
		hople = false;
		alert('Bạn chọn "chỉnh sửa tài khoản đăng ký" nhưng chưa đăng nhập, mời đăng nhập !');
		return hople;
	}
	//Nếu chọn: Chỉnh sửa địa chỉ đã đăng ký, và đã đăng nhập => kiểm tra các thẻ input
	if( document.getElementById("loaitk_chinhsua").checked == true &&  trangThaiDangNhap == "DaDN" ){
	 	//Họ tên từ 2 đến 25 ký tự
	 	var hoten = document.getElementById("hoten").value;
	 	if( hoten.length < 2 || hoten.length > 25)
	 	{
	 		document.getElementById("errorHoten").innerHTML="Tên phải từ 2 đến 25 ký tự !";
	 		document.getElementById("hoten").focus();
	 		hople= false;
	 	}
	
	 	//Email phải đúng định dạng
	 	var email=document.getElementById("email").value;
	 	var reg_mail=/^[a-zA-Z0-9]+([_\.\-]?[A-Za-z0-9])*@[a-zA-Z0-9]+([_\.\-]?[A-Za-z0-9])*(\.[A-Za-z]+)+$/;
	 	if(reg_mail.test(email) == false)
	 	{		
	 		document.getElementById("errorEmail").innerHTML="Địa chỉ email không hợp lệ !";
	 		if( hople ){
	 			document.getElementById("email").focus();
	 		}
	 		hople = false;
	 	}
		
	 	//Số dt phải là dữ liệu kiểu số, không được để trống	
	 	var dt = document.getElementById("dienthoai").value;
	 	if(isNaN(dt) == true || dt.length != 10 )
	 	{
	 		document.getElementById("errorDienthoai").innerHTML="Điện thoại phải là kiểu số (10 số) !";
	 		if( hople ){
	 			document.getElementById("dienthoai").focus();
	 		}
	 		hople = false;
	 	}
		
	 	//Địa chỉ không được để trống, tối đa 200 ký tự
	 	var dc=document.getElementById("diachi").value;
	 	if(dc == "" || dc.length > 200)
	 	{
	 		document.getElementById("errorDiachi").innerHTML = "Địa chỉ không được rỗng, tối đa 200 ký tự !";
	 		if ( hople ){
	 			document.getElementById("diachi").focus();
	 		}
	 		hople = false;
	 	}
	 	
		return hople;
	 }
	 
	
	//Nếu chọn: Giao hàng địa chỉ khác => kiểm tra các thẻ input
	if( document.getElementById("loaitk_nguoikhac").checked == true ){
	 	//Họ tên từ 2 đến 25 ký tự
	 	var hoten = document.getElementById("hoten2").value;
	 	if( hoten.length < 2 || hoten.length > 25)
	 	{
	 		document.getElementById("errorHoten2").innerHTML="Tên phải từ 2 đến 25 ký tự !";
	 		document.getElementById("hoten2").focus();
	 		hople= false;
	 	}
	
	 	//Email phải đúng định dạng
	 	var email=document.getElementById("email2").value;
	 	var reg_mail=/^[a-zA-Z0-9]+([_\.\-]?[A-Za-z0-9])*@[a-zA-Z0-9]+([_\.\-]?[A-Za-z0-9])*(\.[A-Za-z]+)+$/;
	 	if(reg_mail.test(email) == false)
	 	{		
	 		document.getElementById("errorEmail2").innerHTML="Địa chỉ email không hợp lệ !";
	 		if( hople ){
	 			document.getElementById("email2").focus();
	 		}
	 		hople = false;
	 	}
		
	 	//Số dt phải là dữ liệu kiểu số, không được để trống	
	 	var dt = document.getElementById("dienthoai2").value;
	 	if(isNaN(dt) == true || dt.length != 10 )
	 	{
	 		document.getElementById("errorDienthoai2").innerHTML="Điện thoại phải là kiểu số (10 số) !";
	 		if( hople ){
	 			document.getElementById("dienthoai2").focus();
	 		}
	 		hople = false;
	 	}
		
	 	//Địa chỉ không được để trống, tối đa 200 ký tự
	 	var dc=document.getElementById("diachi2").value;
	 	if(dc == "" || dc.length > 200)
	 	{
	 		document.getElementById("errorDiachi2").innerHTML = "Địa chỉ không được rỗng, tối đa 200 ký tự !";
	 		if ( hople ){
	 			document.getElementById("diachi2").focus();
	 		}
	 		hople = false;
	 	}
	 	
		return hople;
	 }
	
}	
