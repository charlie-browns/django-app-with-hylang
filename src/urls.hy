"""src URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
(import [django.contrib [admin]]
        [django.urls [path include]]
        [django.conf [settings]]
        [django.conf.urls.static [static]]
        [django.views.generic.base [TemplateView]])

(setv urlpatterns 
  [(path "" (.as_view TemplateView :template_name "base.html") :name "index")
   (path "api/" (include "api.urls"))
   (path "admin/" admin.site.urls)])

; to load static/media files in development environment
(if settings.DEBUG
 (do 
  (+= urlpatterns (static settings.STATIC_URL :document_root settings.STATIC_ROOT))
  (+= urlpatterns (static settings.MEDIA_URL :document_root settings.MEDIA_ROOT))))
