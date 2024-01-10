# wso2 api manager
Version 4.2.0

# Clone my repository:
git clone https://github.com/rrcordero/wso2apimanager.git

# Go to clone directory and run:

docker build -t "image":"tag" .

# Finally run into container the image generated:

docker run -p 9443:9443 -v ./product-apim/conf:/app/modules/p2-profile/product/target/wso2carbon-core-4.8.1/repository/conf -d "image":"tag"

# When the startup script finish you can check the access:

*  https://localhost:9443/publisher/apis

*  https://localhost:9443/devportal/apis


