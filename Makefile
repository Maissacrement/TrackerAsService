
#!make
DOCKER:=@docker
APP_NAME=tracker

env:=.env
include $(env)

build:
	${DOCKER} build -t ${APP_NAME} .

start:
	${DOCKER} run --env-file ${env} -p ${PORT}:${PORT} -d ${APP_NAME}

reload:
	${DOCKER} run --env-file ${env} -v ${PWD}:/app -p ${PORT}:${PORT} -it ${APP_NAME}

${APP_NAME}: build start
${APP_NAME}_dev: build reload