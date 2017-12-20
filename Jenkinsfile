#!groovy

node {
	// currentBuild.displayName = "${BUILD_NAME}_${currentBuild.number}"
	// currentBuild.displayName = "${GIT_BRANCH}"

	stage "Pull SCM"

	workspace = '/home/jenkins/workspace/Ruby'

	dir(workspace) {
		checkout scm
		sleep 5
	}

	deleteDir()

	stage "Check Syntax"
	sh "find . -name *.rb"
	// sh "FILES=\$(find . -name "*.rb*")"
	// sh "for i in \${FILES}; do ruby -c \$i; done; \\"

	stage "Install Dependencies"
	sh "gem install bundle"

	stage "Run Rubocop"
	sh "ls -ltr /home/jenkins/workspace/Ruby/"
	sh "export HOME=/home/jenkins/workspace/Ruby"
	sh "rubocop ${workspace}"

	stage "Run Rspec"
	sh "rspec"
}
