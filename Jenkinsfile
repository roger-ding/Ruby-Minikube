#!groovy

node {
	currentBuild.displayName = "TEST_${currentBuild.number}"

	stage "Pull SCM"
	scm_dir = "${JENKINS_HOME}"

	dir(scm_dir) {
		checkout scm
		sleep 5
	}

	stage "Check Syntax"
	sh "find ${scm_dir} -name *.rb -exec echo {} \\; -exec ruby -c {} \\;"

	stage "Install Ruby Dependencies"
	sh "gem install rubocop rspec simplecov simplecov-html simplecov-json"

	stage "Rubocop"
	sh "rubocop ${scm_dir}"

	stage "Rspec"
	sh "rspec spec --format documentation ${scm_dir}"

	stage "Publish Rcov Report"
	publishHTML ([
			allowMissing: false,
			alwaysLinkToLastBuild: false,
			keepAll: false,
			reportDir: 'coverage',
			reportFiles: 'index.html',
			reportName: "RCov Report"
	])
}
