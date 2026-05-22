# roboshop-eks-terraform
to create cluster and node groups

With triggers: You tell Terraform: "If the cluster_name changes, run this script again

to connect argocd through cli (linux server)
=============================================
curl -sSL -o argocd-linux-amd64 https://github.com
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64


login through cli
--------------------
argocd login "LB" --insecure --username admin --password "pawd"
argocd app create cart --repo https://github.com/pdevops87/roboshop-helm-v1.git --path . --dest-namespace default --dest-server https://kubernetes.default.svc  --values pass-templates/cart.yaml
argocd app sync cart
argocd app wait cart(progressing..)
argocd app wait cart --timeout 30(this is a health check)

prometheus:
===========
scrape config:
--------------
prometheus:
 prometheusSpec:
  additionalScrapeConfigs:
  - job_name: frontend
    static_configs: 
     - targets: 
        - frontend:9113

follow some steps:
===================
1. install prometheus through helm chart
2. run roboshop application through ci/cd pipeline
3. run load test
4. check metrics in frontend pod: curl http://localhost/metrics ; curl http://localhost/health
5. check "active connections"
6. add nginx exporter prometheus config
7. 
- name: nginx-exporter
  image: nginx/nginx-prometheus-exporter:latest # Official Nginx image [1]
  args:
  # Tells the exporter where to find the Nginx stub status page [1]
  - -nginx.scrape-uri=http://localhost:80/nginx_status
  ports:
  - containerPort: 9113
  name: metrics # Prometheus will scrape this port [1]

read container metrics:
=======================
add in reverse proxy:

location /nginx_status {
stub_status on;

    # Correct: Only put the IP address of the sidecar here
    allow 127.0.0.1; 
    access_log off;
}


[ STEP 1 ]                                [ STEP 2 ]                             [ STEP 3 ]
Nginx Container (Frontend)           Nginx Exporter Container                 Prometheus Server
(Runs stub_status)                      (The Translator)                     (Managed via Helm)

┌──────────────────┐                    ┌──────────────────┐                       ┌────────────┐
│  Generates raw   │ ──(Raw Text)─────► │ Reads raw text,  │                       │            │
│   text data at   │                    │ translates it to │ ◄──(Scrapes metrics)──│  Collects  │
│  /nginx_status   │                    │ Prometheus format│    on port 9113       │  the data  │
└──────────────────┘                    │ at /metrics      │                       └────────────┘
└──────────────────┘


1. default scrape config is in prometheus helm chart
2. stub_status: get number of connections
3. to carry this active connections to prometheus dashboard use: nginx exporter
4. http://catalogue:8080/metrics,user,cart,....... all these directly send to prometheus only
- name: nginx-exporter
  image: nginx/nginx-prometheus-exporter:latest
  args:
  # The exporter uses this IP to connect to Nginx
    - -nginx.scrape-uri=http://127.0.0/health



steps:
======
1. prometheus server send a scrape request http://frontend:9113/metrics
2. exporter container receives the scrape request and forward to 127.0.0.1
3. nginx reads the active connections and send back to the exporter.
4. exporter receives the scrape metrics and send back to the prometheus dashboard.

nginx metrics: 14900,12767






