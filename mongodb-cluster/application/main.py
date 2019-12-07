from app import app, mongo
from bson.json_util import dumps
from bson.objectid import ObjectId
from flask import jsonify, request
from werkzeug import generate_password_hash, check_password_hash
from flask_paginate import Pagination

@app.route('/projects')
def index():
    projects = mongo.db.projects.find().limit(50)
    return dumps(projects)

@app.route('/projects', methods=['POST'])
def add_project():
    _json = request.json
    _name = _json['name']
    _category = _json['category']
    _main_category = _json['main_category']
    _currency = _json['currency']
    _deadline = _json['deadline']
    _goal = _json['goal']
    _launched = _json['launched']
    _pledged = _json['pledged']
    _state = _json['state']
    _backers = _json['backers']
    _country = _json['country']
    _usd_pledged = _json['usd_pledged']
    _usd_pledged_real = _json['usd_pledged_real']
    _usd_goal_real = _json['usd_goal_real']

    id = mongo.db.projects.insert_one({
        'name': _name,
        'category': _category,
        'main_category': _main_category,
        'currency': _currency,
        'deadline': _deadline,
        'goal': _goal,
        'launched': _launched,
        'pledged': _pledged,
        'state': _state,
        'backers': _backers,
        'country': _country,
        'usd_pledged': _usd_pledged,
        'usd_pledged_real': _usd_pledged_real,
        'usd_goal_real': _usd_goal_real
    })

    resp = jsonify(str(id.inserted_id))
    resp.status_code = 200
    return resp

@app.route('/projects/<id>', methods=['PUT'])
def edit_project(id):
    _json = request.json
    _name = _json['name']
    _category = _json['category']
    _main_category = _json['main_category']
    _currency = _json['currency']
    _deadline = _json['deadline']
    _goal = _json['goal']
    _launched = _json['launched']
    _pledged = _json['pledged']
    _state = _json['state']
    _backers = _json['backers']
    _country = _json['country']
    _usd_pledged = _json['usd_pledged']
    _usd_pledged_real = _json['usd_pledged_real']
    _usd_goal_real = _json['usd_goal_real']

    result = mongo.db.projects.update_one({
        '_id': ObjectId(id)
        }, {
        '$set':{
            'name': _name,
            'category': _category,
            'main_category': _main_category,
            'currency': _currency,
            'deadline': _deadline,
            'goal': _goal,
            'launched': _launched,
            'pledged': _pledged,
            'state': _state,
            'backers': _backers,
            'country': _country,
            'usd_pledged': _usd_pledged,
            'usd_pledged_real': _usd_pledged_real,
            'usd_goal_real': _usd_goal_real
        }})

    resp = jsonify('Project {} is updated'.format(str(id)))
    resp.status_code = 200
    return resp

@app.route('/projects/<id>')
def project(id):
    project = mongo.db.projects.find_one({'_id': ObjectId(id)})
    return dumps(project)

@app.route('/projects/<id>', methods=['DELETE'])
def delete_project(id):
    mongo.db.projects.delete_one({'_id': ObjectId(id)})
    response = jsonify('Project {} deleted successfully'.format(id))
    response.status_code = 200

    return response

@app.route('/projects/countries/count')
def project_countries_count():
    if request.args.get('state'):
        countries = mongo.db.projects.aggregate([
            {
                '$match': {
                    'state': request.args.get('state')
                }
            },
            {
                '$group': {
                    '_id': '$country',
                    'count': {'$sum':1}
                }
            }
        ])
    else:
        countries = mongo.db.projects.aggregate([
            {
                '$group': {
                    '_id': '$country',
                    'count': {'$sum':1}
                }
            }
        ])

    return dumps(countries)

@app.route('/projects/countries/maximum-pledge')
def project_countries_pledge():
    countries = mongo.db.projects.aggregate([
            {
                '$group': {
                    '_id': '$country',
                    'pledge': {'$max': '$usd_pledged'}
                }
            }
        ])
    return dumps(countries)


if __name__=="__main__":
    app.run()