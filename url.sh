#get URL
LB=$(kubectl describe svc | grep "LoadBalancer Ingress:" | awk '{print $NF}') 
echo "http://"${LB}":8000" > ~/url.txt
