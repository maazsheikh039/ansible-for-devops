from flask import Flask, jsonify, request
import os
import socket
import time
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        'message': 'Hybrid Cloud Web Service',
        'environment': os.environ.get('ENVIRONMENT', 'unknown'),
        'hostname': socket.gethostname(),
        'timestamp': datetime.now().isoformat(),
        'version': '1.0.0'
    })

@app.route('/health')
def health():
    return jsonify({
        'status': 'healthy',
        'environment': os.environ.get('ENVIRONMENT', 'unknown'),
        'uptime': time.time(),
        'checks': {
            'database': 'connected',
            'cache': 'available'
        }
    })

@app.route('/info')
def info():
    return jsonify({
        'service': 'hybrid-web-service',
        'environment': os.environ.get('ENVIRONMENT', 'unknown'),
        'datacenter': os.environ.get('DATACENTER', 'unknown'),
        'instance_id': socket.gethostname(),
        'port': os.environ.get('PORT', '5000')
    })

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=True)
