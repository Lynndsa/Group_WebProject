% rebase('layout.tpl', title='Новинки Кинга', year=year)

<div class="admin-container">
    
    <!-- ЛЕВАЯ КОЛОНКА: Форма добавления -->
    <div class="form-section">
        <h2 class="section-title-small">Добавить новинку</h2>
        
        <form action="/add_book" method="POST" enctype="multipart/form-data" class="book-form">
            
            <div class="form-group">
                <label for="title">Название книги</label>
                <input type="text" id="title" name="title" placeholder="Например: Оно" required>
            </div>
            
            <div class="form-group">
                <label for="release_date">Дата выхода</label>
                <input type="date" id="release_date" name="release_date" required>
            </div>
            
            <div class="form-group">
                <label for="description">Предисловие</label>
                <textarea id="description" name="description" rows="5" placeholder="О чем эта книга?" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="cover">Фото обложки</label>
                <input type="file" id="cover" name="cover" accept="image/*" required>
            </div>
            
            <div class="form-group">
                <label for="rating">Возрастной рейтинг</label>
                <select id="rating" name="rating" required>
                    <option value="0+">0+</option>
                    <option value="6+">6+</option>
                    <option value="12+">12+</option>
                    <option value="16+">16+</option>
                    <option value="18+" selected>18+</option>
                </select>
            </div>
            
            <button type="submit" class="submit-btn">Разместить</button>
        </form>
    </div>
    
    <!-- ПРАВАЯ КОЛОНКА: Список книг -->
    <div class="books-section">
        <h2 class="section-title-small">Актуальные новинки</h2>
        <p>{{len(books)}}</p>
        
        <div class="books-grid">
            % for book in books:
            <div class="book-card-new">
                <div class="book-cover-wrapper">
                    <img src="{{ book['cover'] }}" alt="{{ book['title'] }}" class="book-cover-new">
                    <span class="age-rating">{{ book['rating'] }}</span>
                </div>
                <div class="book-info-new">
                    <h3 class="book-title-new">{{ book['title'] }}</h3>
                    <p class="book-date-new">{{ book['release_date'] }}</p>
                    <p class="book-desc-new">{{ book['description'] }}</p>
                </div>
            </div>
            % end
        </div>
    </div>
    
</div>