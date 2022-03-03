$(function(){
    $('.user-index-modal-open').click(function(){
        $('#bg, .user-index-modal').fadeIn();
        console.log('ok');
    });

    $('.user-index-modal-close,#bg').click(function(){
        $('#bg, .user-index-modal').fadeOut();
    });
});
