AASEMBLE_OVERRIDE_NAME = "Jio Package Builder"

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'package',
        'USER': 'root',
        'PASSWORD': 'root',
    }
}

BUILDSVC_REPOS_BASE_URL = 'http://10.140.221.229/apt'
BUILDSVC_DEFAULT_SERIES_NAME = 'jiocloud'
