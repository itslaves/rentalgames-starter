mysql:
	cd mysql-pack && ./run.sh

nginx:
	cd nginx-pack && ./run.sh

redis:
	cd redis-pack && ./run.sh

all: mysql nginx redis
