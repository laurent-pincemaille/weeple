document.addEventListener('DOMContentLoaded', function () {
    // Chargez la page d'accueil par défaut au démarrage
    loadPage('home');
});

my_api = 'http://127.0.0.1:5000'

function loadPage(page) {
    const contentDiv = document.getElementById('content');

    // Utilisez fetch ou une autre méthode pour charger le contenu de la page depuis le serveur
    fetch(`${page}.html`)
        .then(response => response.text())
        .then(html => {
            contentDiv.innerHTML = html;
        })
        .catch(error => console.error('Error loading page:', error));
}

function signup() {
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    console.log(email)

    if (password !== confirmPassword) {
        alert("Passwords do not match");
    } else {
        // Envoyez une requête au serveur pour l'inscription
        fetch(`${my_api}/signup`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ username, email,password }),
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log("Sign Up successful!");
                    // Rediriger vers la page de connexion
                    window.location.href = `${my_api}/login`;
                } else {
                    alert("Error during Sign Up");
                }
            })
            .catch(error => console.error('Error during Sign Up:', error));
    }
}

function logout() {
    // Supprimer le token de l'utilisateur lors de la déconnexion
    localStorage.removeItem('token');

    // Actualiser la navigation
    loadPage('home');
}
