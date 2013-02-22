git log --pretty=oneline

----- index -----
git branch commands
go to previous commit
when app crashes
fetch latest changes
delete a remote branch
add new repository (own account and monarch account)
----- index ---------

###### git branch commands ######

	git branch  #(list your available branches)
	git branch -a #(list your available local branches)
	git branch -r#(list your available remote branches)
	git checkout <branch_name> #(switch to a branch)
	git branch <branch_name> #(create a new branch)
	git checkout -b <branch_name> #(create and immediately switch to a branch)
	git branch -d <branch_name> #(delete a branch)
	git merge <branch_name> #(merge to master when in master)
	
	type in command line
	rails g migration drop_rails_admin_histories

##### go to previous commit ######
	git reset --hard 0b86c9823dd60a01709ac16cbba0b84f258e047d
	git push -f <remote> <branch_name>

	# to rollback master changes
	# reset to previous head
	git push --force
	git push heroku master --force

##### when app crashes #########
	ps auxwww |grep ruby
	pgrep ruby # a different command same result
	kill # kill stalled process id

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

# add new repository
git remote add origin git@github-monarch:monarchmobile/new_repo.git (rod to monarch)
git remote add origin git@github:rodmanhe/new_repo.git (rod to rod)
git remote add origin git@github:monarchmobile/new_repo.git (andrew to monarch)


