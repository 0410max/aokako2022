document.addEventListener("turbolinks:load", function () {
    $(function(){

        $('.slideshow').each(function(){
            var $container = $(this),
                $slideGroup = $container.find('.slideshow-slides'),
                $slides = $slideGroup.find('.slide'),
                $nav = $container.find('.slideshow-nav'),
                slideCount = $slides.length,
                currentIndex = 0,
                duration = 500;

            function nextSlide(){
                $('.next')
                    .on('click',function(){
                        $slideGroup.css('margin-left','-500px');
                        console.log('ok');
                    });
            };

            function goToSlide(index) {
                $slideGroup.animate({left:-100 * index + '%'},duration);
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

            $nav.on('click',function(){
                if(($this).hasClass('prev')){
                    goToSlide(currentIndex - 1);
                    console.log('ok');
                }else {
                    goToSlide(currentIndex + 1);
                }
                });

            nextSlide();

        });
    });
});