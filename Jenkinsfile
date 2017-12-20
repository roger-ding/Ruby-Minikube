#!groovy

node {
	// currentBuild.displayName = "${BUILD_NAME}_${currentBuild.number}"
	// currentBuild.displayName = "${GIT_BRANCH}"

	stage "Display ENV Variables"
	sh "printenv"

	stage "Pull SCM"
	scm_dir = "${JENKINS_HOME}"

	dir(scm_dir) {
		checkout scm
		sleep 5
	}

	deleteDir()

	stage "Check Syntax"
	sh "cd ${scm_dir}"
	// sh "find . -name *.rb"
	sh "find ${scm_dir} -name=*.rb -exec ruby -c {} \\;"
	// sh "for i in ${FILES}; do ruby -c $i; done;"

	stage "Install Dependencies"
	sh "gem install rubocop rspec simplecov simplecov-rcov simplecov-json"

	stage "Rubocop"
	sh "rubocop ${scm_dir}"

	stage "Rspec"
	sh "rspec spec --format documentation ${scm_dir}"

	publishHTML ([
			allowMissing: false,
			alwaysLinkToLastBuild: false,
			keepAll: true,
			reportDir: 'coverage',
			reportFiles: 'index.html',
			reportName: "RCov Report"
	])
}
