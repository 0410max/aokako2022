document.addEventListener("turbolinks:load", function () {
    $('.search').on('change',function(){
        $('.search-submit').addClass('show');
        $('.no-change-search').addClass('none');
    });

    $('.no-kakomon-search-submit').on('click',function(){
        $('.no-kakomon-message').html('過去問を投稿するとこの機能が使えます')
    });
});
