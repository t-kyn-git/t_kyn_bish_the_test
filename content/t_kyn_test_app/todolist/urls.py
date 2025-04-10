"""
URL configuration for t_kyn_test_app project.

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
from django.urls import path, include   # Add
from .views import todolist_view  # ← `.` をつける
from django.conf import settings
from django.conf.urls.static import static
# from .views import toggle_task

urlpatterns = [
    path("", todolist_view, name="todolist"),
    path('accounts/', include('django.contrib.auth.urls')),
    # path('toggle/<int:task_id>/', toggle_task, name='toggle_task'),
]

# メディアファイルの提供設定
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)