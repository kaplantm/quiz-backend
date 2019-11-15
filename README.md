# Tutorials Referenced

https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
https://scoutapm.com/blog/activerecord-includes-vs-joins-vs-preload-vs-eager_load-when-and-where
https://docs.docker.com/compose/rails/

1. https://scoutapm.com/blog/dockerizing-a-rails-app
2. https://scoutapm.com/blog/deploying-to-aws-part-i-running-a-rails-app-on-fargate

3. https://dev.to/jamby1100/more-than-hello-world-in-docker-run-rails-sidekiq-web-apps-in-docker-1b37
4. https://dev.to/jamby1100/deploy-rails-in-amazon-ecs-part-2-push-an-image-to-ecr-43fl
5. https://dev.to/jamby1100/deploy-rails-in-amazon-ecs-part-3-create-the-rds-database-task-definition-and-load-balancer-1ffe
6. https://dev.to/jamby1100/deploy-rails-in-amazon-ecs-part-4-create-an-ecs-cluster-338f
7. https://dev.to/jamby1100/automate-docker-build-with-aws-codebuild-9om

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# Notes

Test cross origin requests
curl -H "Origin: http://acme.com/" -H "Access-Control-Request-Method: POST" -H "Access-Control-Request-Headers: X-Requested-With" -X OPTIONS --verbose http://localhost:3000/quizzes

docker-compose run api rake db:drop

docker-compose build
docker-compose up
docker-compose run api rake db:create
docker-compose up --build
rails db:migrate RAILS_ENV=development
