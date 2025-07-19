from flask import Flask, request, jsonify
from flask_cors import CORS  

app = Flask(__name__)
CORS(app)  

@app.route('/')
def home():
    return "InfraVista Backend is Running!"

@app.route('/generate', methods=['POST'])
def generate_diagram():
    try:
        tf_json = request.get_json()
        resources = tf_json.get("resource", {})
        
        # Build Mermaid diagram string
        diagram = "graph TD\n"
        for res_type in resources:
            for name in resources[res_type]:
                node_id = f"{res_type}_{name}"
                diagram += f"    {node_id}({res_type}: {name})\n"
        
        return jsonify({"diagram": diagram})
    except Exception as e:
        return jsonify({"error": str(e)}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
