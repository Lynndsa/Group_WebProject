
document.addEventListener('DOMContentLoaded', () => {
    //Получаем элементы управления и карточки
    const filterTitle = document.getElementById('filter-title');      // Выпадающий список: книга
    const filterRating = document.getElementById('filter-rating');    // Выпадающий список: оценка
    const applyBtn = document.getElementById('apply-filters');        // Кнопка "Применить"
    const cards = document.querySelectorAll('.review-card-large');    // Все карточки отзывов на странице
    const emptyMsg = document.getElementById('no-reviews-msg');       // Сообщение "ничего не найдено" (скрыто по умолчанию)


    // Проходит по всем карточкам и скрывает те, что не соответствуют выбранным критериям

    function applyFilters() {
        // Считываем выбранные значения, убираем лишние пробелы
        const selectedBook = filterTitle.value.trim();
        const selectedRating = filterRating.value.trim();
        let visibleCount = 0;  // Счётчик видимых карточек (нужен для сообщения "не найдено")

        cards.forEach(card => {
            // Берём значения из data-атрибутов карточки (они прописаны в HTML шаблона)
            const cardBook = card.getAttribute('data-book');
            const cardRating = String(card.getAttribute('data-rating'));

            // Логика совпадения: если фильтр пустой — считаем, что условие выполнено (ИЛИ)
            // Иначе — строгое сравнение значения карточки с выбранным фильтром
            const matchBook = !selectedBook || cardBook === selectedBook;
            const matchRating = !selectedRating || cardRating === selectedRating;

            // Показываем карточку только если совпали ОБА условия
            if (matchBook && matchRating) {
                card.style.display = '';      // Пустая строка = сброс стиля, карточка видна
                visibleCount++;
            } else {
                card.style.display = 'none';  // Скрываем не подходящие карточки
            }
        });

        // Управление сообщением "не найдено":
        // Показываем его, если после фильтрации ни одна карточка не осталась видимой
        emptyMsg.style.display = visibleCount === 0 ? '' : 'none';
    }

    // Навешиваем обработчик: функция applyFilters выполнится только по клику на кнопку
    applyBtn.addEventListener('click', applyFilters);

});