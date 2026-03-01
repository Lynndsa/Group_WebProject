"""
Routes and views for the bottle application.
"""

from bottle import route, view
from datetime import datetime

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        title='Home page',
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the bio page."""
    return dict(
        title='Bio',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/books')
@view('books')
def about():
    """Renders the books page."""
    return dict(
        title='Books',
        message='Your application description page.',
        year=datetime.now().year
    )
@route('/creators')
@view('creators')
def creators():
    return dict(
        title = 'Contact',
        message='Your application description page.',
        year=datetime.now().year
    )
