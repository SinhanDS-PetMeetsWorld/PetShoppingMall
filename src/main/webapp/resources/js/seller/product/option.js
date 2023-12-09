$('.add_btn_option').on('click', add_option);
$('.add_btn_option_content').on('click', add_option_content);
$('.remove_btn_option_content').on('click', remove_option_content);
$('.remove_btn_option_title').on('click', remove_option_title);

function add_option(){
	console.log("gg1");
	let optionAddButton = $('.option_add_button').eq(-1).clone();
	let newOption = $('.option_original').clone();
	
	
	$(newOption).css('display', 'inline');
	$(newOption).removeClass('option_original');
	$(newOption).addClass('option');
	console.log(newOption);
	$(newOption).find('.add_btn_option').on('click', add_option);
	$(newOption).find('.add_btn_option_content').on('click', add_option_content);
	$(newOption).find('.remove_btn_option_content').on('click', remove_option_content);
	$(newOption).find('.remove_btn_option_title').on('click', remove_option_title);
	$(this).remove();
	newOption.appendTo($('.option_body'));
	
	$(optionAddButton).css('display', 'inline');
	$(optionAddButton).on('click', add_option);
	optionAddButton.appendTo($('.option_body'));
}

function add_option_content(){
	let option_content = this.parentNode;
	let option_title = option_content.parentNode;
	/* let option_content_index = $('.option_content').index(option_content);
	console.log(option_content_index); */
	let newOptionContent = $(option_content).clone();
	$(newOptionContent).find('.option_content_list').val('');
	$(newOptionContent).find('.option_price_list').val(0);
	$(newOptionContent).find('.add_btn_option_content').on('click', add_option_content);
	$(newOptionContent).find('.remove_btn_option_content').on('click', remove_option_content);
	newOptionContent.appendTo(option_title);
}

function remove_option_title(){
	let option_content = this.parentNode;
	let option_title = option_content.parentNode;
	let option_body = option_title.parentNode;
	option_body.removeChild(option_title);
}

function remove_option_content(){
	let option_content = this.parentNode;
	let option_title = option_content.parentNode;
	option_title.removeChild(option_content);
	if(option_title.querySelector('.option_content') == null){
	let option_temp = option_title.parentNode;
	let option_body = option_temp.parentNode;
	option_body.removeChild(option_temp);
	}
}