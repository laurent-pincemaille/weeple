

function login() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    // Envoyez une requête au serveur pour l'authentification
    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username, password }),
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("Login successful!");
                // Rediriger vers la page d'accueil (ou autre)
                window.location.href = "/home";
            } else {
                alert("Invalid username or password");
            }
        })
        .catch(error => console.error('Error during login:', error));
}

function signup() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;

    if (password !== confirmPassword) {
        alert("Passwords do not match");
    } else {
        // Envoyez une requête au serveur pour l'inscription
        fetch('/signup', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ username, password }),
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert("Sign Up successful!");
                    // Rediriger vers la page de connexion
                    window.location.href = "/login";
                } else {
                    alert("Error during Sign Up");
                }
            })
            .catch(error => console.error('Error during Sign Up:', error));
    }
}


function handleNavigation(page) {
    const navList = document.getElementById('nav-list');
    const profileLink = document.getElementById('profile-link');
    const gamesLink = document.getElementById('games-link');
    const logoutLink = document.getElementById('logout-link');

    // Gérer la visibilité des liens de navigation en fonction de la page et de l'état de connexion
    switch (page) {
        case 'home':
            navList.style.display = 'block';
            profileLink.style.display = 'none';
            gamesLink.style.display = 'none';
            logoutLink.style.display = 'none';
            break;
        case 'signup':
            navList.style.display = 'none';
            break;
        case 'login':
            navList.style.display = 'none';
            break;
        case 'profile':
            navList.style.display = 'block';
            profileLink.style.display = 'none';
            gamesLink.style.display = 'block';
            logoutLink.style.display = 'block';
            break;
        case 'games':
            navList.style.display = 'block';
            profileLink.style.display = 'block';
            gamesLink.style.display = 'none';
            logoutLink.style.display = 'block';
            break;
    }
}