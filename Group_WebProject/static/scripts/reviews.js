// static/scripts/reviews.js
document.addEventListener('DOMContentLoaded', () => {
    const filterTitle = document.getElementById('filter-title');
    const filterRating = document.getElementById('filter-rating');
    const applyBtn = document.getElementById('apply-filters');
    const cards = document.querySelectorAll('.review-card-large');
    const emptyMsg = document.getElementById('no-reviews-msg');

    function applyFilters() {
        const selectedBook = filterTitle.value.trim();
        const selectedRating = filterRating.value.trim();
        let visibleCount = 0;

        cards.forEach(card => {
            const cardBook = card.getAttribute('data-book');
            const cardRating = String(card.getAttribute('data-rating'));

            // Если фильтр пустой — считаем, что совпадает
            const matchBook = !selectedBook || cardBook === selectedBook;
            const matchRating = !selectedRating || cardRating === selectedRating;

            if (matchBook && matchRating) {
                card.style.display = '';
                visibleCount++;
            } else {
                card.style.display = 'none';
            }
        });

        // Показываем/скрываем сообщение "не найдено"
        emptyMsg.style.display = visibleCount === 0 ? '' : 'none';
    }

    // Срабатывает по кнопке "Применить"
    applyBtn.addEventListener('click', applyFilters);

    // Раскомментируй, если захочешь мгновенную фильтрацию без кнопки:
    // filterTitle.addEventListener('change', applyFilters);
    // filterRating.addEventListener('change', applyFilters);
});