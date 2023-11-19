from flask import Flask,request, render_template
from models import db, User, Game 
from config import myconfig
from flask_migrate import Migrate

def create_app(config_name):
    app = Flask(__name__)
    app.config.from_object(myconfig[config_name])
    # Initialize extensions (base de données, ...)
    db.init_app(app)
    migrate = Migrate(app, db)
    return app

app = create_app('default')

# Route pour le traitement du formulaire de signup (réception des données POST)
@app.route('/signup', methods=['POST'])
def signup():
    # Récupérer les données du formulaire
    username = request.json.get('username')
    email = request.json.get('email')
    password = request.json.get('password')

    # Faites ici le traitement d'inscription (par exemple, enregistrez l'utilisateur dans une base de données)
    # Vérifier si l'utilisateur existe déjà dans la base de données
    existing_user = User.query.filter_by(username=username).first()
    if existing_user:
        response_data = {'success': False, 'message': 'Username already exists'}
        return response_data, 400

    # Créer un nouvel utilisateur
    new_user = User(
        username=username,
        email=email
    )
    new_user.set_password(password)

    # Ajouter l'utilisateur à la base de données
    db.session.add(new_user)
    db.session.commit()

    # Répondre avec succès
    response_data = {'success': True, 'message': 'Sign Up successful!'}
    return response_data



@app.route('/', methods=['GET', 'POST'])
def hello():
    print("ici")
    return {"Message":"Bienvenue sur l'api de Ludothèque en ligne!"}

@app.route('/users', methods=['GET'])
def get_users():
    users = User.query.all()
    user_list = [{'id': user.id, 'username': user.username} for user in users]
    return {'users': user_list}

@app.route('/users', methods=['POST'])
def create_user():
    data = request.get_json()

    if 'username' not in data:
        return {'error': 'Missing username'}, 400  # Bad Request

    username = data['username']

    # Vérifier si l'utilisateur existe déjà
    existing_user = User.query.filter_by(username=username).first()
    if existing_user:
        return {'error': 'Username already exists'}, 400
    new_user = User(username=username)
    db.session.add(new_user)
    db.session.commit()
    return {'message': f'User {new_user} created successfully'}, 201  # Created


if __name__ == '__main__':
    # Créer les tables dans la base de données
    with app.app_context():
        db.create_all() 
    app.run(debug=True)