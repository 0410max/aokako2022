document.addEventListener("turbolinks:load", function () {
$(function(){

    $('.kakomons-index-top-button')
        .on('click',function(){
            var btnIndex = $(this).index();
            $('.index-modal,.index-modal-bg').eq(btnIndex).fadeIn();
            $("body").addClass("no_scroll"); 
        });

        $('.index-modal-bg,.index-modal-close-button')
        .on('click',function(){
            $("body").removeClass("no_scroll");
            $('.index-modal,.index-modal-bg').fadeOut();
        });

    $('.kakomons-show-text-area')
        .on('input',function(){
            $('.kakomons-show-comment-submit,.kakomons-show-comment-submit-1000').css('opacity',1)
        });
});    
});