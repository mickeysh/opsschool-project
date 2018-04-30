echo "===Creating Namespaces==="
kubectl create -f K8s/system-ops/namespaces.yaml
kubectl create -f K8s/spree/spree-namespace.yaml 
echo "===Deploying Helm==="
kubectl create -f helm/helm-tiller-rbac.yaml
helm init --service-account tiller
echo "Waiting 60 seconds for tiller to deploy"
sleep 60s
echo "===kube-system: deploying externalDNS==="
helm install --name=external-dns stable/external-dns -f helm/values/externalDNS-values.yaml --namespace=kube-system
echo "===kube-system: deploying nginx ingress controller==="
helm install --name=nginx-ingress stable/nginx-ingress -f helm/values/nginx-values.yaml --namespace=kube-system
echo "===kube-system: deploying heapster==="
helm install --name=heapster stable/heapster -f helm/values/heapster-values.yaml --namespace=kube-system
echo "===monitoring: deploying prometheus==="
helm install --name=prometheus stable/prometheus -f helm/values/prometheus-values.yaml --namespace=monitoring
echo "===monitoring: deploying grafana==="
helm install --name=grafana stable/grafana -f helm/values/grafana-values.yaml --namespace=monitoring
echo "===logging: deploying elasticsearch==="
helm install --name=elastic-search incubator/elasticsearch -f helm/values/elasticsearch-values.yaml --namespace=logging
echo "===logging: deploying fluentd==="
helm install --name=fluentd incubator/fluentd-elasticsearch -f helm/values/fluentd-values.yaml --namespace=logging
echo "===logging: deploying kibana==="
helm install --name=kibana stable/kibana -f helm/values/kibana-values.yaml --namespace=logging
echo "===spree: deploying spree==="
helm install --name=spree spree/spree -f helm/values/spree-values.yaml --namespace=spree