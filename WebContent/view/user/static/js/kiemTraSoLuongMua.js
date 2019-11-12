function ktSoLuongMua(){
	var hopLe = true;
	var mangSoLuong  = document.getElementsByClassName("sl_mua");
	
	for(var i = 0; i < mangSoLuong.length; i++){
		var soLuong = mangSoLuong[i].value;
		//Số lượng mua phải là kiểu số, và lớn hơn 0
		if( isNaN(soLuong) == true || soLuong <= 0){
			hopLe = false;
			alert('Số lượng mua phải là kiểu số, lớn hơn 0. Vui lòng kiểm tra lại !');
		}
	}
	
	return hopLe;
}