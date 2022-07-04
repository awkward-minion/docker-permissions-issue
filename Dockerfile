# Must be linux
FROM amazonlinux:2


# Install NodeJS
RUN yum install -y shadow-utils && yum clean all && useradd minion
RUN yum install tar -y
RUN curl --silent --location https://rpm.nodesource.com/setup_14.x | bash -
RUN yum -y install nodejs

# Create a Non root user
RUN usermod -a -G minion root
# RUN chown minion:minion -R /usr/app

USER minion

RUN mkdir ~/.npm-global
RUN npm config set prefix '~/.npm-global'
ENV NPM_CONFIG_PREFIX=~/.npm-global

ENV PATH=/root/.npm-global:$PATH
RUN npm i lerna@5.1.6 -g --loglevel verbose

WORKDIR /usr/app

# Clone the source code and configure workspace
COPY . /usr/app

# build
RUN lerna bootstrap
RUN lerna run build --concurrency=15

# launch or run the application
CMD ["sh","/usr/app/scripts/dev/user_data.sh"]
