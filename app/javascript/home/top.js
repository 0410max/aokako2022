class PhotoViewer {
    constructor(rootElm,images){
        this.rootElm = rootElm;
        this.images = images;
        this.currentIndex = 0;
    }
    
    init(){
        this.updatePhotoViewer();
    }

    updatePhotoViewer() {
        const frameElm = this.rootElm.querySelector('.frame');
        const image = this.images[this.currentIndex];
        frameElm.innerHTML = `
            <div class="image">
                <img src="${image}">
            </div>
        `;

        this.startTimer();
    }

    next(){
        const lastIndex = this.images.length - 1;
        if(this.currentIndex === lastIndex) {
            this.currentIndex = 0
        } else {
            this.currentIndex++;
        }
        this.updatePhotoViewer();
    }

    startTimer() {
        if(this.timerKey) {
            clearTimeout(this.timerKey)
        }

        this.timerKey = setTimeout(()=>{
            this.next();
        },6000);
    }

}

/*global images*/
// eslint-disable-next-line no-native-reassign
images = [
　'assets/images/青山1.jpeg',
  'assets/images/相模原1.jpeg',
  'assets/images/相模原2.1.jpeg',
  'assets/images/相模原3.jpeg',
  'assets/images/相模原3.jpeg',
  'assets/images/相模原6.jpeg',
  'assets/images/相模原4.jpeg',
  'assets/images/相模原5.jpeg'
];
new PhotoViewer(document.getElementById('top'),images).init();