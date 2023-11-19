from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash

db = SQLAlchemy()

# Tables intermédiaires pour la relation many-to-many
user_game_ownership = db.Table('user_game_ownership',
    db.Column('user_id', db.Integer, db.ForeignKey('users.id')),
    db.Column('game_id', db.Integer, db.ForeignKey('games.id'))
)

# Table intermédiaire pour la relation many-to-many
user_game_wishlist = db.Table('user_game_wishlist',
    db.Column('user_id', db.Integer, db.ForeignKey('users.id')),
    db.Column('game_id', db.Integer, db.ForeignKey('games.id'))
)

class User(db.Model):
    __tablename__ = 'users'
    # User
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), unique=True, index=True)
    # Profil
    first_name = db.Column(db.String(64))
    last_name = db.Column(db.String(64))
    address = db.Column(db.String(256))
    email = db.Column(db.String(120), unique=True, index=True)
    password_hash = db.Column(db.String(128))
    
    # Définir la relation many-to-many avec la table Game
    games_owned = db.relationship('Game', secondary=user_game_ownership, back_populates='owners')
    games_wished = db.relationship('Game', secondary=user_game_wishlist, back_populates='wishers')

    def __repr__(self):
        return f'<User {self.username}>'

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)
    
class Game(db.Model):
    __tablename__ = 'games'
    id = db.Column(db.Integer, primary_key=True)
    gamename = db.Column(db.String(64), unique=True, index=True)
    owners = db.relationship('User', secondary=user_game_ownership, back_populates='games_owned')
    wishers =  db.relationship('User', secondary=user_game_wishlist, back_populates='games_wished')
    def __repr__(self):
        return f'<Game {self.gamename}>'


if __name__ == '__main__':
    from api import app
    with app.app_context():
        db.drop_all()
        db.create_all()
        # Créer deux utilisateurs
        jean = User(username='Jean')
        vincent = User(username='Vincent')

        # Créer trois jeux
        monopoly = Game(gamename='Monopoly')
        risk = Game(gamename='Risk')
        bousicocotte = Game(gamename='Bousicocotte')

        # Ajouter les jeux aux utilisateurs
        jean.games_owned.extend([monopoly, risk])
        vincent.games_owned.extend([risk, bousicocotte])

        # # Ajouter les utilisateurs aux jeux (Uniquement nécessaire si vous avez défini back_populates dans le modèle)
        # monopoly.owners.append(jean)
        # risk.owners.extend([jean, vincent])
        # bousicocotte.owners.append(vincent)
        
        # Ajouter le jeu Trivial Pursuit à l'utilisateur Jean
        trivial_pursuit = Game(gamename='Trivial Pursuit')

        # Ajouter le jeu Trivial Pursuit  en whishlist de Vincent
        vincent.games_wished.extend([trivial_pursuit,monopoly])

        # Ajouter et commit des changements à la base de données
        db.session.add_all([jean, vincent, monopoly, risk, bousicocotte])
        db.session.commit()
        print(f'{jean} own {jean.games_owned} and vincent wish to get  {vincent.games_wished}')
        print(f'{monopoly} is  owned by  {monopoly.owners}')
        print()

