FROM node:alpine

# enviroments PORT=3000
ENV PORT 3000

# Create app directory -> Luego que use ese directorio como File Container
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Installing dependencies -> Docker Use a package.json y package-lock.json and install
COPY package*.json /usr/src/app/
RUN npm install

# Copying source files -> Docker copia el Codigo [Path -> . ] al File Container
COPY . /usr/src/app

# Building app -> Docker Compile [ npm run build ] y abre el puerto 3000
RUN npm run build
EXPOSE 3000

# Running the app -> Docker ejecute en entorno de desarrollo [ npm run dev ]
CMD "npm" "run" "dev"