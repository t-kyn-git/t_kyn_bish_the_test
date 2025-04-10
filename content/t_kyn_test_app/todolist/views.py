from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from .models import Task

@login_required
def todolist_view(request):
    if request.method == "POST":
        title = request.POST.get("title")
        # if title:
        #     Task.objects.create(user=request.user, title=title)
        
        # completed_str = request.POST.get("completed")
        # completed = True if completed_str == "true" else "false"
        description = request.POST.get("description", "").strip()  # 改行含む入力を取得

        completed_str = request.POST.get("completed", "false")  # デフォルトは "false"
        completed = completed_str.lower() == "true"  # 文字列をboolに変換
        
        task = Task.objects.create(
            user=request.user,
            title=title,
            description=description,  # description を保存
            completed=completed
        )
        
        return redirect("todolist")

    tasks = Task.objects.filter(user=request.user).order_by("-created_at")
    return render(request, "todolist.html", {"tasks": tasks})

# def toggle_task(request, task_id):
#     task = get_object_or_404(Task, id=task_id)
#     task.completed = not task.completed
#     task.save()
#     return JsonResponse({"success": True})