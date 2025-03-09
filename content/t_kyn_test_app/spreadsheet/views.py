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
    data = Spreadsheet.objects.all()
    # 最大の行数と列数を取得（テーブルサイズを決定）
    max_row = max(data.values_list("row", flat=True), default=0)
    max_col = max(data.values_list("column", flat=True), default=0)

    # テーブルの行と列の最大数を計算
    # max_row = data.count()  # 行数
    # max_col = max(len(row.split(',')) for row in data.values_list('value', flat=True))  # 列数

    # 空の表を作成（2次元リスト）
    table_data = [["" for _ in range(max_col)] for _ in range(max_row)]

    # # データを正しい位置に配置
    # for item in data:
    #     table_data[item.row - 1][item.column - 1] = item.value  # 1-based index を 0-based に変換

    # データをテーブルに反映
    for entry in data:
        table_data[entry.row - 1][entry.column - 1] = entry.value  # 1-based index

    # return render(request, "spreadsheet.html", {"data": data})
    return render(request, "spreadsheet.html", {
        "table_data": table_data,
        "col_range": range(1, max_col + 1),  # 列の範囲
        "row_range": range(1, max_row + 1)  # 行の範囲
    })
    # return render(request, "spreadsheet.html")