#sed -i "s|https://localhost|https://host.docker.internal|g" package.json

DOCKER_REG_HOST=localhost:8083/nexus

image_name=$(jq -r .name package.json)
image_tag=$(jq -r .version package.json)

sudo docker build . -t $image_name:$image_tag --network=host

sudo docker tag $image_name:$image_tag $DOCKER_REG_HOST/$image_name:$image_tag
sudo docker push $DOCKER_REG_HOST/$image_name:$image_tag
