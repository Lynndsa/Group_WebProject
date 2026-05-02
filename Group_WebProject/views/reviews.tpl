% rebase('layout.tpl', title=title, year=year)

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }}</title>
    <link rel="stylesheet" href="/static/style.css">
</head>
<body>
    <div class="book-header">
        <h1 class="book-title">Отзывы о книгах</h1>
        <p class="book-original-title">Поделитесь своим мнением</p>
    </div>

    <div class="articles-page">
        <section class="add-article-section">
            <h2>Оставить отзыв</h2>
            
            % if errors:
            <div class="validation-summary-errors">
                Пожалуйста, исправьте ошибки в форме.
            </div>
            % end
            
            % if success_message:
            <div class="success-message">
                {{ success_message }}
            </div>
            % end
            
            <form action="/reviews" method="POST" class="article-form" accept-charset="UTF-8">
                <div class="form-group">
                    <label for="author">Автор отзыва (Имя / Ник):</label>
                    <input type="text" id="author" name="author" 
                           value="{{ form_data.get('author', '') }}"
                           placeholder="Введите ваше имя или ник"
                           class="{{ 'error input-validation-error' if errors.get('author') else '' }}">
                    % if errors.get('author'):
                    <span class="error-message field-validation-error">{{ errors['author'] }}</span>
                    % end
                </div>

                <div class="form-group">
                    <label for="book_title">Наименование книги:</label>
                    <input type="text" id="book_title" name="book_title" 
                           value="{{ form_data.get('book_title', '') }}"
                           placeholder="Введите название книги"
                           class="{{ 'error input-validation-error' if errors.get('book_title') else '' }}">
                    % if errors.get('book_title'):
                    <span class="error-message field-validation-error">{{ errors['book_title'] }}</span>
                    % end
                </div>

                <div class="form-group">
                    <label for="review_text">Текст отзыва:</label>
                    <textarea id="review_text" name="review_text" rows="6"
                              placeholder="Расскажите о ваших впечатлениях от книги"
                              class="{{ 'error input-validation-error' if errors.get('review_text') else '' }}">{{ form_data.get('review_text', '') }}</textarea>
                    % if errors.get('review_text'):
                    <span class="error-message field-validation-error">{{ errors['review_text'] }}</span>
                    % end
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="date">Дата:</label>
                        <input type="date" id="date" name="date" 
                               value="{{ form_data.get('date', '') }}"
                               class="{{ 'error input-validation-error' if errors.get('date') else '' }}">
                        % if errors.get('date'):
                        <span class="error-message field-validation-error">{{ errors['date'] }}</span>
                        % end
                    </div>

                    <div class="form-group">
                        <label for="phone">Телефон:</label>
                        <input type="tel" id="phone" name="phone" 
                               value="{{ form_data.get('phone', '') }}"
                               placeholder="+7 (XXX) XXX-XX-XX"
                               class="{{ 'error input-validation-error' if errors.get('phone') else '' }}">
                        % if errors.get('phone'):
                        <span class="error-message field-validation-error">{{ errors['phone'] }}</span>
                        % end
                    </div>
                </div>

                <button type="submit" class="submit-btn">Разместить отзыв</button>
            </form>
        </section>

        <section class="articles-list-section">
            <h2>Последние отзывы</h2>
            % if reviews:
            <div class="articles-grid">
                % for review in reviews:
                <article class="article-card">
                    <div class="article-header">
                        <h3>{{ review['book_title'] }}</h3>
                        <span class="article-date">{{ review['date'] }}</span>
                    </div>
                    <p class="article-description">{{ review['review_text'] }}</p>
                    <div class="article-footer">
                        <span class="article-author">
                            <strong>Автор:</strong> {{ review['author'] }}
                        </span>
                        % if review.get('phone'):
                        <span class="article-phone">
                            <strong>📞</strong> {{ review['phone'] }}
                        </span>
                        % end
                    </div>
                </article>
                % end
            </div>
            % else:
            <div class="empty-state">
                <div class="empty-icon">📖</div>
                <p>Пока нет ни одного отзыва. Будьте первым, кто поделится мнением!</p>
            </div>
            % end
        </section>
    </div>

    <footer class="footer">
        <p>&copy; {{ year }} Отзывы о книгах. Все права защищены.</p>
    </footer>
</body>
</html>