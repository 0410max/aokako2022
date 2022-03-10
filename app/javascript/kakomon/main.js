/*global fetch*/
class DepSelector{
    constructor(rootElm){
        this.rootElm = rootElm;
        this.departments = [];
        this.courses = [];
        this.depCode = null;
    }

    async init() {
        await this.updateDep();
        await this.updateCor();
    }

    async getDeps() {
        const depResponse = await fetch('/dep.json');
        return await depResponse.json();
    }

    async getCors(depCode) {
        const corResponse = await fetch(`/courses/${depCode}.json`);
        return await corResponse.json();
    }

    async updateDep() {
        this.departments = await this.getDeps();
        this.depCode = this.departments[0].code;
        this.createDepOptionsHtml();
    }

    async updateCor() {
        this.courses = await this.getCors(this.depCode);
        this.createCorOptionHtml();
    }

    createDepOptionsHtml() {
        const depSelectorElm = this.rootElm.querySelector('.departments');
        depSelectorElm.innerHTML = this.toOptionsHtml(this.departments);

        depSelectorElm.addEventListener('change',(event) =>{
            this.depCode = event.target.value;
            this.updateCor();
        });
    }

    createCorOptionHtml(){
        const corSelectorElm = this.rootElm.querySelector('.courses');
        corSelectorElm.innerHTML = this.toOptionsHtml(this.courses);
    }

    toOptionsHtml(records) {
        return records.map((record)=>{
            return`
                <option value="${record.code}">
                    ${record.name}
                </option>
            `;
        }).join(' ');
    }
}

document.addEventListener('turbolinks:load', () => {
const depSelector = new DepSelector(document.getElementById('depSelector'));
depSelector.init();
});
