mysql:
	cd mysql-pack && ./run.sh

nginx:
	cd nginx-pack && ./run.sh

all: mysql nginx
