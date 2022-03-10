class NoKakomonsCount {
    init(){
        const noKakomonElm = document.querySelector('.no-kakomon-message');
        document.querySelector('.no-kakomon-search-submit').onclick = function() {
            noKakomonElm.innerHTML = '過去問を投稿するとこの機能が使えます';
        }
    }
};

document.addEventListener('turbolinks:load', () => {
    const noKakomonsCount = new NoKakomonsCount();
    noKakomonsCount.init();
});