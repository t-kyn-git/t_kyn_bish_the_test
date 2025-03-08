from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import Message

@login_required
def chat_view(request):
    if request.method == "POST":
        text = request.POST.get("text")
        # print(text)
        if text:
            Message.objects.create(user=request.user, text=text)
            # print(user)
            # print(text)
        return redirect("chat")

    messages = Message.objects.order_by("created_at")
    #debugotameshi
    print(messages)
    return render(request, "chat.html", {"messages": messages})
