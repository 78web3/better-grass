FROM node

WORKDIR /app

ENV user_ids_var=
ENV NODE_ENV=production

# Install pm2
RUN npm install -g pm2

COPY ./ .

# Install all dependencies
RUN npm install

# Copy the environment example file and start modifying the contents
# RUN cp ".env.example" ".env"

# Set the environment variables
# RUN sed -i "s/USER_IDS=/USER_IDS=$user_ids_var/g" .env && sed -i "s/NODE_ENV=/NODE_ENV=production/g" .env

# Start the app
CMD [ "pm2-runtime", "start", "pm2.config.js" ]