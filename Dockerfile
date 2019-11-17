FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Sets the path where the app is going to be installed
ENV RAILS_ROOT /rails-api

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install
COPY . .

# EXPOSE 3000
ENTRYPOINT ["bundle", "exec"]

# Start the main process.
CMD bundle exec rails s -p ${PORT} -b '0.0.0.0'

# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]