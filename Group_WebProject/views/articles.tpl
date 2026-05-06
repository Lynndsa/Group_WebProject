% rebase('layout.tpl', title=title, year=year)

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }}</title>
    <link rel="stylesheet" href="/static/content/style.css">
</head>
<body>
    <div class="book-header">
        <h1 class="book-title">Статьи</h1>
        <p class="book-original-title">Поделитесь знаниями</p>
    </div>

    <div class="articles-page">
        <section class="add-article-section">
            <h2>Добавить статью</h2>
            
            % if errors:
            <div class="validation-summary-errors">
                Пожалуйста, исправьте ошибки в форме.
            </div>
            % end
            
            <form action="/articles" method="POST" class="article-form" accept-charset="UTF-8">
                <div class="form-group">
                    <label for="author">Автор (Имя / Ник):</label>
                    <input type="text" id="author" name="author" 
                           value="{{ form_data.get('author', '') }}"
                           placeholder="Введите ваше имя или ник"
                           class="{{ 'error input-validation-error' if errors.get('author') else '' }}">
                    % if errors.get('author'):
                    <span class="error-message field-validation-error">{{ errors['author'] }}</span>
                    % end
                </div>

                <div class="form-group">
                    <label for="title">Наименование статьи:</label>
                    <input type="text" id="title" name="title" 
                           value="{{ form_data.get('title', '') }}"
                           placeholder="Введите название статьи"
                           class="{{ 'error input-validation-error' if errors.get('title') else '' }}">
                    % if errors.get('title'):
                    <span class="error-message field-validation-error">{{ errors['title'] }}</span>
                    % end
                </div>

                <div class="form-group">
                    <label for="description">Текст (Описание):</label>
                    <textarea id="description" name="description" rows="6"
                              placeholder="Введите описание или текст статьи"
                              class="{{ 'error input-validation-error' if errors.get('description') else '' }}">{{ form_data.get('description', '') }}</textarea>
                    % if errors.get('description'):
                    <span class="error-message field-validation-error">{{ errors['description'] }}</span>
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

                <button type="submit" class="submit-btn">Разместить статью</button>
            </form>
        </section>

        <section class="articles-list-section">
            <h2>Последние статьи</h2>
            % if articles:
            <div class="articles-grid">
                % for article in articles:
                <article class="article-card">
                    <div class="article-header">
                        <h3>{{ article['title'] }}</h3>
                        <span class="article-date">{{ article['date'] }}</span>
                    </div>
                    <p class="article-description">{{ article['description'] }}</p>
                    <div class="article-footer">
                        <span class="article-author">
                            <strong>Автор:</strong> {{ article['author'] }}
                        </span>
                        <span class="article-phone">
                            <strong>📞</strong> {{ article['phone'] }}
                        </span>
                    </div>
                </article>
                % end
            </div>
            % else:
            <div class="empty-state">
                <div class="empty-icon">📚</div>
                <p>Пока нет ни одной статьи. Будьте первым, кто поделится знаниями!</p>
            </div>
            % end
        </section>
    </div>

    <footer class="footer">
        <p>&copy; {{ year }} Полезные статьи. Все права защищены.</p>
    </footer>
</body>
</html>