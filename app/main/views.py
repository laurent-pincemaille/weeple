from flask import  request, render_template
from werkzeug.utils import secure_filename
import os
from config import myconfig
from . import main



@main.route('/')
def index():
    return render_template('index.html')

@main.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        # Get the file from post request
        f = request.files['file']
 
        # Save the file to ./uploads
        basepath = myconfig.UPLOAD_FOLDER
        #import pdb;pdb.set_trace()
        filepath = os.path.join(basepath, secure_filename(f.filename))
        f.save(filepath)
    return  render_template("upload.html")
