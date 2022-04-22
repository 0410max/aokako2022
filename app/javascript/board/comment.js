document.addEventListener("turbolinks:load", function () {
    $('.continue-comment-link-1000')
        .on('click',function(){
            $('.board-comment-all').css('display','inline');
            $('.board-comment-1000').css('display','none');
            $('.continue-comment-link-1000').css('display','none');
        });

    $('.continue-comment-link-460')
        .on('click',function(){
            $('.board-comment-all').css('display','inline');
            $('.board-comment-460').css('display','none');
            $('.continue-comment-link-460').css('display','none');
        });

});
