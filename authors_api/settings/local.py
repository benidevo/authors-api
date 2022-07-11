from .base import *
from .base import env

DEBUG = True

SECRET_KEY = env('DJANGO_SECRET_KEY', default='django-insecure-r^+vl2y4^^&0aom=p88%j))4m8lu4z54h6fy^i5)9-pt9fis(-')

ALLOWED_HOSTS = ['localhost', '0.0.0.0', '127.0.0.1']
