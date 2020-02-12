# Specify a base iamge
FROM node:alpine as builder

WORKDIR '/app'

# Install some dependencies
COPY package.json .
RUN npm install

COPY . .

# Default command
RUN npm run build


# Specify a base iamge
FROM nginx

# Copy build folder from previous 'builder' phase
COPY --from=builder /app/build /usr/share/nginx/html