from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
# from .models import Task

# @
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Spreadsheet


def get_spreadsheet_data(request):
    """スプレッドシートのデータを取得"""
    data = list(Spreadsheet.objects.values("row", "column", "value"))
    return JsonResponse({"data": data}, safe=False)

@csrf_exempt
def save_spreadsheet_data(request):
    """スプレッドシートのデータを保存"""
    if request.method == "POST":
        data = json.loads(request.body).get("spreadsheet", [])
        
        # 既存データを削除（全更新方式）
        Spreadsheet.objects.all().delete()
        
        # 新しいデータを保存
        for row_idx, row in enumerate(data):
            for col_idx, value in enumerate(row):
                Spreadsheet.objects.create(row=row_idx, column=col_idx, value=value)
        
        return JsonResponse({"status": "success"})
    return JsonResponse({"status": "error"}, status=400)

def spreadsheet_view(request):
    """スプレッドシートのページを表示"""
    return render(request, "spreadsheet.html")