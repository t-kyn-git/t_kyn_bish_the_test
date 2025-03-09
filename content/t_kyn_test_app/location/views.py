from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from .models import Location
from .forms import LocationForm

def map_view(request):
    locations = Location.objects.all()

    if request.method == "POST":
        form = LocationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('map_view')

    else:
        form = LocationForm()

    # return render(request, "location/map.html", {"form": form, "locations": locations})
    return render(request, "map.html", {"form": form, "locations": locations})