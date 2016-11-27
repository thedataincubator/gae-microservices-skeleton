PROJECT_ID=gae-microservices-skeleton

server:
	dev_appserver.py --host 0.0.0.0 --log_level=debug dispatch.yaml \
		default/default.yaml module1/module1.yaml module2/module2.yaml \
		module-php/module-php.yaml --port=9090 --admin_port=9000

deploy-dispatch:
	gcloud app deploy --project $(PROJECT_ID) dispatch.yaml

deploy-default:
	gcloud app deploy --project $(PROJECT_ID) default/default.yaml

deploy-module1:
	gcloud app deploy --project $(PROJECT_ID) module1/module1.yaml

deploy-module2:
	gcloud app deploy --project $(PROJECT_ID) module2/module2.yaml

deploy-module-php:
	gcloud app deploy --project $(PROJECT_ID) module-php/module-php.yaml

install-ext:
	pip install -t default/ext -r default/requirements.txt
