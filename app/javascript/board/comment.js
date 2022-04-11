document.addEventListener("turbolinks:load", function () {
    $('.board-comment')
        .on('click',function(){
            $(this).css('display',none);
            alert('ok')
        });
});
