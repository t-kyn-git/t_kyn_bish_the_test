from django.db import models
from django.contrib.auth.models import User

class Spreadsheet(models.Model):
    """スプレッドシートのデータを保存するモデル"""
    row = models.IntegerField()  # 行番号
    column = models.IntegerField()  # 列番号
    value = models.TextField(blank=True, null=True)  # セルの値

    def __str__(self):
        return f"Row {self.row}, Col {self.column}: {self.value}"