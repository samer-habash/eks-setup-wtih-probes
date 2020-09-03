This project was attended by Develeap :

-   The project has an IaaS code which deploy eks cluster demo on AWS .
-   The IaaS code uses the default vpc plus a dynamic options for the capacity of the eks cluster in terms of worker nodes quantity, disk size, instance type and some additional parameters.
-   A python app will be deployed after creating the cluster using the regular kubectl with its yaml deployment file (it can be done through jenkins CD)
-   The python app is a testing app for checking the kubernetes Probes.

Usage :

1. Applying EKS cluster : go to directory /eks-cluster-create/projects/EKS-Cluster-Deploy/ and apply terraform apply.
                          NOTE: in the same directory check the text file "apply-terraform-outputs.txt" in order to grab the kubeconfig of the cluster and the aws-auth configMap.
2. Deploying the app as a deployment yaml file which exists in directory "Deploy-app-with-probes-on-k8s" and its name "k8s-deploy-app-with-probes.yaml"    
2. Testing the app for readinessProbe : please visit the path URL as : http://eks-node---/healthz
   Testing the app for livenessProbe : please visit the path URL as : http://eks-node---/error
   Testing the livenessProbe app using tcpSocker : first change the livenessProbe as tcpSocket check in the Yaml file as in the kubernetes doc :
       """
       livenessProbe:
         tcpSocket:
           port: 5050 # in our case the containerPort is 5050.
       """
       Then re-apply the deployment then visit the path URL : http://ec2-node---/error
                            

Directories :
- [x] app-with-probes
      
       This is a small web framework that is written in python flask uses the port 5050 as a container port, which is a testing app for kubernetes Probes .
       App explanation :
          url path :
            root path ('/') : returns a message with a hello word plus the current date
            readiness path ('/healthz') : which is the path for the readinessProbe to test on and you can also surf to the url and it will return a message that the server is live with the current date.
                                          NOTE: Please note that the webframwork has a delay of 10 seconds before it started.
            crash path ('crash') : this will shutdown the flask web framework gracefully, as a result the readiness probe will result in failure .
            liveness path ('error') : this url path will return an internal server error which will also log this error in an error log file, as a result of executing the command in livenessProbe the pod will fail and the container will be restarted. 
- [x] Deploy-app-with-probes-on-k8s
        
      This directory includes the deployment yaml file that can be deployed on the cluster, please note the liveness/readiness Probes that is configured in order to
      If you are running your cluster on premise then you can use the kubectl port-forward command to open the app on port 8090
      NOTE: the initialDelaySeconds in the yaml file in the Probes section matches the delay of the web framework mentioned above which is 10 seconds.
      
- [x] eks-cluster-create

       This is a terraform code that creates eks cluster with a given/chosen set of parameters, please go to directory project/EKS-Cluster-Deploy/main.tf to check them.
       Lastly, after issuing terraform apply have a look on file apply-terraform-outputs.txt , this file will help you save your kubeconfig file created by amazon and also apply the configmap of the aws auth.
       NOTE: please install  aws-iam-authenticator on your workstation to get access to eks afterall
       
   ENJOY! 