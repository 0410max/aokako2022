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
        depSelectorElm.innerHTML = `
          <%= f.select :dep,[[this.departments.name,this.]],{},{class:'option'} %>
          <%= f.select :year, [["2010", "2010"],["2011", "2011"]], {include_blank: "選択して下さい"},{class:'year'} %>
        `;

        depSelectorElm.addEventListener('change',(event) =>{
            this.depCode = event.target.value;
            this.updateCor();
        });
    }

    createCorOptionHtml(){
        const corSelectorElm = this.rootElm.querySelector('.courses');
        corSelectorElm.innerHTML =`
          <%= f.select :cor,options_for_select(this.courses.map{|c|[this.courses.name,this.couses.code]},this.couses.code),{},{class:'option'} %>
        `;
    }

}

document.addEventListener('turbolinks:load', () => {
const depSelector = new DepSelector(document.getElementById('depSelector'));
depSelector.init();
});