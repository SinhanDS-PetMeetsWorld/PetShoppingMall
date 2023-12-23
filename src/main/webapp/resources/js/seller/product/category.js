$('.add_btn_category').on('click', add_category);
$('.remove_btn_category').on('click', remove_category);
$('.category1_list').on('change', change_category2);

function remove_category(){
	let categoryBody = this.parentNode.parentNode.parentNode;
	let category_target = this.parentNode.parentNode;
	console.log(category_target);
	categoryBody.removeChild(category_target);
	
}

function add_category() {
	let newCategory = $('.category_original').clone();
	let categoryAddButton = $('.category_add_button').eq(-1).clone();
	
	$(newCategory).css('display', 'inline-block');
	$(newCategory).removeClass('category_original');
	$(newCategory).addClass('category');
	console.log(newCategory);
	$(newCategory).find('.add_btn_category').on('click', add_category);
	$(newCategory).find('.remove_btn_category').on('click', remove_category);
	$(newCategory).find('.category1_list').on('change', change_category2)
	$(this).remove();
	newCategory.appendTo($('.category_body'));
	
	$(categoryAddButton).css('clear', 'both');
	$(categoryAddButton).on('click', add_category);
	categoryAddButton.appendTo($('.category_body'));
}

function change_category2(){
	let target = this.parentNode.querySelector('.category2_list');
	$(target).empty(); 
	
	for(var i = 0; i < category2[this.value].length; i++){
		var newObj = $('<option value="i">' + category2[this.value][i] + '</option>');
		newObj.appendTo(target);
	}
}