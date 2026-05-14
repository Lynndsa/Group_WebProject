% rebase('layout', title='Новинки Кинга', year=year)

<div class="admin-container">

    <!-- ФОРМА -->
    <div class="form-section">

        <h2 class="section-title-small">Добавить новинку</h2>

        <form action="/add_book"
              method="POST"
              enctype="multipart/form-data"
              class="book-form"
              id="book-form">

            <!-- НАЗВАНИЕ -->
            <div class="form-group">

                <label for="title">Название книги</label>

                <input type="text"
                       id="title"
                       name="title"
                       placeholder="Например: Оно"
                       value="{{ form_data.get('title', '') }}">

                % if errors.get('title'):
                    <div class="error-message">
                        {{ errors['title'] }}
                    </div>
                % end

            </div>

            <!-- ДАТА -->
            <div class="form-group">

                <label for="release_date">Дата выхода</label>

                <input type="date"
                       id="release_date"
                       name="release_date"
                       value="{{ form_data.get('release_date', '') }}">

                % if errors.get('release_date'):
                    <div class="error-message">
                        {{ errors['release_date'] }}
                    </div>
                % end

            </div>

            <!-- ОПИСАНИЕ -->
            <div class="form-group">

                <label for="description">Предисловие</label>

                <textarea id="description"
                          name="description"
                          rows="5"
                          placeholder="О чём эта книга?">{{ form_data.get('description', '') }}</textarea>

                % if errors.get('description'):
                    <div class="error-message">
                        {{ errors['description'] }}
                    </div>
                % end

            </div>

            <!-- ОБЛОЖКА -->
            <div class="form-group">

                <div class="upload-label">
                    Фото обложки
                </div>

                <label class="file-upload-btn">

                    <input type="file"
                           id="cover"
                           name="cover"
                           accept="image/*">

                    <span id="file-name">Файл не загружен</span>

                    <span class="upload-icon">📁</span>

                </label>

                % if errors.get('cover'):
                    <div class="error-message" id="file-error">
                        {{ errors['cover'] }}
                    </div>
                % else:
                    <div class="error-message" id="file-error"></div>
                % end

            </div>

            <!-- РЕЙТИНГ -->
            <div class="form-group">

                <label for="rating">Возрастной рейтинг</label>

                <select id="rating" name="rating">

                    <option value="0+"
                        % if form_data.get('rating') == '0+':
                            selected
                        % end
                    >0+</option>

                    <option value="6+"
                        % if form_data.get('rating') == '6+':
                            selected
                        % end
                    >6+</option>

                    <option value="12+"
                        % if form_data.get('rating') == '12+':
                            selected
                        % end
                    >12+</option>

                    <option value="16+"
                        % if form_data.get('rating') == '16+':
                            selected
                        % end
                    >16+</option>

                    <option value="18+"
                        % if form_data.get('rating', '18+') == '18+':
                            selected
                        % end
                    >18+</option>

                </select>

                % if errors.get('rating'):
                    <div class="error-message">
                        {{ errors['rating'] }}
                    </div>
                % end

            </div>

            <button type="submit" class="submit-btn">
                Разместить
            </button>

        </form>

    </div>

    <!-- СПИСОК КНИГ -->
    <div class="books-section">

        <h2 class="section-title-small">
            Актуальные новинки
        </h2>

        <div class="books-grid">

            % for book in books:

            <div class="book-card-new">

                <div class="book-cover-wrapper">

                    <img src="{{ book['cover'] }}"
                         alt="{{ book['title'] }}"
                         class="book-cover-new">

                    <span class="age-rating">
                        {{ book['rating'] }}
                    </span>

                </div>

                <div class="book-info-new">

                    <h3 class="book-title-new">
                        {{ book['title'] }}
                    </h3>

                    <p class="book-date-new">
                        {{ book['release_date'] }}
                    </p>

                    <p class="book-desc-new">
                        {{ book['description'] }}
                    </p>

                </div>

            </div>

            % end

        </div>

    </div>

</div>

<script>

document.addEventListener('DOMContentLoaded', () => {

    const form = document.getElementById('book-form');

    const title = document.getElementById('title');

    const releaseDate = document.getElementById('release_date');

    const description = document.getElementById('description');

    const rating = document.getElementById('rating');

    const input = document.getElementById('cover');

    const fileError = document.getElementById('file-error');

    const uploadBtn = document.querySelector('.file-upload-btn');

    const fileName = document.getElementById('file-name');

    // ===== УДАЛЕНИЕ ОШИБОК ПРИ ВВОДЕ =====

    function clearError(inputId) {

        const field = document.getElementById(inputId);

        const group = field.closest('.form-group');

        const error = group.querySelector('.error-message');

        if (error) {
            error.textContent = '';
        }

        field.classList.remove('input-error');
    }

    // Название
    title.addEventListener('input', () => {
        clearError('title');
    });

    // Дата
    releaseDate.addEventListener('input', () => {
        clearError('release_date');
    });

    // Описание
    description.addEventListener('input', () => {
        clearError('description');
    });

    // Рейтинг
    rating.addEventListener('change', () => {
        clearError('rating');
    });

    // ===== ФАЙЛ =====

    input.addEventListener('change', () => {

        if (input.files.length > 0) {

            fileName.textContent = input.files[0].name;

            fileError.textContent = '';

            uploadBtn.classList.remove('file-error-state');

        }
        else {

            fileName.textContent = 'Файл не загружен';

        }

    });

    // ===== SUBMIT =====

    form.addEventListener('submit', (e) => {

        if (input.files.length === 0) {

            e.preventDefault();

            fileError.textContent = 'Загрузите изображение обложки';

            uploadBtn.classList.add('file-error-state');

        }

    });

});

</script>