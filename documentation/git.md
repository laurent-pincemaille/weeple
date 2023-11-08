# Workflow
 
1. Création de feature
```bash
# Create a new branch and place Head on it
git checkout –b feature/myfeature
 
# Commit changes
git add .
git commit -m "Mon message de commit"
 
# Push branch to remote (creating a remote branch with same name)
git push -u origin feature/myfeature
```
 
2. Merge de feaure
```bash
# Update main
git checkout main
git pull origin main
 
# Back to feature and merge with main
git checkout feature/myfeature
git merge main
git push origin feature/myfeature
 
# Pull request
 
# Clean up
git branch -d feature/myfeature
git push origin --delete feature/myfeature
```
 
# Cheatsheet
 
## Common Mistakes
 
1. Cancel [unpubliched] modifications
 
```bash
# Remove unstaged modifications  (tracked files)
git checkout myfile.py (on a file)
git checkout -- . (all files)
 
# Roll back to a previous commit but keep:
    # [Default/mixed : - keep the code in the working directory in an untracked status ]
    # [soft: keep the code in working directory and in staging area (no need to git add .)]
    # [Hard: Keep only untracked files (if you want to erase all: git add . && git reset --hard HEAD)]
git reset -hard HEAD (previous state - no commit)
git  reset [--soft||--hard] 1fed3 (commit_hash state)
```
 
2. Manipuler l'historique
 
```bash
# (from branch to change)
git rebase -i #and chanhge squash and commit message
 
# Change previous commit message
git commit --amend -m "Message of commit"
 
# Commit on the wrong branch: copy a commit from an other branch [from the good branch]
git cherrypick 1fed3(commit-hash)
```
 
3. Restore a git reset --hard
```
git reflog (to pick the hash id accidentally erased)
git checkout 1fed3(commit-hash to restore)
git branch -b backup (my backup branch)
```
4. Undoing bad remote-commits (pushed)
```bash
git revert 1fed3
```
 
## Remote Repo
1. Add remote repo:
 
Add remote 1 (github) and remote 2 (bitbucket)
```
git remote add <remote> <url>
git remote add origin git@github.com:jigarius/toggl2redmine.git
git remote add upstream git@bitbucket.org:jigarius/toggl2redmine.git
```
 
2. Add a branch
 
First push (-u to specify)
```
git push -u origin HEAD:master
git push <remote> <branch>
```
 
2. Remove remote repo
```
git remote remove upstream
```