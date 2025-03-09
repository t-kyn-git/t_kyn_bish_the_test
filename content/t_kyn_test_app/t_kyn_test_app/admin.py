from django.contrib import admin

# Register your models here.
from album.models import Photo
from chat.models import Message
from todolist.models import Task

admin.site.register(Photo)
admin.site.register(Message)
admin.site.register(Task)