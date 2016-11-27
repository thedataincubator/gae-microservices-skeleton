# GAE Microservices Skeleton

### The structure:

1. There is a global `dispatch.yaml` which is responsible for routing but only routes `*.appspot.com` and your domain's subdomains.  In development, each service is placed on a separate port.

2. Each service `module` is in it's own folder `module/` and is invoked by it's own `module/app.yaml`.


```
├── LICENSE
├── Makefile
├── README.md
├── dispatch.yaml
├── default
│   ├── app.py
│   ├── app.yaml
│   ├── appengine_config.py
│   └── requirements.txt
├── module-php
│   ├── app.php
│   └── app.yaml
├── module1
│   ├── app.py
│   └── app.yaml
└── module2
    ├── app.yaml
    └── src
        ├── __init__.py
        └── app.py
```

3. Notice that each module can be a different languages (e.g. `*.php`).

### TODO:
1. How do we handle service discovery in production / development?  How does `url_for` work across services?  [This blog](https://medium.com/google-cloud/service-discovery-and-configuration-on-google-cloud-platform-spoiler-it-s-built-in-c741eef6fec2#.bleeqp1od) claims GAE already has a service-discovery API.

2. Setup module.php to be a wordpress site and use `dispatch.yaml` to route `site/blog` to it.  [This article](https://googlecloudplatform.github.io/appengine-php-wordpress-starter-project/) and [this blog](https://code.tutsplus.com/tutorials/hosting-a-wordpress-website-on-google-app-engine--cms-22134) explain how.  [This wordpress extension](https://wordpress.org/plugins/google-app-engine/) may be necessary.  Can we do this routing at the DNS level?

3. Flask Blueprints be registered multiple times at different endpoints (e.g. `/client1/foo.html` and `/client2/foo.html`).  There may be [some issues](https://github.com/pallets/flask/issues/1091) with `url_for` not quite working.  This is almost certainly better than multiple apps.
