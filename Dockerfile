FROM amazonlinux:2

# Install NodeJS
RUN curl --silent --location https://rpm.nodesource.com/setup_14.x | bash -
RUN yum -y install nodejs
RUN npm i lerna@5.1.6 -g
RUN npm i pkg@5.7.0 -g

USER minion

WORKDIR /usr/app

# Clone the source code and configure workspace
COPY --chown=minion . /usr/app

# build
RUN npm install
RUN lerna bootstrap --hoist
RUN lerna run build
RUN lerna run build-exe

# TODO: multistage builds 
# launch or run the application
CMD ["sh","/usr/app/user_data.sh"]
