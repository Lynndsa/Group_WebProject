// Функция для открытия модального окна
function openModal(img) {
    var modal = document.getElementById('modal');
    var modalImg = document.getElementById('modal-img');
    var captionText = document.getElementById('caption');

    if (modal && modalImg && captionText && img) {
        modal.style.display = "flex";
        modalImg.src = img.src;
        captionText.innerHTML = img.alt;
        document.body.style.overflow = 'hidden';
    }
}

// Функция для закрытия модального окна
function closeModal() {
    var modal = document.getElementById('modal');
    if (modal) {
        modal.style.display = "none";
        document.body.style.overflow = 'auto';
    }
}

// Закрытие по клавише ESC
document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
        closeModal();
    }
});

// Закрытие при клике вне изображения
document.addEventListener('click', function (e) {
    var modal = document.getElementById('modal');
    if (modal && modal.style.display === 'flex' && e.target === modal) {
        closeModal();
    }
});

// Инициализация - убеждаемся что модалка закрыта при загрузке
document.addEventListener('DOMContentLoaded', function () {
    var modal = document.getElementById('modal');
    if (modal) {
        modal.style.display = "none";  // Гарантированно закрываем
    }
});