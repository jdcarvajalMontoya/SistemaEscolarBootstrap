// static/js/login.js

// Ejemplo: Validación básica de campos vacíos (opcional)
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('loginForm');
    if (form) {
        form.addEventListener('submit', function (event) {
            let correo = form.querySelector('[name="correo"]').value.trim();
            let password = form.querySelector('[name="password"]').value.trim();
            if (!correo || !password) {
                event.preventDefault();
                alert("Por favor, completa todos los campos.");
            }
        });
    }
});
