document.addEventListener('DOMContentLoaded', function () {
    const paisSelect = document.getElementById('id_pais_residencia');
    const departamentoSelect = document.getElementById('id_departamento_residencia');
    const ciudadSelect = document.getElementById('id_municipio_residencia');
  
    if (!paisSelect || !departamentoSelect || !ciudadSelect) return;
  
    paisSelect.addEventListener('change', function () {
      const paisId = this.value;
  
      fetch(`/ajax/departamentos/?pais_id=${paisId}`)
        .then(response => response.json())
        .then(data => {
          departamentoSelect.innerHTML = '<option value="">---------</option>';
          data.forEach(dep => {
            departamentoSelect.innerHTML += `<option value="${dep.id}">${dep.nombre}</option>`;
          });
  
          ciudadSelect.innerHTML = '<option value="">---------</option>';  // limpia ciudades
        });
    });
  
    departamentoSelect.addEventListener('change', function () {
      const departamentoId = this.value;
  
      fetch(`/ajax/ciudades/?departamento_id=${departamentoId}`)
        .then(response => response.json())
        .then(data => {
          ciudadSelect.innerHTML = '<option value="">---------</option>';
          data.forEach(city => {
            ciudadSelect.innerHTML += `<option value="${city.id}">${city.nombre}</option>`;
          });
        });
    });
  });
  