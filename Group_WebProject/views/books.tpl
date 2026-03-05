% rebase('layout.tpl', title=title, year=year)

<!-- Заголовок книги -->
<div class="book-header">
    <h1 class="book-title--large">ОНО</h1>
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



<script src="/static/scripts/modal.js"></script>