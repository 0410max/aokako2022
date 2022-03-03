$(function(){
    $('.user-index-modal-open').click(function(){
        $('#bg,.user-index-modal').fadeIn();
    });

    $('.user-index-modal-close,#bg').click(function(){
        $('#bg,.user-index-modal').fadeOut();
    });
});