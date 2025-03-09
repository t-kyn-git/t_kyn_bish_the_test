from django.contrib import admin

# Register your models here.
from album.models import Photo
from chat.models import Message
from todolist.models import Task
from location.models import Location
from spreadsheet.models import Spreadsheet

admin.site.register(Photo)
admin.site.register(Message)
admin.site.register(Task)
admin.site.register(Location)
admin.site.register(Spreadsheet)