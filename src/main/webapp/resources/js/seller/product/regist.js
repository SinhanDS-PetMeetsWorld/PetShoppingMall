function regist(){
	let categories = document.querySelectorAll('.category');
	if(categories.length == 0){
		alert("하나 이상의 카테고리를 선택해주세요");
		return false;
	}
	
	let cat1List = document.querySelectorAll('.category1_list');
	let cat2List = document.querySelectorAll('.category2_list');
	for(var i = 0; i < cat1List.length - 1; i++){
		for(var j = i + 1; j < cat1List.length - 1; j++){
			if((cat1List[i].value == cat1List[j].value) && (cat2List[i].value == cat2List[j].value)){
				alert("중복 선택 된 카테고리가 존재합니다! 카테고리를 확인해주세요!");
				return false;
			}
		}
	}
	
	return true;
}