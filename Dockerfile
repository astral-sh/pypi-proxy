FROM nginx:1.25.4-bookworm

# Install htpasswd
RUN apt-get update && \
    apt-get install --no-install-recommends -y apache2-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Remove default configuration
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copy configration file
COPY nginx.conf /etc/nginx/nginx.conf

# Generate a password file
RUN htpasswd -bc /etc/nginx/htpasswd public heron

EXPOSE 8080
