FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client
RUN npm install -g yarn

WORKDIR /optic_chat

COPY Gemfile /optic_chat/Gemfile
COPY Gemfile.lock /optic_chat/Gemfile.lock

RUN bundle install

COPY . /optic_chat

COPY package.json yarn.lock ./
RUN yarn install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 5000

CMD ["rails", "server", "-b", "0.0.0.0"]
