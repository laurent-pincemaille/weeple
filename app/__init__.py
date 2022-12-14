from flask_sqlalchemy import SQLAlchemy
from flask import Flask
from config import myconfig

db = SQLAlchemy()

def create_app(config_name):
    app = Flask(__name__)
    # Need to init app from config
    app.config.from_object(myconfig[config_name])
    myconfig[config_name].init_app(app)

    # Blueprints
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)
    return app
 








