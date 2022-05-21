document.addEventListener("turbolinks:load", function () {
    $(function(){

        $('.kakomons-show-top-button')
            .on('click',function(){
                $('.index-modal,.index-modal-bg').fadeIn();
                $("body").addClass("no_scroll"); 
            });

            $('.index-modal-bg,.index-modal-close-button')
            .on('click',function(){
                $("body").removeClass("no_scroll");
                $('.index-modal,.index-modal-bg').fadeOut();
            });

        $('.kakomons-show-text-area')
            .on('input',function(){
                let text = $(this).val();
                if(text != ''){
                    $('.kakomons-show-comment-submit,.kakomons-show-comment-submit-1000').css('opacity',1);
                }else{
                    $('.kakomons-show-comment-submit,.kakomons-show-comment-submit-1000').css('opacity',0.5);
                }
            });
    });    
});
