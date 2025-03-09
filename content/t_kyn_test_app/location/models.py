from django.db import models
from django.contrib.auth.models import User

class Location(models.Model):
    name = models.CharField(max_length=100)  # 地点名
    latitude = models.FloatField()  # 緯度
    longitude = models.FloatField()  # 経度
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name