from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import Message

@login_required
def chat_view(request):
    if request.method == "POST":
        text = request.POST.get("text")
        if text:
            Message.objects.create(user=request.user, text=text)
        return redirect("chat")

    messages = Message.objects.order_by("created_at")

    for message in messages:
        message.is_self = message.user == request.user  # 自分のメッセージかどうかを判定

    return render(request, "chat.html", {"messages": messages})


