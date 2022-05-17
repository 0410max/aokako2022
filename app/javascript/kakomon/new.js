document.addEventListener("turbolinks:load", function () {

    $(function(){
        $('.add-image2')
            .on('click',function(){
                $('.image2').css('display','block');
                $(this).css('display','none');
                $('.add-image3').css('display','block');
                $('.image1').find('span').html('1');
            });
            
        $('.add-image3')
            .on('click',function(){
                $('.image3').css('display','block');
                $(this).css('display','none');
            });    
    });






});