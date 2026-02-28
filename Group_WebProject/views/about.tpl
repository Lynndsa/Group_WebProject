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
    /* Заголовок книги */
    .book-header {
        text-align: center;
        margin: 40px 0;
        padding: 30px;
        background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
        border-radius: 10px;
        color: white;
    }
    
    .book-title {
        font-size: 4em;
        margin: 0;
        color: #ff0000;
        text-shadow: 3px 3px 6px rgba(0,0,0,0.5);
        letter-spacing: 10px;
    }
    
    .book-original-title {
        font-size: 2em;
        margin: 10px 0 0;
        color: #ccc;
        font-style: italic;
    }
    
    /* Основной контент */
    .book-main-content {
        display: flex;
        gap: 40px;
        max-width: 1200px;
        margin: 40px auto;
        padding: 0 20px;
    }
    
    .book-cover-section {
        flex: 0 0 350px;
    }
    
    .book-cover-large {
        width: 100%;
        max-width: 350px;
        height: auto;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        margin-bottom: 20px;
    }
    
    .book-meta-info {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 10px;
        border-left: 4px solid #007bff;
    }
    
    .book-meta-info p {
        margin: 10px 0;
        color: #333;
    }
    
    .book-annotation-section {
        flex: 1;
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    
    .book-annotation-section h2 {
        color: #007bff;
        margin-top: 0;
        border-bottom: 2px solid #007bff;
        padding-bottom: 10px;
    }
    
    .book-annotation-section p {
        line-height: 1.8;
        color: #333;
        margin-bottom: 20px;
        text-align: justify;
    }
    
    .book-annotation-section h3 {
        color: #007bff;
        margin-top: 30px;
    }
    
    .book-themes {
        list-style: none;
        padding: 0;
    }
    
    .book-themes li {
        padding: 8px 0;
        padding-left: 25px;
        position: relative;
        color: #555;
    }
    
    .book-themes li:before {
        content: "•";
        color: #007bff;
        font-weight: bold;
        position: absolute;
        left: 10px;
    }
    
    /* Секция фильмов */
    .section-title {
        text-align: center;
        color: #333;
        font-size: 2.5em;
        margin: 60px 0 40px;
        position: relative;
    }
    
    .section-title:after {
        content: "";
        display: block;
        width: 150px;
        height: 4px;
        background: linear-gradient(90deg, #007bff, #ff0000);
        margin: 15px auto 0;
    }
    
    .movies-section {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
        gap: 30px;
    }
    
    .movie-card {
        background: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        transition: transform 0.3s, box-shadow 0.3s;
    }
    
    .movie-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    }
    
    .movie-header {
        background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
        color: white;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    
    .movie-title {
        margin: 0;
        font-size: 1.8em;
        color: #ff0000;
    }
    
    .movie-year {
        font-size: 1.5em;
        font-weight: bold;
        color: #fff;
        background: #ff0000;
        padding: 5px 15px;
        border-radius: 5px;
    }
    
    .movie-details {
        padding: 20px;
    }
    
    .movie-details p {
        margin: 10px 0;
        color: #333;
        line-height: 1.6;
    }
    
    .movie-description {
        margin-top: 15px;
        padding-top: 15px;
        border-top: 1px solid #ddd;
        font-style: italic;
        color: #666;
    }
    
    /* Галерея */
    .gallery-title {
        text-align: center;
        color: #333;
        font-size: 2em;
        margin: 60px 0 30px;
        position: relative;
    }
    
    .gallery-title:after {
        content: "";
        display: block;
        width: 100px;
        height: 3px;
        background: #007bff;
        margin: 15px auto 0;
    }
    
    .photo-gallery {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    
    .gallery-section {
        margin-bottom: 50px;
    }
    
    .gallery-section h3 {
        color: #555;
        font-size: 1.5em;
        margin-bottom: 20px;
        padding-left: 10px;
        border-left: 4px solid #007bff;
    }
    
    .gallery-row {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
    }
    
    .gallery-item {
        flex: 0 1 calc(25% - 20px);
        min-width: 200px;
        background: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        transition: transform 0.3s, box-shadow 0.3s;
        cursor: pointer;
    }
    
    .gallery-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    }
    
    .gallery-item img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        display: block;
    }
    
    .photo-caption {
        padding: 10px;
        margin: 0;
        text-align: center;
        font-size: 0.9em;
        color: #555;
        background: #f8f9fa;
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
        background-color: rgba(0,0,0,0.9);
        overflow: auto;
    }
    
    .modal-content {
        margin: auto;
        display: block;
        max-width: 90%;
        max-height: 80%;
        margin-top: 50px;
    }
    
    .modal-caption {
        margin: auto;
        display: block;
        width: 80%;
        max-width: 700px;
        text-align: center;
        color: #ccc;
        padding: 10px 0;
    }
    
    .close {
        position: absolute;
        top: 15px;
        right: 35px;
        color: #f1f1f1;
        font-size: 40px;
        font-weight: bold;
        cursor: pointer;
    }
    
    .close:hover {
        color: #bbb;
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
        }
        
        .gallery-item {
            flex: 0 1 calc(50% - 20px);
        }
    }
    
    @media (max-width: 480px) {
        .book-title {
            font-size: 2.5em;
        }
        
        .gallery-item {
            flex: 0 1 100%;
        }
        
        .movie-header {
            flex-direction: column;
            text-align: center;
            gap: 10px;
        }
    }
</style>

<script src="/static/scripts/modal.js"></script>