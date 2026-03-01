% rebase('layout.tpl', title='Разработчики - Фан-сайт Стивена Кинга', year=2024)

<link rel="stylesheet" type="text/css" href="/static/content/bio.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Inter:wght@300;400;600&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">

<!-- Заголовок страницы -->
<div class="hero-banner" style="height: 200px;">
    <div class="hero-image">
        <img src="/static/images/Stephenbanner.jpg" alt="Стивен Кинг" style="filter: brightness(0.5);">
    </div>
    <div class="hero-overlay">
        <h1 class="hero-main-title" style="font-size: 48px;">Разработчики сайта</h1>
        <p class="hero-description">Команда, создавшая этот фан-сайт</p>
    </div>
</div>

<div class="container" style="margin-top: 40px; margin-bottom: 60px;">
    <!-- Три карточки для разработчиков -->
    <div class="row">
        <!-- Разработчик 1 -->
        <div class="col-md-4">
            <div class="developer-card" style="background: #1a1a1a; border: 1px solid #333; border-radius: 8px; padding: 30px; text-align: center; margin-bottom: 30px;">
                <!-- ФОТОГРАФИЯ -->
                <div style="width: 150px; height: 150px; border-radius: 50%; margin: 0 auto 20px; border: 3px solid #8b0000; overflow: hidden;">
                    <img src="/static/images/third_dev.jpg" alt="Имя разработчика" style="width: 100%; height: 100%; object-fit: cover;">
                </div>
    
                <!-- Имя и роль -->
                <h3 style="color: #8b0000; font-family: 'Playfair Display', serif;">Лада</h3>
    
                <!-- Описание -->
                <div style="background: #0a0a0a; padding: 15px; border-radius: 5px; margin: 20px 0;">
                </div>
    
                <!-- Контакты -->
                <div style="display: flex; justify-content: center; gap: 15px;">
                    <a href="#" style="color: #8b0000;">GitHub</a>
                    <a href="#" style="color: #8b0000;">Telegram</a>
                </div>
            </div>
        </div>
        
        <!-- Разработчик 2 -->
        <div class="col-md-4">
            <div class="developer-card" style="background: #1a1a1a; border: 1px solid #333; border-radius: 8px; padding: 30px; text-align: center; margin-bottom: 30px;">
                <!-- ФОТОГРАФИЯ -->
                <div style="width: 150px; height: 150px; border-radius: 50%; margin: 0 auto 20px; border: 3px solid #8b0000; overflow: hidden;">
                    <img src="/static/images/second_dev.jpg" alt="Имя разработчика" style="width: 100%; height: 100%; object-fit: cover;">
                </div>
    
                <!-- Имя и роль -->
                <h3 style="color: #8b0000; font-family: 'Playfair Display', serif;">Настя</h3>
    
                <!-- Описание -->
                <div style="background: #0a0a0a; padding: 15px; border-radius: 5px; margin: 20px 0;">
                </div>
    
                <!-- Контакты -->
                <div style="display: flex; justify-content: center; gap: 15px;">
                    <a href="#" style="color: #8b0000;">GitHub</a>
                    <a href="#" style="color: #8b0000;">Telegram</a>
                </div>
            </div>
        </div>
        
        <!-- Разработчик 3 -->
        <div class="col-md-4">
            <div class="developer-card" style="background: #1a1a1a; border: 1px solid #333; border-radius: 8px; padding: 30px; text-align: center; margin-bottom: 30px;">
                <!-- ФОТОГРАФИЯ -->
                <div style="width: 150px; height: 150px; border-radius: 50%; margin: 0 auto 20px; border: 3px solid #8b0000; overflow: hidden;">
                    <img src="/static/images/first_dev.jpg" alt="Имя разработчика" style="width: 100%; height: 100%; object-fit: cover;">
                </div>
    
                <!-- Имя и роль -->
                <h3 style="color: #8b0000; font-family: 'Playfair Display', serif;">Андрей</h3>
    
                <!-- Описание -->
                <div style="background: #0a0a0a; padding: 15px; border-radius: 5px; margin: 20px 0;">
                </div>
    
                <!-- Контакты -->
                <div style="display: flex; justify-content: center; gap: 15px;">
                    <a href="#" style="color: #8b0000;">GitHub</a>
                    <a href="#" style="color: #8b0000;">Telegram</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Дополнительная информация о команде -->
    <div class="about-content" style="margin-top: 40px;">
        <h3>О команде</h3>
        <p>Этот фан-сайт создан группой энтузиастов, вдохновленных творчеством Стивена Кинга. Мы стремимся собрать максимально полную информацию о жизни и творчестве Короля ужасов, чтобы поделиться ею с поклонниками по всему миру.</p>
    </div>
</div>

<!-- Добавим немного стилей для эффектов -->
<style>
    .developer-card:hover {
        transform: translateY(-10px);
        border-color: #8b0000 !important;
        box-shadow: 0 10px 30px rgba(139, 0, 0, 0.3);
    }
    
    .developer-card:hover .dev-photo {
        border-color: #8b0000;
    }
</style>

<script src="/static/scripts/jquery-1.10.2.js"></script>
<script src="/static/scripts/bootstrap.js"></script>
<script src="/static/scripts/respond.js"></script>