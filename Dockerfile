# ---------- Stage 1 : Build React App ----------
FROM node:20-alpine AS builder

WORKDIR /app

# copy dependency files
COPY package*.json ./

# install dependencies
RUN npm install

# copy rest of project
COPY . .

# build vite project
RUN npm run build


# ---------- Stage 2 : Serve with Nginx ----------
FROM nginx:alpine

# remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# copy built files
COPY --from=builder /app/dist /usr/share/nginx/html

# expose port
EXPOSE 80

# start nginx
CMD ["nginx", "-g", "daemon off;"]