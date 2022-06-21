document.addEventListener("turbolinks:load", function () {
    $('.search').on('change',function(){
        $('.search-submit').addClass('show');
        $('.no-change-search').addClass('none');
    });

    $('.no-kakomon-search-submit,.sub-demo-text-area-kakomon,.sub-demo-text-area-content-kakomon').on('click',function(){
        $('.no-kakomon-message').html('過去問を投稿するとこの機能が使えます')
    });

    $('.no-board-search-submit,.sub-demo-text-area,.sub-demo-text-area-content').on('click',function(){
        $('.no-kakomon-message').html('講義評価を投稿するとこの機能が使えます')
    });

    $('.no-kakomon-search-submit-no-login,.sub-demo-text-area-no-login,.sub-demo-text-area-content-no-login').on('click',function(){
        $('.no-kakomon-message-not-login').html('ログインまたは新規登録をしてください')
    });
});
