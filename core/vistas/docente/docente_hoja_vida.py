from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages

from core.models import HojaDeVidaDocente
from core.forms import (
    DatosBasicosDocenteForm,
    IdentificacionForm,
    IdentidadForm
)

@login_required
def docente_datos_basicos_view(request):
    usuario = request.user
    perfil = getattr(usuario, 'perfil', None)

    try:
        hoja_de_vida = HojaDeVidaDocente.objects.get(usuario=usuario)
    except HojaDeVidaDocente.DoesNotExist:
        hoja_de_vida = None

    # Armar datos iniciales para los campos redundantes
    initial_basico = {}
    if perfil:
        initial_basico['direccion_linea1'] = perfil.direccion_linea1
        initial_basico['direccion_linea2'] = perfil.direccion_linea2
        initial_basico['municipio_residencia'] = perfil.ciudad  # ciudad = municipio
        if perfil.ciudad:
            initial_basico['departamento_residencia'] = perfil.ciudad.departamento
            initial_basico['pais_residencia'] = perfil.ciudad.departamento.pais

    if request.method == 'POST':
        form_identificacion = IdentificacionForm(request.POST, instance=usuario)
        form_identidad = IdentidadForm(request.POST, instance=perfil)
        form_basico = DatosBasicosDocenteForm(request.POST, instance=hoja_de_vida, initial=initial_basico)
        
        print("POST:", request.POST)
        print("CLEANED DATA:", form_basico.cleaned_data if form_basico.is_valid() else None)
        print("ERRORES:", form_basico.errors)
        
        if all([form_identificacion.is_valid(), form_identidad.is_valid(), form_basico.is_valid()]):
            usuario = form_identificacion.save()
            form_identidad.save()

            hoja = form_basico.save(commit=False)
            hoja.usuario = usuario
            hoja.save()

            messages.success(request, "✅ Información actualizada correctamente.")
            return redirect('docente_datos_basicos')
        else:
            messages.error(request, "❌ Corrige los errores en los formularios.")
    else:
        form_identificacion = IdentificacionForm(instance=usuario)
        form_identidad = IdentidadForm(instance=perfil)
        form_basico = DatosBasicosDocenteForm(instance=hoja_de_vida, initial=initial_basico)

    context = {
        'form_identificacion': form_identificacion,
        'form_identidad': form_identidad,
        'form_basico': form_basico,
        'hoja': hoja_de_vida
    }
    return render(request, 'panel_docente/datos_basicos.html', context)
