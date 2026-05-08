
    document.addEventListener('DOMContentLoaded', function () {

    const form = document.querySelector('.book-form');

    const input = document.getElementById('cover');

    const fileName = document.getElementById('file-name');

    const uploadBtn = document.querySelector('.file-upload-btn');

    const fileError = document.getElementById('file-error');

    input.addEventListener('change', function () {

        if (this.files.length > 0) {

        fileName.textContent = this.files[0].name;

    uploadBtn.classList.add('file-selected');

    fileError.textContent = '';

        } else {

        fileName.textContent = 'Файл не загружен';

    uploadBtn.classList.remove('file-selected');
        }

    });

    form.addEventListener('submit', function (e) {

        if (input.files.length === 0) {

        e.preventDefault();

    fileError.textContent = 'Пожалуйста, загрузите изображение обложки';

    uploadBtn.classList.add('file-error-state');

        }

    });

});
