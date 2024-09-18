kubectl patch svc nginx-svc -n tt3 -p '{"spec": {"type": "LoadBalancer"}}'
