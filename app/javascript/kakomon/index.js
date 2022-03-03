$(function() {
    $('.index-modal-show-button').trigger('click')(function(){
        $('.index-modal,.index-modal-bg').fadeIn();
    });

    $('.index-modal-close-button').trigger('click')(function(){
        $('.index-modal,.index-modal-bg').fadeOut();
    });
});
