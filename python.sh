#!/bin/bash

clean

if [ ! -f "requirements.txt" ]; then
  touch "requirements.txt"
fi

if [ ! -f "./src/__main__.py" ]; then
  touch "./src/__main__.py"
fi

if [ ! -f ".gitignore" ]; then
  cat <<EOF > .gitignore
*.pyc
*.pyo
*.pyd
__pycache__
venv/
.vscode/
.idea/
.DS_Store
*.log
*.sqlite3
EOF
fi

python3 -m venv venv
./venv/bin/pip install -r requirements.txt
touch ./venv/bin/activate
source ./venv/bin/activate

run() {
  ./venv/bin/python3 ./src
}

freeze() {
  ./venv/bin/pip freeze > requirements.txt
}

clean() {
  rm -rf __pycache__
  rm -rf venv
}


