github-create()
{
	if [ -n "$1" ]
	then
		repo_name=$1
	else
		repo_name=`pwd | xargs basename`
	fi

	echo "set Repo name to ${repo_name}"

	curl -u 'dslu7733:7ca312ff34afb105d4cea7a11b5c8694f2e9b71b' https://api.github.com/user/repos -d '{"name":"'$repo_name'"}'
	git remote add origin git@github.com:dslu7733/$repo_name.git
	

}


push-all()
{
	if [ -n "$1" ]
	then
		common=$1
	else
		common="update"
	fi

	git add .
	git commit -m ${common}
	git push
}
