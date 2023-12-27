$('.add_btn_category').on('click', add_category);
$('.remove_btn_category').on('click', remove_category);
$('.category1_list').on('change', change_category2);

function remove_category(){
	let categoryBody = this.parentNode.parentNode.parentNode;
	let category_target = this.parentNode.parentNode;
	categoryBody.removeChild(category_target);
	
}

function add_category() {
	let newCategory = $('.category_original').clone();
	let categoryAddButton = $('.category_add_button').eq(-1).clone();
	
	$(newCategory).css({'display': 'inline-block',
						'width':'1016px'
						});
	$(newCategory).removeClass('category_original');
	$(newCategory).addClass('category');
	$(newCategory).find('.add_btn_category').on('click', add_category);
	$(newCategory).find('.remove_btn_category').on('click', remove_category);
	$(newCategory).find('.category1_list').on('change', change_category2)
	if($(this.parentNode).data('ori') == 9999){
		$(this.parentNode).remove();
	}
	$(this).remove();
	newCategory.appendTo($('.category_body'));

	
	
	$(categoryAddButton).css({'display': 'block',
								'margin-top':'20px'
							});
	
	$(categoryAddButton).on('click', add_category);
	categoryAddButton.appendTo($('.category_body'));
	
}

function change_category2(){
	console.log('cc');
	let target = this.parentNode.parentNode.querySelector('.category2_list');
	$(target).empty(); 
	
	for(var i = 0; i < category2[this.value].length; i++){
		var newObj = $('<option value=' + '\"' + i + '\">' + category2[this.value][i] + '</option>');
		newObj.appendTo(target);
	}
}