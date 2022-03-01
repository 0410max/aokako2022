class IndexModal{
    constructor(rootElm){
        this.rootElm = rootElm
    }

    init(){
        const indexModal = this.rootElm.querySelector('#index-modal');
        indexModal.addEventListener('click',()=>{
            alert('test');
        });
    }
}

document.addEventListener('turbolinks:load',()=>{
    const indexModal = new IndexModal(document.querySelector('#modalContent'));
    indexModal.init();
});