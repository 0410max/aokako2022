document.addEventListener("turbolinks:load", function () {
    $(function () {
        $('#image').on("change", function () {
        var file = this.files[0];
        const fileName = document.getElementById("file-name");
        if (file != null) {
            fileName.insertAdjacentHTML('afterbegin', file.name);
            console.log('ok');
        }
        });
    });
});