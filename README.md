# Dev Bootcamp Portfolio

This is a portfolio of some of the code challenges and group projects I completed while a student at Dev Bootcamp.

The challenges contained in the subdirectories of this repository were merged from their original repositories preserving the original commit history. I used the code `git remote add -f REMOTE_NAME REMOTE_URL` to add the original repos as remotes, and then used the code `git merge -s recursive -Xsubtree=REMOTE_NAME REMOTE_NAME/FEATURE_BRANCH --allow-unrelated-histories` to merge the appropriate branch to a new feature branch, preserving the original commit history. The commits from the original repositories do not readily appear in Github file histories, but can be accessed by tracing parent commits of individual files. Commit histories can be more readily traced by cloning this repository to your machine and running `git log`.

## Code Challenges

* [Binary Search](binary-search) - a simple binary search algorithm. Completed as a pair programming challenge during week 1 in approximately one hour.
* [Word Search](word-search) - a word search algorithm. Completed as a solo challenge during week 1.
* [Ruby Racer](ruby-racer) - a simple console game completed as a solo challenge during week 1.
* [Multi-author Blog](blog) - a multi-author blog web app powered by Sinatra and PostgreSQL. Includes a script to seed the database for easy testing.