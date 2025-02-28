from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.generic import TemplateView
from .models import Photo

@method_decorator(login_required, name='dispatch')
class AlbumView(TemplateView):
    template_name = "album.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['photos'] = Photo.objects.all().order_by('-uploaded_at')
        return context