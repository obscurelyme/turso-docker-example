FROM node:20-alpine3.19
USER node
WORKDIR /app
COPY --chown=node:node package.json package-lock.json ./

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
  then npm ci; \
  else npm ci -production; \
  fi

# For turso on alpine, we need to manually install a musl package
# RUN npm install @libsql/linux-x64-musl
# COPY /tmp/libsql_bundle/node_modules/@libsql/linux-x64-musl /app/node_modules/\@libsql/linux-x64-musl
COPY --chown=node:node . .
EXPOSE 3000
CMD ["npm", "run", "dev"]