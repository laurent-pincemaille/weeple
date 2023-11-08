from flask import Flask,request, render_template

app = Flask(__name__, static_folder='../frontend/static',template_folder='../frontend/templates', static_url_path='/')

# @app.route('/')
# def index():
#     return render_template('index.html')

@app.route('/boardgames/<name>', methods=['GET', 'POST'])
def get_boardgames(name):
    return {"h":name}

if __name__ == '__main__':  
   app.run(debug=True)