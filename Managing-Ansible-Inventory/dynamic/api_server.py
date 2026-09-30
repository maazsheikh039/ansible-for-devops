from http.server import HTTPServer, BaseHTTPRequestHandler
import json

class MockAPIHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/instances':
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.end_headers()
            data = [
                {"hostname": "cloud-web-01", "ip": "10.0.1.10", "role": "webservers", "environment": "production", "team": "frontend"},
                {"hostname": "cloud-web-02", "ip": "10.0.1.11", "role": "webservers", "environment": "production", "team": "frontend"},
                {"hostname": "cloud-db-01", "ip": "10.0.2.20", "role": "databases", "environment": "production", "team": "backend"},
                {"hostname": "cloud-db-02", "ip": "10.0.2.21", "role": "databases", "environment": "staging", "team": "backend"},
                {"hostname": "cloud-lb-01", "ip": "10.0.3.30", "role": "loadbalancers", "environment": "production", "team": "devops"},
                {"hostname": "cloud-dev-01", "ip": "10.0.4.40", "role": "development", "environment": "development", "team": "devops"}
            ]
            self.wfile.write(json.dumps(data).encode('utf-8'))
        else:
            self.send_response(404)
            self.end_headers()

if __name__ == '__main__':
    server = HTTPServer(('127.0.0.1', 8080), MockAPIHandler)
    server.serve_forever()
