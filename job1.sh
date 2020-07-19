if ls | grep *.php
then
if kubectl get deployment | grep myphp
then
echo "php container already running"
POD=$(kubectl get pods -l app=php -o jsonpath="{.items[*].metadata.name}")
kubectl cp *.php $POD:/var/www/html
else
sudo kubectl create -f depphp.yaml
sleep 10
POD=$(kubectl get pods -l app=php -o jsonpath="{.items[*].metadata.name}")
kubectl cp *.php $POD:/var/www/html
fi
else
if kubectl get deployment | grep html
then
echo "html conatiner already running"
POD=$(kubectl get pods -l app=html -o jsonpath="{.items[*].metadata.name}")
kubectl cp *.html $POD:/var/www/html
else
sudo kubectl create -f dephtml.yaml
sleep 10
POD=$(kubectl get pods -l app=html -o jsonpath="{.items[*].metadata.name}")
kubectl cp *.html $POD:/usr/local/apache2/htdocs
fi
fi
