from django.shortcuts import render
from django.contrib.auth.decorators import login_required

@login_required
def docente_idiomas_view(request):
    return render(request, 'panel_docente/idiomas.html')
