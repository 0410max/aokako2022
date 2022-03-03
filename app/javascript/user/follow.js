$(function(){
    $('.user-index-modal-open').click(function(){
        $("body").addClass("no_scroll");
        let target = $(this).data('id');
        let modal = document.querySelector('.' + target);
        $(modal).toggleClass('is-show');
        $('#bg, .user-index-modal').fadeIn();
    });

    $('.user-index-modal-close,#bg').click(function(){
        $("body").removeClass("no_scroll");
        $(this).parents('.modal').toggleClass('is-show');
        $('#bg').fadeOut();
    });
});
