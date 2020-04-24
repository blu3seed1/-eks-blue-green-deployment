#Use nginx base image
FROM nginx

# Delete default index.html
RUN rm /usr/share/nginx/html/index.html


# Copy source code to working directory
COPY index.html /usr/share/nginx/html

