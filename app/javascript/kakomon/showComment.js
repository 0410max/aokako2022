document.addEventListener("turbolinks:load", function () {
    $(function(){

        $('.kakomons-show-top-button')
            .on('click',function(){
                $('.index-modal,.index-modal-bg').fadeIn();
                $("body").addClass("no_scroll"); 
            });

        $('.kakomons-show-top-button-1000') 
            .on('click',function(){
                $('.index-modal,.index-modal-bg-1000,.index-modal-bg').fadeIn();
                $("body").addClass("no_scroll"); 
            });

        $('.index-modal-bg,.index-modal-bg-1000,.index-modal-close-button')
            .on('click',function(){
                $("body").removeClass("no_scroll");
                $('.index-modal,.index-modal-bg,.index-modal-bg-1000').fadeOut();
            });
    });    
});
