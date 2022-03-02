class IndexModal{

    init(){
        const indexModal = document.querySelector('.index-modal-button');
        indexModal.addEventListener('click',()=>{
            const indexModalElm = document.querySelector('.index-modal');
            indexModalElm.innerHTML = this.indexModalContent();
        });
    }

    indexModalContent(){
        return`
            <div class='modal-wrapper'>
                <div class='index-modal-bg'>
                    <div class='modal-content'>
                        <div>報告する</div><br />
                        <div>投稿へ移動</div><br />
                        <div>キャンセル</div>
                    </div>
                </div>
            </div>
        `;
    }
}

document.addEventListener('turbolinks:load',()=>{
    const indexModal = new IndexModal();
    indexModal.init();
});