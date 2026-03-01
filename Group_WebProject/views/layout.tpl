<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }}</title>
    
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <script src="/static/scripts/modernizr-2.6.2.js"></script>
    

    <link rel="stylesheet" type="text/css" href="/static/content/bio.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Inter:wght@300;400;600&family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
    
</head>

<body>

    <header class="main-header">
        <div class="header-container">
            <a href="/" class="logo">
                STEPHEN <span class="logo-accent">KING</span>
            </a>
            <nav class="nav-menu">
                <a href="/books" class="nav-link">КНИГИ</a>
                <a href="/contact" class="nav-link">БИОГРАФИЯ</a>
                <a href="/creators" class="nav-link">КОНТАКТЫ</a>
            </nav>
        </div>
    </header>


    <div class="container body-content">
        {{!base}}
        <hr />
        <footer>
            <p>&copy; {{ year }} - Fan Site</p>
        </footer>
    </div>

    <script src="/static/scripts/jquery-1.10.2.js"></script>
    <script src="/static/scripts/bootstrap.js"></script>
    <script src="/static/scripts/respond.js"></script>

</body>
</html>