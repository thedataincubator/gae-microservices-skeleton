PROJECT_ID=gae-microservices-skeleton

server:
	dev_appserver.py --host 0.0.0.0 --log_level=debug dispatch.yaml \
		default/app.yaml module1/app.yaml module2/app.yaml \
		module-php/app.yaml --port=9090 --admin_port=9000

deploy-dispatch:
	gcloud app deploy --project $(PROJECT_ID) dispatch.yaml

deploy-%: %/app.yaml
	gcloud app deploy --project $(PROJECT_ID) $<

install-ext:
	pip install -t default/ext -r default/requirements.txt

clean:
	find . -name *.pyc | xargs rm -f
