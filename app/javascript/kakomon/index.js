document.addEventListener("turbolinks:load", function () {
    var $kakomonsCount = $('#kakomonsCount').value;
    $(function(){
        if($kakomonsCount == 0){
            $('.search-submit')
                .on('click',function(){
                    console.log('test');
                });
        }
    });
});