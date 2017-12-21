#!groovy

node {
	currentBuild.displayName = "TEST_${currentBuild.number}"

	directory = "/var/jenkins_home/jobs/Playground/jobs/Ruby PR Validator/workspace@script"

	stage "Pull SCM"
	// scm_dir = "${JENKINS_HOME}"

	dir(directory) {
		checkout scm
		sleep 5
	}

	stage "Check Syntax"
	sh "find ${scm_dir} -name *.rb -exec echo {} \\; -exec ruby -c {} \\;"

	stage "Install Ruby Dependencies"
	sh "gem install rubocop rspec simplecov simplecov-html simplecov-json"

	stage "Rubocop"
	sh "rubocop ${directory}"

	stage "Rspec"
	sh "rspec spec --format documentation ${directory}"

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
