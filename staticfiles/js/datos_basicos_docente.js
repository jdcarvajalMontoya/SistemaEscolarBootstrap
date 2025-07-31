document.addEventListener("DOMContentLoaded", function () {
  const birthInput = document.querySelector("#id_fecha_nacimiento");
  const ageOutput = document.querySelector("#edad");

  if (birthInput && ageOutput) {
    function calcularEdad() {
      const birthDate = new Date(birthInput.value);
      const today = new Date();
      let age = today.getFullYear() - birthDate.getFullYear();
      const m = today.getMonth() - birthDate.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }
      ageOutput.value = isNaN(age) ? "" : age;
    }

    birthInput.addEventListener("change", calcularEdad);
    calcularEdad();
  }
});
