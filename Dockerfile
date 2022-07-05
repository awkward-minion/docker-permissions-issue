FROM amazonlinux:2

# Install NodeJS
RUN curl --silent --location https://rpm.nodesource.com/setup_14.x | bash -
RUN yum -y install nodejs

USER minion

WORKDIR /usr/app

# Clone the source code and configure workspace
COPY --chown=minion . /usr/app

# build
RUN npx lerna bootstrap --ci
RUN npx lerna run build --concurrency=15

# TODO: multistage builds 
# launch or run the application
CMD ["sh","/usr/app/user_data.sh"]
