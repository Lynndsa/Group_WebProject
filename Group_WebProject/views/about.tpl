% rebase('layout.tpl', title=title, year=year)

<!-- Заголовок книги -->
<div class="book-header">
    <h1 class="book-title">ОНО</h1>
    <p class="book-original-title">It</p>
</div>

<!-- Основной контент: обложка и описание -->
<div class="book-main-content">
    
    <!-- Обложка книги слева -->
    <div class="book-cover-section">
        <img src="/static/images/it_cover.jpg" alt="Обложка книги Оно" class="book-cover-large">
        <div class="book-meta-info">
            <p><strong>Год издания:</strong> 1986</p>
            <p><strong>Страниц:</strong> 1138</p>
            <p><strong>Жанр:</strong> Ужасы, Мистика</p>
            <p><strong>Издательство:</strong> Viking Press</p>
        </div>
    </div>

    <!-- Аннотация справа -->
    <div class="book-annotation-section">
        <h2>Аннотация</h2>
        <p>«Оно» — один из самых известных и масштабных романов Стивена Кинга, опубликованный в 1986 году. Это история о семи изгоях, которые в детстве столкнулись с древним злом, обитающим в канализации их маленького городка Дерри, штат Мэн.</p>
        
        <p>Зло принимает форму клоуна по имени Пеннивайз, который появляется каждые 27 лет, чтобы охотиться на детей. Роман исследует темы детства, дружбы, травмы и способности памяти искажать прошлое.</p>
        
        <p>Книга разделена на две временные линии: 1958 год, когда герои были детьми, и 1985 год, когда они возвращаются в Дерри как взрослые, чтобы сдержать обещание, данное друг другу много лет назад.</p>
        
        <h3>Основные темы</h3>
        <ul class="book-themes">
            <li>Детство и взросление</li>
            <li>Дружба и преданность</li>
            <li>Память и травма</li>
            <li>Добро против зла</li>
            <li>Маленький город и его секреты</li>
        </ul>
    </div>
</div>

<!-- Экранизации -->
<h2 class="section-title">Экранизации</h2>

<div class="movies-section">
    
    <!-- Фильм 1990 года -->
    <div class="movie-card">
        <div class="movie-header">
            <h3 class="movie-title">Оно</h3>
            <span class="movie-year">1990</span>
        </div>
        <div class="movie-details">
            <p><strong>Студия:</strong> Green/Epitaph Pictures</p>
            <p><strong>Режиссёр:</strong> Томми Ли Уоллес</p>
            <p><strong>В главной роли:</strong> Тим Карри (Пеннивайз)</p>
            <p class="movie-description">Двухсерийный телевизионный фильм. Несмотря на ограниченный бюджет 1990-х, Тим Карри создал запоминающийся образ клоуна, который стал культовым.</p>
        </div>
    </div>

    <!-- Фильм 2017 года -->
    <div class="movie-card">
        <div class="movie-header">
            <h3 class="movie-title">Оно</h3>
            <span class="movie-year">2017</span>
        </div>
        <div class="movie-details">
            <p><strong>Студия:</strong> New Line Cinema, Lin Pictures</p>
            <p><strong>Режиссёр:</strong> Андрес Мускетти</p>
            <p><strong>В главной роли:</strong> Билл Скарсгард (Пеннивайз)</p>
            <p class="movie-description">Первая часть дилогии, охватывающая события 1989 года (детство героев). Фильм стал кассовым хитом и получил положительные отзывы критиков.</p>
        </div>
    </div>

    <!-- Фильм 2019 года -->
    <div class="movie-card">
        <div class="movie-header">
            <h3 class="movie-title">Оно 2</h3>
            <span class="movie-year">2019</span>
        </div>
        <div class="movie-details">
            <p><strong>Студия:</strong> New Line Cinema, Lin Pictures</p>
            <p><strong>Режиссёр:</strong> Андрес Мускетти</p>
            <p><strong>В главных ролях:</strong> Джессика Честейн, Джеймс МакЭвой, Билл Хейдер</p>
            <p class="movie-description">Вторая часть, показывающая взрослых героев, вернувшихся в Дерри спустя 27 лет, чтобы уничтожить Пеннивайза раз и навсегда.</p>
        </div>
    </div>

</div>

<!-- Галерея кадров из экранизаций -->
<h2 class="gallery-title">Кадры из экранизаций</h2>

<div class="photo-gallery">
    
    <!-- Кадры 1990 года -->
    <div class="gallery-section">
        <h3>Оно (1990)</h3>
        <div class="gallery-row">
            <div class="gallery-item">
                <img src="/static/images/it1990_pennywise.jpg" alt="Тим Карри в роли Пеннивайза" onclick="openModal(this)">
                <p class="photo-caption">Тим Карри в образе Пеннивайза</p>
            </div>
            <div class="gallery-item">
                <img src="/static/images/it1990_losers.jpg" alt="Клуб неудачников 1990" onclick="openModal(this)">
                <p class="photo-caption">Клуб неудачников</p>
            </div>
            <div class="gallery-item">
                <img src="/static/images/it1990_sewer.jpg" alt="Сцена в канализации" onclick="openModal(this)">
                <p class="photo-caption">Сцена в канализации</p>
            </div>
            <div class="gallery-item">
                <img src="/static/images/it1990_beverly.jpg" alt="Беверли" onclick="openModal(this)">
                <p class="photo-caption">Беверли Марш</p>
            </div>
        </div>
    </div>
    
    <!-- Кадры 2017 года -->
    <div class="gallery-section">
        <h3>Оно (2017)</h3>
        <div class="gallery-row">
            <div class="gallery-item">
                <img src="/static/images/it2017_pennywise.jpg" alt="Билл Скарсгард в роли Пеннивайза" onclick="openModal(this)">
                <p class="photo-caption">Билл Скарсгард — Пеннивайз</p>
            </div>
            <div class="gallery-item">
                <img src="/static/images/it2017_losers.jpg" alt="Клуб неудачников 2017" onclick="openModal(this)">
                <p class="photo-caption">Новое поколение Клуба неудачников</p>
            </div>
            <div class="gallery-item">
                <img src="/static/images/it2017_projector.jpg" alt="Сцена с проектором" onclick="openModal(this)">
                <p class="photo-caption">Знаменитая сцена с проектором</p>
            </div>
            <div class="gallery-item">
                <img src="/static/images/it2017_bathroom.jpg" alt="Сцена в ванной" onclick="openModal(this)">
                <p class="photo-caption">Беверли в ванной комнате</p>
            </div>
        </div>
    </div>
    
    <!-- Кадры 2019 года -->
    <div class="gallery-section">
        <h3>Оно 2 (2019)</h3>
        <div class="gallery-row">
            <div class="gallery-item">
                <img src="/static/images/it2019_adults.jpg" alt="Взрослые герои" onclick="openModal(this)">
                <p class="photo-caption">Взрослые члены Клуба неудачников</p>
            </div>
            <div class="gallery-item">
                <img src="/static/images/it2019_pennywise2.jpg" alt="Пеннивайз в Оно 2" onclick="openModal(this)">
                <p class="photo-caption">Пеннивайз возвращается</p>
            </div>
            <div class="gallery-item">
                <img src="/static/images/it2019_fight.jpg" alt="Финальная битва" onclick="openModal(this)">
                <p class="photo-caption">Финальная битва с Оно</p>
            </div>
            <div class="gallery-item">
                <img src="/static/images/it2019_ending.jpg" alt="Финал" onclick="openModal(this)">
                <p class="photo-caption">Завершение истории</p>
            </div>
        </div>
    </div>

</div>

<!-- Модальное окно для увеличения фото -->
<div id="modal" class="modal" onclick="closeModal()">
    <span class="close">&times;</span>
    <img class="modal-content" id="modal-img">
    <div id="caption" class="modal-caption"></div>
</div>

<!-- Стили -->
<style>
/* Основные стили страницы */
body {
    background-color: #0a0a0a;
    color: #e0e0e0;
    font-family: 'Georgia', serif;
    margin: 0;
    padding: 0;
}

/* Заголовок книги */
.book-header {
    text-align: center;
    margin: 60px 0 40px;
    padding: 40px 20px;
    background: linear-gradient(135deg, #1a1a1a 0%, #0f0f0f 100%);
    border-top: 3px solid #c41e3a;
    border-bottom: 3px solid #c41e3a;
}

.book-title {
    font-size: 4.5em;
    margin: 0;
    color: #c41e3a;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.8);
    letter-spacing: 15px;
    font-weight: bold;
    text-transform: uppercase;
}

.book-original-title {
    font-size: 2em;
    margin: 15px 0 0;
    color: #888;
    font-style: italic;
    letter-spacing: 8px;
}

/* Основной контент */
.book-main-content {
    display: flex;
    gap: 50px;
    max-width: 1200px;
    margin: 50px auto;
    padding: 0 30px;
}

.book-cover-section {
    flex: 0 0 350px;
}

.book-cover-large {
    width: 100%;
    max-width: 350px;
    height: auto;
    border-radius: 5px;
    box-shadow: 0 10px 40px rgba(196, 30, 58, 0.2);
    margin-bottom: 25px;
    border: 2px solid #222;
}

.book-meta-info {
    background: #1a1a1a;
    padding: 25px;
    border-radius: 5px;
    border-left: 4px solid #c41e3a;
}

.book-meta-info p {
    margin: 15px 0;
    color: #bbb;
    font-size: 0.95em;
    line-height: 1.6;
}

.book-meta-info strong {
    color: #c41e3a;
}

.book-annotation-section {
    flex: 1;
    background: #111;
    padding: 40px;
    border-radius: 5px;
    border: 1px solid #222;
}

.book-annotation-section h2 {
    color: #c41e3a;
    margin-top: 0;
    border-bottom: 2px solid #c41e3a;
    padding-bottom: 15px;
    font-size: 2em;
    letter-spacing: 3px;
}

.book-annotation-section p {
    line-height: 1.9;
    color: #ccc;
    margin-bottom: 25px;
    text-align: justify;
    font-size: 1.05em;
}

.book-annotation-section h3 {
    color: #c41e3a;
    margin-top: 35px;
    font-size: 1.5em;
    letter-spacing: 2px;
}

.book-themes {
    list-style: none;
    padding: 0;
}

.book-themes li {
    padding: 10px 0;
    padding-left: 30px;
    position: relative;
    color: #aaa;
    font-size: 1.05em;
}

.book-themes li:before {
    content: "—";
    color: #c41e3a;
    font-weight: bold;
    position: absolute;
    left: 10px;
}

/* Секция фильмов */
.section-title {
    text-align: center;
    color: #c41e3a;
    font-size: 2.8em;
    margin: 80px 0 50px;
    position: relative;
    letter-spacing: 5px;
    text-transform: uppercase;
}

.section-title:after {
    content: "";
    display: block;
    width: 200px;
    height: 3px;
    background: linear-gradient(90deg, transparent, #c41e3a, transparent);
    margin: 20px auto 0;
}

.movies-section {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 30px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 35px;
}

.movie-card {
    background: #111;
    border-radius: 5px;
    overflow: hidden;
    border: 1px solid #222;
    transition: all 0.3s ease;
}

.movie-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 40px rgba(196, 30, 58, 0.3);
    border-color: #c41e3a;
}

.movie-header {
    background: linear-gradient(135deg, #1a1a1a 0%, #0f0f0f 100%);
    color: white;
    padding: 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 2px solid #c41e3a;
}

.movie-title {
    margin: 0;
    font-size: 2em;
    color: #c41e3a;
    letter-spacing: 3px;
}

.movie-year {
    font-size: 1.6em;
    font-weight: bold;
    color: #fff;
    background: #c41e3a;
    padding: 8px 20px;
    border-radius: 3px;
    letter-spacing: 2px;
}

.movie-details {
    padding: 25px;
}

.movie-details p {
    margin: 12px 0;
    color: #bbb;
    line-height: 1.7;
    font-size: 0.95em;
}

.movie-details strong {
    color: #c41e3a;
}

.movie-description {
    margin-top: 20px;
    padding-top: 20px;
    border-top: 1px solid #333;
    font-style: italic;
    color: #999;
    line-height: 1.8;
}

/* Галерея */
.gallery-title {
    text-align: center;
    color: #c41e3a;
    font-size: 2.5em;
    margin: 80px 0 40px;
    position: relative;
    letter-spacing: 5px;
    text-transform: uppercase;
}

.gallery-title:after {
    content: "";
    display: block;
    width: 150px;
    height: 3px;
    background: #c41e3a;
    margin: 20px auto 0;
}

.photo-gallery {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px 30px;
}

.gallery-section {
    margin-bottom: 60px;
}

.gallery-section h3 {
    color: #c41e3a;
    font-size: 1.8em;
    margin-bottom: 25px;
    padding-left: 15px;
    border-left: 4px solid #c41e3a;
    letter-spacing: 2px;
}

.gallery-row {
    display: flex;
    flex-wrap: wrap;
    gap: 25px;
    justify-content: center;
}

.gallery-item {
    flex: 0 1 calc(25% - 25px);
    min-width: 220px;
    background: #111;
    border-radius: 5px;
    overflow: hidden;
    border: 1px solid #222;
    transition: all 0.3s ease;
    cursor: pointer;
}

.gallery-item:hover {
    transform: translateY(-8px) scale(1.02);
    box-shadow: 0 12px 35px rgba(196, 30, 58, 0.4);
    border-color: #c41e3a;
}

.gallery-item img {
    width: 100%;
    height: 220px;
    object-fit: cover;
    display: block;
    transition: transform 0.3s ease;
}

.gallery-item:hover img {
    transform: scale(1.05);
}

.photo-caption {
    padding: 15px;
    margin: 0;
    text-align: center;
    font-size: 0.9em;
    color: #999;
    background: #1a1a1a;
    border-top: 1px solid #222;
}

/* Модальное окно */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.95);
    overflow: auto;
}

.modal-content {
    margin: auto;
    display: block;
    max-width: 90%;
    max-height: 80%;
    margin-top: 50px;
    border: 3px solid #c41e3a;
    border-radius: 5px;
}

.modal-caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #c41e3a;
    padding: 20px 0;
    font-size: 1.2em;
    letter-spacing: 2px;
}

.close {
    position: absolute;
    top: 20px;
    right: 40px;
    color: #c41e3a;
    font-size: 50px;
    font-weight: bold;
    cursor: pointer;
    transition: color 0.3s;
}

.close:hover {
    color: #ff3355;
}

/* Адаптивность */
@media (max-width: 968px) {
    .book-main-content {
        flex-direction: column;
    }
    
    .book-cover-section {
        flex: none;
        text-align: center;
    }
    
    .movies-section {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 768px) {
    .book-title {
        font-size: 3em;
        letter-spacing: 8px;
    }
    
    .gallery-item {
        flex: 0 1 calc(50% - 25px);
    }
    
    .section-title,
    .gallery-title {
        font-size: 2em;
    }
}

@media (max-width: 480px) {
    .book-title {
        font-size: 2.2em;
        letter-spacing: 5px;
    }
    
    .gallery-item {
        flex: 0 1 100%;
    }
    
    .movie-header {
        flex-direction: column;
        text-align: center;
        gap: 15px;
    }
    
    .book-annotation-section {
        padding: 25px;
    }
}
</style>

<script src="/static/scripts/modal.js"></script>