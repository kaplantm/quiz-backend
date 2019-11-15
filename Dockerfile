FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# EXPOSE 3000

# Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]
CMD bundle exec rails s -p ${PORT} -b '0.0.0.0'