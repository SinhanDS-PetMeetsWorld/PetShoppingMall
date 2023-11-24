$(function () {
    //스와이퍼 적용하기
    let swiper = new Swiper(".swiper-visual", {
        //이 두 옵션은 굉장히 자주쓰인다
        autoplay: {
            display: 3000
        },
        loop: true
    });
    
    $("#popup").css({
        top: (($(window).height() - $("#popup").outerHeight()) / 2 + $(window).scrollTop()) + 'px',
        left: (($(window).width() - $("#popup").outerWidth()) / 2 + $(window).scrollTop()) + 'px'
    })
    $("#popup").draggable();

    $('.board_title').on('click', function () {
        $('.board_title').toggleClass('on');
        $('.board_contents').toggleClass('on');
    });
})