% rebase('layout.tpl', title=title, year=year)

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }}</title>
    <!-- стили -->
    <link rel="stylesheet" href="/static/style.css">
    <link rel="stylesheet" href="/static/content/reviews.css">
</head>
<body>
    <!-- шапка  -->
    <div class="book-header">
        <h1 class="book-title">Отзывы о книгах</h1>
        <p class="book-original-title">База оценок и мнений</p>
    </div>

    <div class="reviews-layout">
        
        <!-- форма добавления -->
        <section class="add-article-section form-column">
            <h2>Добавить отзыв</h2>
            
            <!-- если список ошибок не пуст, показывается -->
            % if errors:
            <div class="validation-summary-errors">
                Пожалуйста, исправьте ошибки в форме.
            </div>
            % end
            
            <form action="/reviews" method="POST" class="article-form">
                
                <!-- название книги -->
                <div class="form-group">
                    <label for="book_title">Название книги:</label>
                    <!-- сохраняет введённое при ошибке, класс добавляется динамически -->
                    <input type="text" id="book_title" name="book_title" 
                           value="{{ form_data.get('book_title', '') }}"
                           placeholder="Например: Оно"
                           class="{{ 'error input-validation-error' if errors.get('book_title') else '' }}">
                    % if errors.get('book_title'):
                    <span class="error-message field-validation-error">{{ errors['book_title'] }}</span>
                    % end
                </div>

                <!-- оценка -->
                <div class="form-group">
                    <label for="rating">Оценка книги (0-10):</label>
                    <input type="number" id="rating" name="rating" min="0" max="10" step="1"
                           value="{{ form_data.get('rating', '') }}" placeholder="8"
                           class="{{ 'error input-validation-error' if errors.get('rating') else '' }}">
                    % if errors.get('rating'):
                    <span class="error-message field-validation-error">{{ errors['rating'] }}</span>
                    % end
                </div>

                <!-- автор -->
                <div class="form-group">
                    <label for="author">Автор (Имя / Ник):</label>
                    <input type="text" id="author" name="author" 
                           value="{{ form_data.get('author', '') }}" placeholder="Ваш ник"
                           class="{{ 'error input-validation-error' if errors.get('author') else '' }}">
                    % if errors.get('author'):
                    <span class="error-message field-validation-error">{{ errors['author'] }}</span>
                    % end
                </div>

                <!-- текст отзыва -->
                <div class="form-group">
                    <label for="review_text">Текст отзыва:</label>
                    <textarea id="review_text" name="review_text" rows="5"
                              placeholder="Ваши впечатления..."
                              class="{{ 'error input-validation-error' if errors.get('review_text') else '' }}">{{ form_data.get('review_text', '') }}</textarea>
                    % if errors.get('review_text'):
                    <span class="error-message field-validation-error">{{ errors['review_text'] }}</span>
                    % end
                </div>

                <!-- телефон -->
                <div class="form-group">
                    <label for="phone">Телефон:</label>
                    <input type="tel" id="phone" name="phone" 
                           value="{{ form_data.get('phone', '') }}" placeholder="+7..."
                           class="{{ 'error input-validation-error' if errors.get('phone') else '' }}">
                    % if errors.get('phone'):
                    <span class="error-message field-validation-error">{{ errors['phone'] }}</span>
                    % end
                </div>

                <button type="submit" class="submit-btn">Опубликовать</button>
            </form>
        </section>

        <!-- ФИЛЬТРЫ + СПИСОК -->
        <section class="display-column">
            <h2>Все отзывы</h2>
            
            <!-- Панель фильтрации -->
            <div class="filters-bar">
                <!-- Список книг формируется динамически из всех сохранённых отзывов -->
                <select id="filter-title">
                    <option value="">Все книги</option>
                    % for book in books_list:
                    <option value="{{ book }}">{{ book }}</option>
                    % end
                </select>
                
                <select id="filter-rating">
                    <option value="">Все оценки</option>
                    <option value="10">10 баллов</option>
                    <option value="9">9 баллов</option>
                    <option value="8">8 баллов</option>
                    <option value="7">7 баллов</option>
                    <option value="6">6 баллов</option>
                    <option value="5">5 и ниже</option>
                </select>
                
                <button type="button" id="apply-filters" class="submit-btn" style="padding: 12px 24px; font-size: 0.9em;">Применить</button>
            </div>

            <!-- Сетка отзывов -->
            <div class="reviews-grid-large">
                <!-- Вложенный цикл: сначала пользователи, внутри каждого — его отзывы -->
                % for user in users:
                  % for review in user['reviews']:
                <article class="review-card-large" 
                         data-book="{{ review['book_title'] }}" 
                         data-rating="{{ review.get('rating', '') }}">
                    <span class="card-rating-badge">{{ review.get('rating', '—') }}/10</span>
                    
                    <div class="card-header">
                        <h3>{{ review['book_title'] }}</h3>
                        <span class="card-date">{{ review['date'] }}</span>
                    </div>
                    
                    <p class="card-text">{{ review['review_text'] }}</p>
                    
                    <div class="card-footer">
                        <span class="card-author"> {{ review['author'] }}</span>
                        % if review.get('phone'):
                        <span class="article-phone"> {{ review['phone'] }}</span>
                        % end
                    </div>
                </article>
                  % end
                % end
                
                <!-- Заглушка: показывается, если база отзывов пуста -->
                % if not users:
                <div style="grid-column: 1/-1; text-align: center; padding: 60px; color: #666; border: 2px dashed #333; border-radius: 8px;">
                    <div style="font-size: 3em; margin-bottom: 10px;"></div>
                    <p>Отзывов пока нет. Будьте первым!</p>
                </div>
                % end
                
                <!-- Сообщение "не найдено": скрыто по умолчанию, показывается JS после фильтрации -->
                <div id="no-reviews-msg" style="display:none; grid-column: 1/-1; text-align: center; padding: 60px; color: #666; border: 2px dashed #333; border-radius: 8px;">
                    <div style="font-size: 3em; margin-bottom: 10px;">🔍</div>
                    <p>По выбранным фильтрам отзывов не найдено.</p>
                </div>
            </div>
        </section>
    </div>

    <footer class="footer">
        <p>&copy; {{ year }} Отзывы о книгах. Все права защищены.</p>
    </footer>

    <!-- Клиентский скрипт фильтрации (reviews.js) -->
    <script src="/static/scripts/reviews.js"></script>

</body>
</html>