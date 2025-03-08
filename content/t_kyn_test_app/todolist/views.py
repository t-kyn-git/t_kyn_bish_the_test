from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import Task

@login_required
def todolist_view(request):
    if request.method == "POST":
        title = request.POST.get("title")
        if title:
            Task.objects.create(user=request.user, title=title)
        return redirect("todolist")

    tasks = Task.objects.filter(user=request.user).order_by("-created_at")
    return render(request, "todolist.html", {"tasks": tasks})
