document.addEventListener("turbolinks:load", function () {
    $('.message-area').scrollTop('99999999');

    $('.message-text-area')
        .on('input',function(){
            $('.message-submit').css('opacity',1);
        });
});