## AUDITING

Advanced Auditiing (Introduced after 1.8)
Auditing allows us to keep the track of what is happening in the kubecluster like who has made the changes and how and when!

Exersice
-  Let's set up a simple Audit Policy to log all requests regarding Metadata, this will let us see what audit data looks like without overload
- We'll configure minikube to log it to a file on our system.

Our steps:
- Stop Minikube (If running)
- Define an Audit Policy.
- Start MiniKubte with Audit Policy defined with appropriate options.