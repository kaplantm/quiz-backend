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

able to connect to local db with tableplus but not psequel
https://www.prisma.io/forum/t/struggling-to-connect-to-docker-psql-database-from-host-machine/6094/6

https://docs.aws.amazon.com/AmazonECS/latest/developerguide/instance-connect.html

api versioning
https://paweljw.github.io/2017/07/rails-5.1-api-app-part-3-api-versioning/

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

curl -H "Origin: https://kaplantm.github.io/angular_flashcards" -H "Access-Control-Request-Method: POST" -H "Access-Control-Request-Headers: X-Requested-With" -X OPTIONS --verbose http://localhost:3000/quizzes

- will list `< Access-Control-Allow-Methods: GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD` if allowed

docker-compose run web rake db:drop

docker-compose build
docker-compose up
docker-compose run web rake db:create
docker-compose up --build
docker-compose run web rails db:migrate RAILS_ENV=development

POSTGRESQL_HOST=raild-quiz-api-1.cccufsjkltzb.us-east-1.rds.amazonaws.com POSTGRESQL_USER_NAME=postgres RDS_PORT=5432 POSTGRESQL_PASSWORD=INSERT_HERE POSTGRESQL_DB=quiz_cards_api_db_prod RAILS_ENV=production bundle exec rake db:create

POSTGRESQL_HOST=raild-quiz-api-1.cccufsjkltzb.us-east-1.rds.amazonaws.com POSTGRESQL_USER_NAME=postgres RDS_PORT=5432 POSTGRESQL_PASSWORD=INSERT_HERE POSTGRESQL_DB=quiz_cards_api_db_prod RAILS_ENV=production bundle exec rake db:migrate

build for ecr
docker build . -t my-rails-app
docker tag my-rails-app:latest 011561437483.dkr.ecr.us-east-1.amazonaws.com/quiz-docker-rails-app:v1.0.0
aws ecr get-login --no-include-email --region=us-east-1
docker push 011561437483.dkr.ecr.us-east-1.amazonaws.com/quiz-docker-rails-app:v1.0.0
