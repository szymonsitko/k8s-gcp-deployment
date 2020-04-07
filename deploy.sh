docker build -t szymonsitko/multi-client:latest -t szymonsitko/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t szymonsitko/multi-worker:latest -t szymonsitko/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker build -t szymonsitko/multi-server:latest -t szymonsitko/multi-server:$SHA -f ./server/Dockerfile ./server

docker push szymonsitko/multi-client:latest
docker push szymonsitko/multi-worker:latest
docker push szymonsitko/multi-server:latest

docker push szymonsitko/multi-client:$SHA
docker push szymonsitko/multi-worker:$SHA
docker push szymonsitko/multi-server:$SHA

kubectl apply -f k8s/

kubectl set image deployments/server-deployment server=szymonsitko/multi-server:$SHA
kubectl set image deployments/client-deployment client=szymonsitko/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=szymonsitko/multi-worker:$SHA