$(function () {

    //이렇게 할 수도 있다
    // $('.depth1 > li').on('mouseover', function(){
    //     let index = $(this).index();
    //     $('.depth2').eq(index).css('display','block');
    // })
    // $('.depth1 > li').on('mouseout', function(){
    //     let index = $(this).index();
    //     $('.depth2').eq(index).css('display','none');
    // })


    $('.depth1 > li').on('mouseover', function () {
        //find를 쓰면, 이 JQuery 객체 안에있는 요소를 선택자로 찾을 수 있다.
        //stop()을 이용해서 이벤트가 중첩될 경우 진행중인 이벤트를 멈추고 새로운 이벤트를 담아줄 수 있다.
        $(this).find('.depth2').stop().slideDown(300);
    })
    $('.depth1 > li').on('mouseout', function () {
        //find를 쓰면, 이 JQuery 객체 안에있는 요소를 선택자로 찾을 수 있다.
        $(this).find('.depth2').stop().slideUp(300);
    })





    //이거 eq(1)말고 전체에 대해서 수행하게해보기
    $('.section > img').eq(1).on('mouseover', function () {
        console.log($('.section').eq(1).width());
        $('.section').eq(1).css('padding', '-4px');
        $(this).css('border', 'solid 3px #999')
    })
    // $('.section > img').on('mouseover', function(){
    //     $(this).css('padding', '-3px');
    //     $(this).css('border', 'solid 3px #999')
    // });
    // $('.section > img').on('mouseout', function(){
    //     $(this).css('padding', '+3px');
    //     $(this).css('border', '')
    // });


    //퀵메뉴 위치설정
    let quick_left = $('.menu > ul:first-child').position().left + 1200;
    let quick_top = $('.menu > ul:first-child').position().top;

    $('#quickmenu').css({
        left: quick_left,
        top: quick_top
    })

    //퀵메뉴가 스크롤을 따라가도록
    $(window).scroll(function () {
        let scrollTop = $(window).scrollTop();
        let quick_top_new = scrollTop + quick_top;

        // 애니메이션효과를주기
        $('#quickmenu').stop().animate({
            top: quick_top_new
        }, 500)
    });

    //ㅠㅠㅠㅠ이거왜안되지 ㅜㅜㅜㅜㅜ
    $('#top').click(function () {
        console.log($('html'));
        // $('html').animate({ scrollTop: 0 }, 500);
        $('html').animate({ scrollTop: 0 }, 500);
        // $(window).scrollTop(0);
    });
})