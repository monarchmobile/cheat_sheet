git log --pretty=oneline

###### git branch commands ######

	git branch  #(list your available branches)
	git branch -a #(list your available local branches)
	git branch -r#(list your available remote branches)
	git checkout <branch_name> #(switch to a branch)
	git branch <branch_name> #(create a new branch)
	git checkout -b <branch_name> #(create and immediately switch to a branch)
	git branch -d <branch_name> #(delete a branch)
	git merge <branch_name> #(merge to master when in master)

# delete branch off of git
	git push origin --delete <branch_name>

# regular push to git 
	git add .
	git commit -m "whatever"
	git push

# if repo already exists and causing trouble
	git remote rm origin

##### go to previous commit ######
	git reset --hard 0b86c9823dd60a01709ac16cbba0b84f258e047d
	git push -f <remote> <branch_name>

	# to rollback master changes
	# reset to previous head
	git push --force
	git push heroku master --force

# fetch lates changes
	git fetch
	git merge origin/master

	git checkout -b <branch_name>
	# / make your changes
	git add .
	git commit -m "message"
	git push origin <branch_name>

	git checkout master
	git fetch
	git merge origin/master (if needed)

	git merge <branch_name>
	git push

# delete a remote branch 
	git push origin --delete <branch_name>


# conflicts
	git checkout origin/master file_name
	git add file_name
	git status