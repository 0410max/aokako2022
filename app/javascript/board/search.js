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
});