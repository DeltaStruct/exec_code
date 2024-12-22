from flask import Flask,request,jsonify
from hashlib import sha512
import os

app = Flask("server.py")

keycode = os.environ("keycode")

@app.route("/exec_code",methods=["POST"])
def exec_code():
  req = request.get_json()
  checker = req["checker"]
  hash = sha512((keycode+req["time"]).encode()).hexdigest()
  if checker!=hash:
    return jsonify({ "res": "IE", "judge_message": "IE: wrong exec keycode." })
  code = req["code"]
  code_name = req["code_name"]
  file_name = req["file_name"]
  compile_code = req["compile_code"]
  exec_code = req["exec_code"]
  stdin = req["stdin"]
  dir = "exec"+str(os.getpid())
  os.system("rm -rf "+dir)
  os.system("mkdir "+dir)
  

if __name__=="__main__":
  app.run()
