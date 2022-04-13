document.addEventListener("turbolinks:load", function () {
    $('.continue-comment-link-1000')
        .on('click',function(){
            $('.board-comment-1000-all').css('display',inline);
            $('.board-comment-1000').css('display',none);
            alert('ok')
        });
});
