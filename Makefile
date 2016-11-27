PROJECT_ID=gae-microservices-skeleton

server:
	dev_appserver.py --host 0.0.0.0 --log_level=debug dispatch.yaml \
		module1/module1.yaml module2/module2.yaml --port=9090 --admin_port=9000

deploy-dispatch:
	gcloud app deploy --project $(PROJECT_ID) dispatch.yaml

deploy-module1:
	gcloud app deploy --project $(PROJECT_ID) module1/module1.yaml

deploy-module2:
	gcloud app deploy --project $(PROJECT_ID) module2/module2.yaml
