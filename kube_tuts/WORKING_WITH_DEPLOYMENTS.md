## Working with Deployments

- List Deployments
   - kubectl get deployments
- View Status of deployment roll outs
   - kubectl rollout status
- Set the image of a deployment
  - kubectl set image
- View the history of a rollout, including previous versions.
  - kubectl rollout history 
 
 * Setting an image of a running containers.
   - kubectl set image deployment/tomcat-deployment=tomcat:9.0.1
 
## Deployment Commands
- kubectl get deployments
- kubectl rollout status
- kubectl set image
- kubectl rollout history