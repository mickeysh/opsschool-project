helm package helm/charts/spree/
helm repo index helm/charts/
git add helm/charts/
git commit -m "add new chart version"
git push origin master
helm repo add spree https://raw.githubusercontent.com/mickeysh/opsschool-project/master/helm/charts/
helm repo update