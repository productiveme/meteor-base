#!/usr/bin/env bash

#!/usr/bin/env bash

# Versions to build this Docker image for (Meteor 3.2+ only)
meteor_versions=( \
	'2.7' \
    '3.2' \
	'3.3'
)

latest_version="${meteor_versions[*]: -1}"

# Get the array of versions to loop through, either a particular single version passed in or all of the versions listed above
if [ -n "${CI_VERSION:-}" ]; then
	versions=( "$CI_VERSION" )
elif [[ "${1-x}" != x ]]; then
	versions=( "$1" )
else
	versions=( "${meteor_versions[@]}" )
fi
