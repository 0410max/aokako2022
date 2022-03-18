document.addEventListener("turbolinks:load", function () {
    $('.slideshow,.slideshow-1000').each(function(){
        var $container = $(this),
            $slideGroup = $container.find('.slideshow-slides'),
            $slides = $slideGroup.find('.slide'),
            $nav = $container.find('.slideshow-nav'),
            slideCount = $slides.length,
            currentIndex = 0,
            duration = 250;

        function goToSlide(index) {
            $slideGroup.animate({left: -400 * index + 'px'},duration,'swing');
            currentIndex = index;
            updateNav();
        }

        function updateNav(){
            var $navPrev = $nav.find('.prev'),
                $navNext = $nav.find('.next');

            if(currentIndex === 0) {
                $navPrev.addClass('disabled');
            }else {
                $navPrev.removeClass('disabled');
            }

            if(currentIndex === slideCount - 1){
                $navNext.addClass('disabled');
            }else {
                $navNext.removeClass('disabled');
            }
        }


        $nav.on('click','span',function(){
            if($(this).hasClass('prev')){
                goToSlide(currentIndex - 1);
            }else {
                goToSlide(currentIndex + 1);
            }
        });

        goToSlide(currentIndex);
    });





    $('.slideshow-420').each(function(){
        var $container = $(this),
            $slideGroup = $container.find('.slideshow-slides'),
            $slides = $slideGroup.find('.slide'),
            $nav = $container.find('.slideshow-nav'),
            slideCount = $slides.length,
            currentIndex = 0,
            duration = 250;

        function goToSlide(index) {
            $slideGroup.animate({left: -400 * index + 'px'},duration,'swing');
            currentIndex = index;
            updateNav();
        }

        function updateNav(){
            var $navPrev = $nav.find('.prev-420'),
                $navNext = $nav.find('.next-420');

            if(currentIndex === 0) {
                $navPrev.addClass('disabled');
            }else {
                $navPrev.removeClass('disabled');
            }

            if(currentIndex === slideCount - 1){
                $navNext.addClass('disabled');
            }else {
                $navNext.removeClass('disabled');
            }
        }


        $nav.on('click','span',function(){
            if($(this).hasClass('prev-420')){
                goToSlide(currentIndex - 1);
            }else {
                goToSlide(currentIndex + 1);
            }
        });

        goToSlide(currentIndex);
    })


});