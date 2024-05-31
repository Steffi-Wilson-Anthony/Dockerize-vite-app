# Instructions to build and run docker image

### Go to the root directory where your main files are

### Run the following command : docker build -t my-app .
- `docker build` : docker command to build the image from a Dockerfile.
- `-t my-app` : This will tag the image with a name my-app.
- `.` : This specifies the build context indicating that docker should use the current directory for the build process (i.e. docker should look in the current directory for the Dockerfile and the other necessary files).

### Command to run the docker container : docker run -p 4173:4173 my-app
- We have exposed port 4173 in the container.
- `-p 4173:4173` : this will map port 4173 on your local system to port 4173 inside the container
- Hence you can access your website through `http://localhost:4173`.

# Dockerfile

- We have used Node.js as base image with `tag = 20.13.1-alpine3.20`.
- First we create the working directory as /app in the home directory of the container where all the files and folders are copied, otherwise all the files will be placed in the home directory.
- We copy the package.json and package-lock.json files to the container. They contain the list of dependencies needed to run the app
- Then we run the npm install command inside the container. This will install all the dependencies.
- Copy the remaining files. First dot (`.`) specifies the source directory (build context). Second dot (`.`) specifies the destination directory inside the docker image's filesystem relative to the WORKDIR that we have provided.
- Then we build our application for production using `npm run build`.
- To serve the static files we install server package.
- Inside the container the application runs on port 4173.
- `CMD ["serve", "-s", "dist", "-l", "4173"]` : This command gets executed when you run the container.
- `server` : server package
- `-s dist` : -s flag for static files. `dist` is the directory where Vite outputs the build files when you run `npm run build`.
- `-l 4173` : asks the server to listen on port 4173 for incoming HTTP request.
