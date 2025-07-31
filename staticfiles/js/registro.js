// 👁️ Mostrar / ocultar contraseña
function togglePasswordIcon(id, btn) {
    const field = document.getElementById(id);
    if (field) {
        if (field.type === "password") {
            field.type = "text";
            btn.querySelector("i").classList.remove("bi-eye-slash");
            btn.querySelector("i").classList.add("bi-eye");
        } else {
            field.type = "password";
            btn.querySelector("i").classList.remove("bi-eye");
            btn.querySelector("i").classList.add("bi-eye-slash");
        }
    }
}

// 🔒 Verificación de fuerza de contraseña
document.addEventListener("DOMContentLoaded", function () {
    const passwordField = document.getElementById("id_password");
    const bar = document.getElementById("password-strength");
    const checks = {
        len: document.getElementById("len"),
        mayus: document.getElementById("mayus"),
        minus: document.getElementById("minus"),
        num: document.getElementById("num"),
        sym: document.getElementById("sym"),
    };

    if (passwordField && bar) {
        passwordField.addEventListener("input", function () {
            const value = passwordField.value;
            let score = 0;

            if (value.length >= 8) {
                checks.len.classList.replace("text-danger", "text-success");
                score++;
            } else {
                checks.len.classList.replace("text-success", "text-danger");
            }

            if (/[A-Z]/.test(value)) {
                checks.mayus.classList.replace("text-danger", "text-success");
                score++;
            } else {
                checks.mayus.classList.replace("text-success", "text-danger");
            }

            if (/[a-z]/.test(value)) {
                checks.minus.classList.replace("text-danger", "text-success");
                score++;
            } else {
                checks.minus.classList.replace("text-success", "text-danger");
            }

            if (/\d/.test(value)) {
                checks.num.classList.replace("text-danger", "text-success");
                score++;
            } else {
                checks.num.classList.replace("text-success", "text-danger");
            }

            if (/[#\$%!_]/.test(value)) {
                checks.sym.classList.replace("text-danger", "text-success");
                score++;
            } else {
                checks.sym.classList.replace("text-success", "text-danger");
            }

            const percentage = (score / 5) * 100;
            bar.style.width = percentage + "%";
            bar.classList.remove("bg-success", "bg-warning", "bg-danger");
            if (percentage < 40) {
                bar.classList.add("bg-danger");
            } else if (percentage < 80) {
                bar.classList.add("bg-warning");
            } else {
                bar.classList.add("bg-success");
            }
        });
    }

    // Carga dinámica de País → Departamento → Ciudad
    const paisSelect = document.getElementById("id_pais_identificacion");
    const departamentoSelect = document.getElementById("id_departamento_identificacion");
    const municipioSelect = document.getElementById("id_municipio_identificacion");

    if (paisSelect && departamentoSelect && municipioSelect) {
        paisSelect.addEventListener("change", function () {
            const paisId = this.value;
            departamentoSelect.innerHTML = '<option value="">Cargando...</option>';
            municipioSelect.innerHTML = '<option value="">Seleccione municipio</option>';

            fetch(`/ajax/departamentos/?pais_id=${paisId}`)
                .then(res => res.json())
                .then(data => {
                    departamentoSelect.innerHTML = '<option value="">Seleccione un departamento</option>';
                    data.forEach(dep => {
                        departamentoSelect.innerHTML += `<option value="${dep.id}">${dep.nombre}</option>`;
                    });
                });
        });

        departamentoSelect.addEventListener("change", function () {
            const depId = this.value;
            municipioSelect.innerHTML = '<option value="">Cargando...</option>';

            fetch(`/ajax/ciudades/?departamento_id=${depId}`)
                .then(res => res.json())
                .then(data => {
                    municipioSelect.innerHTML = '<option value="">Seleccione municipio</option>';
                    data.forEach(mun => {
                        municipioSelect.innerHTML += `<option value="${mun.id}">${mun.nombre}</option>`;
                    });
                });
        });
    }

    // Mostrar alerta si el rol seleccionado es Coordinador Académico
    const rolSelect = document.getElementById("id_rol");
    const alertaDiv = document.getElementById("coordinador-alerta");

    if (rolSelect && alertaDiv) {
        function toggleAlerta() {
            const selectedText = rolSelect.options[rolSelect.selectedIndex].text.toLowerCase();
            if (selectedText.includes("coordinador")) {
                alertaDiv.classList.remove("d-none");
            } else {
                alertaDiv.classList.add("d-none");
            }
        }
        rolSelect.addEventListener("change", toggleAlerta);
        toggleAlerta(); // Ejecutar una vez al cargar
    }
});
