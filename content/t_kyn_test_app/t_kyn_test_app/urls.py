"""
URL configuration for portfolio project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
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
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path, include   # Add
#from album.views import AlbumView  # ← インポートを追加
from django.http import HttpResponse  # ← ここを追加
from django.shortcuts import render,redirect
from django.contrib.auth import views as auth_views

# シンプルなトップページビュー
def home_view(request):
    #return HttpResponse("Welcome to the Digital Album!")
    return render(request, 'index.html')  # ← `index.html` を表示する

def profile_redirect(request):
    return redirect('/album/')

urlpatterns = [
    path('admin/', admin.site.urls),
    #path('album/', AlbumView.as_view(), name='album'),
    path('accounts/', include('django.contrib.auth.urls')),  # 認証URLを追加
    path('album/', include('album.urls')),
    path('', home_view, name='home'),  # ここを追加
    path('accounts/profile/', profile_redirect, name='profile'),
    path("accounts/logout/", auth_views.LogoutView.as_view(), name="logout"),
    path('chat/', include('chat.urls')),
    path('todolist/', include('todolist.urls')),
    path('location/', include('location.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)