
The Nautilus DevOps team has been tasked with setting up a containerized application. They need to create a private Amazon Elastic Container Registry (ECR) repository to store their Docker images. Once the repository is created, they will build a Docker image from a Dockerfile located on the aws-client host and push this image to the ECR repository. This process is essential for maintaining and deploying containerized applications in a streamlined manner.

Create a private ECR repository named datacenter-ecr. There is a Dockerfile under /root/pyapp directory on aws-client host, build a docker image using this Dockerfile and push the same to the newly created ECR repo, the image tag must be latest.

Note:

1.create a private ECR repo
2. Build Dockerfile under given root/pyapp dir and push the same to newly created ECR
3. image tag: latest

Solution:

#check Dockerfile is exist in given path
cd /root/pyapp/
ls

#ECR is same with dockerhub
#create private
Search > ECR > Private Registry > repositories > create > repo name + default all > create
#can see now repo url

#check docker images list
terminal > docker images

#create docker image
docker build -t pyapp .

#docker image is created now
docker images

#copy the recent created private repository url
docker tag pyapp [recent created private repository url]

#we can now see three images with tag latest
docker images

#images are ready, now push to ECR

G=> AWS ECR Login
https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry_auth.html

#AWS ECR Login with private repository url
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin [recent created private repository url]
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 379415752762.dkr.ecr.us-east-1.amazonaws.com

docker push [recent created private repository url]

379415752762.dkr.ecr.us-east-1.amazonaws.com/datacenter-ecr

# can see now image in our private ECR in aws