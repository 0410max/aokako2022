document.addEventListener("turbolinks:load", function () {
    $('.select').on('change',function(){
        $('.dep-submit').addClass('show');
        $('.dep-submit-first').addClass('none');
    });

    $('.no-kakomon-button').on('click',function(){
        $('.no-kakomon-message').html('過去問を投稿するとこの機能が使えます')
    });
});