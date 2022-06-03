document.addEventListener("turbolinks:load", function () {
    $('.prof-search').on('click',function(){
        $('.search-prof-wrapper').css('display','block');
        $('.search-sub-wrapper').css('display','none');
        $('.sub-search').css('backgroundColor','white');
        $('.prof-search').css('backgroundColor','#dbdbdb');
    });
    $('.sub-search').on('click',function(){
        $('.search-prof-wrapper').css('display','none');
        $('.search-sub-wrapper').css('display','block');
        $('.sub-search').css('backgroundColor','#dbdbdb');
        $('.prof-search').css('backgroundColor','white');
    });

    $('.kakomon-prof-search').on('click',function(){
        $('.kakomon-search-prof-wrapper').css('display','block');
        $('.kakomon-search-sub-wrapper').css('display','none');
        $('.kakomon-sub-search').css('backgroundColor','white');
        $('.kakomon-prof-search').css('backgroundColor','#dbdbdb');
    });
    $('.kakomon-sub-search').on('click',function(){
        $('.kakomon-search-prof-wrapper').css('display','none');
        $('.kakomon-search-sub-wrapper').css('display','block');
        $('.kakomon-sub-search').css('backgroundColor','#dbdbdb');
        $('.kakomon-prof-search').css('backgroundColor','white');
    });
});
