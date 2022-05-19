document.addEventListener("turbolinks:load", function () {

    $('.kakomon-count')
        .on('click',function(){
            $('.kakomon-index-end-user').css('display','block');
            $('.board-index-end-user').css('display','none');
            $('.following-index-end-user').css('display','none');
            $('.follower-index-end-user').css('display','none');

            $('.kakomon-count').removeClass('kakomon-count-at');
            $('.class-count').removeClass('class-count-at');
            $('.span-following').removeClass('span-following-at');
            $('.span-follower').removeClass('span-follower-at');
        })

    $('.class-count')
        .on('click',function(){
            $('.kakomon-index-end-user').css('display','none');
            $('.board-index-end-user').css('display','block');
            $('.following-index-end-user').css('display','none');
            $('.follower-index-end-user').css('display','none');

            $('.kakomon-count').addClass('kakomon-count-at');
            $('.class-count').addClass('class-count-at');
            $('.span-following').removeClass('span-following-at');
            $('.span-follower').removeClass('span-follower-at');
        })

    $('.span-following')
        .on('click',function(){
            $('.kakomon-index-end-user').css('display','none');
            $('.board-index-end-user').css('display','none');
            $('.following-index-end-user').css('display','block');
            $('.follower-index-end-user').css('display','none');

            $('.kakomon-count').addClass('kakomon-count-at');
            $('.class-count').removeClass('class-count-at');
            $('.span-following').addClass('span-following-at');
            $('.span-follower').removeClass('span-follower-at');
        })

    $('.span-follower')
        .on('click',function(){
            $('.kakomon-index-end-user').css('display','none');
            $('.board-index-end-user').css('display','none');
            $('.following-index-end-user').css('display','none');
            $('.follower-index-end-user').css('display','block');

            $('.kakomon-count').addClass('kakomon-count-at');
            $('.class-count').removeClass('class-count-at');
            $('.span-following').removeClass('span-following-at');
            $('.span-follower').addClass('span-follower-at');
        })   
        




    $('.user-plus-button')
        .on('click',function(){
            $('.users-show-recommendation').css('display','block');
            $('.user-plus').css('display','none');
            $('.user-minus').css('display','inline');
        });

    $('.user-minus-button')
        .on('click',function(){
            $('.users-show-recommendation').css('display','none');
            $('.user-plus').css('display','inline');
            $('.user-minus').css('display','none');
        });
});