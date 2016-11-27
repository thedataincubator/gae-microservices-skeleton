import logging

from flask import Flask, Blueprint, url_for

simple_page = Blueprint('simple_page', __name__)

@simple_page.route('/')
def show():
  return "Self URL: {}".format(url_for("simple_page.show"))

app = Flask(__name__)
app.register_blueprint(simple_page, url_prefix='/page1')
app.register_blueprint(simple_page, url_prefix='/page2')

@app.route('/')
def hello():
  return 'Default Service!' + str([(r, r.endpoint, r.rule) for r in app.url_map.iter_rules()])

@app.errorhandler(500)
def server_error(e):
  # Log the error and stacktrace.
  logging.exception('An error occurred during a request.')
  return 'An internal error occurred.', 500
