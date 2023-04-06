# Use the official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN yarn install

# Copy the source code to the container
COPY . .

RUN yarn test

RUN yarn lint

# Build the TypeScript project
RUN yarn build

# Expose the port your application will run on
EXPOSE 3000

# Start the application
CMD ["yarn", "dev"]
