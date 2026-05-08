document.addEventListener('DOMContentLoaded', function () {

    const input = document.getElementById('cover');
    const fileName = document.getElementById('file-name');
    const uploadBtn = document.querySelector('.file-upload-btn');

    input.addEventListener('change', function () {

        if (this.files.length > 0) {

            fileName.textContent = this.files[0].name;

            uploadBtn.classList.add('file-selected');

        } else {

            fileName.textContent = 'Файл не загружен';

            uploadBtn.classList.remove('file-selected');

        }

    });

});