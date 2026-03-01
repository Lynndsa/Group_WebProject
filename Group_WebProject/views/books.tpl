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
/* ===== ОБЩИЕ СТИЛИ ===== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background: #000;
    color: #e0e0e0;
    font-family: 'Georgia', 'Times New Roman', serif;
    line-height: 1.6;
    overflow-x: hidden;
}

/* ===== ЗАГОЛОВОК КНИГИ ===== */
.book-header {
    position: relative;
    text-align: center;
    padding: 80px 20px 60px;
    background: linear-gradient(180deg, #0a0a0a 0%, #000 100%);
    border-bottom: 2px solid #8b0000;
}

.book-header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 200px;
    height: 3px;
    background: linear-gradient(90deg, transparent, #c41e3a, transparent);
}

.book-title {
    font-size: 6em;
    font-weight: 900;
    color: #fff;
    text-transform: uppercase;
    letter-spacing: 20px;
    margin: 0;
    text-shadow: 
        0 0 10px rgba(196, 30, 58, 0.8),
        0 0 20px rgba(196, 30, 58, 0.5),
        0 0 30px rgba(196, 30, 58, 0.3);
    animation: glow 3s ease-in-out infinite alternate;
    position: relative;
    z-index: 1;
}

@keyframes glow {
    from {
        text-shadow: 
            0 0 10px rgba(196, 30, 58, 0.8),
            0 0 20px rgba(196, 30, 58, 0.5),
            0 0 30px rgba(196, 30, 58, 0.3);
    }
    to {
        text-shadow: 
            0 0 20px rgba(196, 30, 58, 1),
            0 0 30px rgba(196, 30, 58, 0.8),
            0 0 40px rgba(196, 30, 58, 0.6);
    }
}

.book-original-title {
    font-size: 2.5em;
    color: #8b0000;
    font-style: italic;
    letter-spacing: 15px;
    margin-top: 20px;
    opacity: 0.9;
}

/* ===== ОСНОВНОЙ КОНТЕНТ ===== */
.book-main-content {
    display: flex;
    gap: 60px;
    max-width: 1400px;
    margin: 60px auto;
    padding: 0 40px;
}

.book-cover-section {
    flex: 0 0 400px;
    position: sticky;
    top: 40px;
    height: fit-content;
}

.book-cover-large {
    width: 100%;
    height: auto;
    border-radius: 3px;
    box-shadow: 
        0 20px 60px rgba(196, 30, 58, 0.4),
        0 0 0 1px rgba(196, 30, 58, 0.3);
    margin-bottom: 30px;
    transition: all 0.4s ease;
    border: 2px solid #1a1a1a;
}

.book-cover-large:hover {
    box-shadow: 
        0 25px 70px rgba(196, 30, 58, 0.6),
        0 0 0 2px rgba(196, 30, 58, 0.5);
    transform: translateY(-5px);
}

.book-meta-info {
    background: linear-gradient(135deg, #0f0f0f 0%, #1a1a1a 100%);
    padding: 30px;
    border-left: 4px solid #c41e3a;
    border-radius: 3px;
}

.book-meta-info p {
    margin: 15px 0;
    color: #aaa;
    font-size: 1em;
    line-height: 1.8;
    padding-bottom: 15px;
    border-bottom: 1px solid #222;
}

.book-meta-info p:last-child {
    border-bottom: none;
}

.book-meta-info strong {
    color: #c41e3a;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: 0.9em;
}

/* ===== АННОТАЦИЯ ===== */
/* ===== АННОТАЦИЯ ===== */
.book-annotation-section {
    flex: 1;
    background: linear-gradient(135deg, #0a0a0a 0%, #0f0f0f 100%);
    padding: 50px;
    border: 1px solid #1a1a1a;
    border-radius: 3px;
    position: relative;
}

.book-annotation-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 2px;
    background: linear-gradient(90deg, transparent, #8b0000, transparent);
}

.book-annotation-section h2 {
    color: #c41e3a;
    font-size: 2.5em;
    margin: 0 0 30px;
    padding-bottom: 20px;
    border-bottom: 2px solid #1a1a1a;
    letter-spacing: 8px;
    text-transform: uppercase;
    font-weight: 700;
    font-family: 'Georgia', 'Times New Roman', serif;
}

.book-annotation-section p {
    line-height: 2;
    color: #ccc;
    margin-bottom: 25px;
    text-align: justify;
    font-size: 1.1em;
    text-indent: 30px;
    font-family: 'Arial', 'Helvetica', sans-serif;
    font-weight: 400;
    letter-spacing: 0.5px;
}

.book-annotation-section h3 {
    color: #c41e3a;
    margin: 40px 0 25px;
    font-size: 1.8em;
    letter-spacing: 4px;
    text-transform: uppercase;
    font-family: 'Georgia', 'Times New Roman', serif;
}

.book-themes {
    list-style: none;
    padding: 0;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 15px;
}

.book-themes li {
    padding: 15px 20px;
    background: #0f0f0f;
    border-left: 3px solid #c41e3a;
    color: #bbb;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    font-family: 'Arial', 'Helvetica', sans-serif;
    font-size: 1em;
    letter-spacing: 0.5px;
}

.book-themes li::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    width: 0;
    background: rgba(196, 30, 58, 0.1);
    transition: width 0.3s ease;
}

.book-themes li:hover {
    padding-left: 30px;
    color: #fff;
    background: #1a1a1a;
}

.book-themes li:hover::before {
    width: 100%;
}
/* ===== СЕКЦИИ ===== */
.section-title,
.gallery-title {
    text-align: center;
    color: #fff;
    font-size: 3em;
    margin: 100px 0 60px;
    letter-spacing: 10px;
    text-transform: uppercase;
    font-weight: 700;
    position: relative;
    padding-bottom: 30px;
}

.section-title::after,
.gallery-title::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 300px;
    height: 2px;
    background: linear-gradient(90deg, transparent, #c41e3a, transparent);
}

/* ===== КАРТОЧКИ ФИЛЬМОВ ===== */
.movies-section {
    max-width: 1400px;
    margin: 0 auto;
    padding: 0 40px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
    gap: 40px;
}

.movie-card {
    background: linear-gradient(135deg, #0a0a0a 0%, #0f0f0f 100%);
    border: 1px solid #1a1a1a;
    border-radius: 3px;
    overflow: hidden;
    transition: all 0.4s ease;
    position: relative;
}

.movie-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, #8b0000, #c41e3a, #8b0000);
    transform: scaleX(0);
    transition: transform 0.4s ease;
}

.movie-card:hover {
    transform: translateY(-10px);
    border-color: #8b0000;
    box-shadow: 0 20px 60px rgba(196, 30, 58, 0.3);
}

.movie-card:hover::before {
    transform: scaleX(1);
}

.movie-header {
    background: linear-gradient(135deg, #1a1a1a 0%, #0f0f0f 100%);
    padding: 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 2px solid #1a1a1a;
}

.movie-title {
    margin: 0;
    font-size: 2.2em;
    color: #fff;
    letter-spacing: 5px;
    text-transform: uppercase;
}

.movie-year {
    font-size: 1.8em;
    font-weight: 700;
    color: #fff;
    background: linear-gradient(135deg, #8b0000, #c41e3a);
    padding: 10px 25px;
    border-radius: 3px;
    letter-spacing: 3px;
    box-shadow: 0 5px 15px rgba(196, 30, 58, 0.4);
}

.movie-details {
    padding: 30px;
}

.movie-details p {
    margin: 15px 0;
    color: #aaa;
    line-height: 1.8;
    font-size: 1em;
}

.movie-details strong {
    color: #c41e3a;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: 0.9em;
}

.movie-description {
    margin-top: 25px;
    padding-top: 25px;
    border-top: 1px solid #1a1a1a;
    font-style: italic;
    color: #999;
    line-height: 1.9;
}

/* ===== ГАЛЕРЕЯ ===== */
.photo-gallery {
    max-width: 1400px;
    margin: 0 auto;
    padding: 20px 40px 60px;
}

.gallery-section {
    margin-bottom: 80px;
}

.gallery-section h3 {
    color: #c41e3a;
    font-size: 2em;
    margin-bottom: 30px;
    padding-left: 20px;
    border-left: 4px solid #8b0000;
    letter-spacing: 4px;
    text-transform: uppercase;
}

.gallery-row {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 25px;
}

.gallery-item {
    position: relative;
    background: #0a0a0a;
    border-radius: 3px;
    overflow: hidden;
    border: 1px solid #1a1a1a;
    cursor: pointer;
    transition: all 0.4s ease;
}

.gallery-item:hover {
    transform: translateY(-8px) scale(1.02);
    border-color: #c41e3a;
    box-shadow: 0 15px 40px rgba(196, 30, 58, 0.4);
    z-index: 10;
}

.gallery-item img {
    width: 100%;
    height: 280px;
    object-fit: cover;
    display: block;
    transition: all 0.4s ease;
    filter: grayscale(20%);
}

.gallery-item:hover img {
    filter: grayscale(0%);
    transform: scale(1.1);
}

.photo-caption {
    padding: 15px;
    margin: 0;
    text-align: center;
    font-size: 0.9em;
    color: #888;
    background: #0f0f0f;
    border-top: 1px solid #1a1a1a;
    transition: all 0.3s ease;
    letter-spacing: 1px;
}

.gallery-item:hover .photo-caption {
    color: #c41e3a;
    background: #1a1a1a;
}

/* ===== МОДАЛЬНОЕ ОКНО ===== */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.98);
    overflow: auto;
    animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

.modal-content {
    margin: auto;
    display: block;
    max-width: 90%;
    max-height: 85%;
    margin-top: 30px;
    border: 3px solid #8b0000;
    border-radius: 3px;
    box-shadow: 0 0 60px rgba(196, 30, 58, 0.5);
    animation: zoomIn 0.3s ease;
}

@keyframes zoomIn {
    from { transform: scale(0.8); opacity: 0; }
    to { transform: scale(1); opacity: 1; }
}

.modal-caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 800px;
    text-align: center;
    color: #c41e3a;
    padding: 25px 0;
    font-size: 1.3em;
    letter-spacing: 3px;
    text-transform: uppercase;
}

.close {
    position: absolute;
    top: 30px;
    right: 50px;
    color: #8b0000;
    font-size: 60px;
    font-weight: 300;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 60px;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid #1a1a1a;
    border-radius: 50%;
}

.close:hover {
    color: #c41e3a;
    border-color: #c41e3a;
    transform: rotate(90deg);
}

/* ===== АДАПТИВНОСТЬ ===== */
@media (max-width: 1200px) {
    .gallery-row {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 968px) {
    .book-main-content {
        flex-direction: column;
        gap: 40px;
    }
    
    .book-cover-section {
        flex: none;
        position: relative;
        top: 0;
    }
    
    .movies-section {
        grid-template-columns: 1fr;
    }
    
    .book-title {
        font-size: 4em;
        letter-spacing: 10px;
    }
}

@media (max-width: 768px) {
    .book-title {
        font-size: 3em;
        letter-spacing: 5px;
    }
    
    .book-original-title {
        font-size: 1.8em;
        letter-spacing: 8px;
    }
    
    .section-title,
    .gallery-title {
        font-size: 2em;
        letter-spacing: 5px;
    }
    
    .gallery-row {
        grid-template-columns: repeat(2, 1fr);
    }
    
    .book-annotation-section {
        padding: 30px;
    }
}

@media (max-width: 480px) {
    .book-title {
        font-size: 2.2em;
        letter-spacing: 3px;
    }
    
    .gallery-row {
        grid-template-columns: 1fr;
    }
    
    .movie-header {
        flex-direction: column;
        text-align: center;
        gap: 20px;
    }
    
    .book-themes {
        grid-template-columns: 1fr;
    }
}

/* ===== СКРОЛЛБАР ===== */
::-webkit-scrollbar {
    width: 10px;
}

::-webkit-scrollbar-track {
    background: #0a0a0a;
}

::-webkit-scrollbar-thumb {
    background: #8b0000;
    border-radius: 5px;
}

::-webkit-scrollbar-thumb:hover {
    background: #c41e3a;
}

/* ===== ВЫДЕЛЕНИЕ ТЕКСТА ===== */
::selection {
    background: rgba(196, 30, 58, 0.3);
    color: #fff;
}

::-moz-selection {
    background: rgba(196, 30, 58, 0.3);
    color: #fff;
}</style>

<script src="/static/scripts/modal.js"></script>