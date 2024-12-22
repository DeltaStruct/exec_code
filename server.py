from flask import Flask,request,jsonify
from flask_cors import CORS
from hashlib import sha512
import subprocess
import os

app = Flask("server.py")

cors = CORS(app,resource={
  "/ping": {},
  "/exec_code": {}
})

keycode = os.environ["keycode"]

@app.route("/ping",methods=["POST"])
def ping():
  return request.get_json()

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
  compile_timeout = int(req["compile_timeout"])
  exec_timeout = int(req["exec_timeout"])
  compile_code = req["compile_code"]
  exec_code = req["exec_code"]
  stdin = req["stdin"]
  dir = "exec"+str(os.getpid())
  os.system("rm -rf "+dir)
  os.system("mkdir "+dir)
  with open(dir+'/'+code_name,mode='w') as f:
    f.write(code)
  res = subprocess.run("cd "+dir+" ; "+compile_code,shell=True,encoding="UTF-8",stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=compile_timeout)
  if not os.path.isfile(dir+'/'+file_name):
    return jsonify({ "res": "CE", "exit_code": -1, "stdout": res.stdout.decode(), "stderr": res.stderr.decode() })
  exr = subprocess.run("cd "+dir+" ; "+exec_code,shell=True,input=stdin,encoding="UTF-8",stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=exec_timeout)
  stdout = exr.stdout
  stderr = exr.stderr
  status = "OK"
  if exr.returncode!=0:
    stdout = res.stdout+stdout
    stderr = res.stderr+stderr
    status = "RE"
  return jsonify({ "res": status, "exit_code": exr.returncode, "stdout": stdout.decode(), "stderr": stderr.decode() })

if __name__=="__main__":
  os.system("cloudflared tunnel --url \"http://localhost:8000\" > tmpinput.txt 2>&1 &")
  while subprocess.run("grep -o \"https://.*\\.trycloudflare\\.com\" tmpinput.txt",shell=True,stdout=subprocess.PIPE).stdout.decode()=="":
    pass
  with open("url.txt",mode='w') as f:
    f.write(subprocess.run("grep -o \"https://.*\\.trycloudflare\\.com\" tmpinput.txt",shell=True,stdout=subprocess.PIPE).stdout.decode())
  os.system("""
    git config user.name "GitHub Actions"
    git config user.email "DeltaStruct@users.noreply.github.com"
    git add .
    git commit -m "change url"
    git push
  """)
  app.run(debug=True,port=8000,threaded=True)
