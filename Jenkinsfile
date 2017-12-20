#!groovy

node {
	currentBuild.displayName = "${BUILD_NAME}_${currentBuild.number}"
    	// currentBuild.displayName = "${GIT_BRANCH}"

    	stage 'Pull SCM'
    	dir('/home/jenkins/workspace/Ruby') {
		checkout scm
		sleep 5
     	}

    	deleteDir()

    	stage 'Check Syntax'
    	sh "FILES=$(find . -name "*.rb*"); for i in ${FILES}; do ruby -c $i; done;"

    	stage 'Install Dependencies'
    	sh "gem install bundle"

    	stage ‘Run Rubocop’
    	sh "rubocop"

    	stage "Run Rspec"
    	sh "rspec spec —format documentation“
}
