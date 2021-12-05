# devops_task4

## Part 1
To start container run command from root of the repository:

    docker build -t cmake_flask .
    docker run -it -p 5000:5000 cmake_flask
    
## Part 2
To start web-app run command from root of the repository:

    docker-compose down --volume && docker compose up --build
