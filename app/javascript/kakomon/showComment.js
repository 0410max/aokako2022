document.addEventListener("turbolinks:load", function () {
$(function(){
    $('.kakomons-show-top-button')
        .on('click',function(){
            $("body").addClass("no_scroll"); 
            $('.index-modal,.index-modal-bg').fadeIn();
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

    $('.kakomons-show-comment-submit-1000')
        .on('click',function(){
            jQuery('body').scrollTop('99999999');
        });
});    
});