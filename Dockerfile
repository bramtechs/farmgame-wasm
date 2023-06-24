# Base image with Node.js and D compiler
FROM node:18-bookworm

# Download WASI-sdk
WORKDIR /tmp
RUN wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-20/wasi-sdk_20.0_amd64.deb
RUN dpkg -i wasi-sdk_20.0_amd64.deb
ENV WASI_SDK_PATH=/opt/wasi-sdk

# Install dependencies 
RUN apt update -y && apt install -y dub ldc lld make

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Expose port 4444
EXPOSE 4444

# Set the default command
CMD ["npm", "run", "dev"]