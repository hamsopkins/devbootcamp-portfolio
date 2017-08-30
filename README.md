# Dev Bootcamp Portfolio

This is a portfolio of some of the code challenges and group projects I completed while a student at Dev Bootcamp.

The challenges contained in the subdirectories of this repository were merged from their original repositories preserving the original commit history. I used the code `git remote add -f REMOTE_NAME REMOTE_URL` to add the original repos as remotes, and then used the code `git merge -s recursive -Xsubtree=REMOTE_NAME REMOTE_NAME/FEATURE_BRANCH --allow-unrelated-histories` to merge the appropriate branch to a new feature branch, preserving the original commit history. The commits from the original repositories do not readily appear in Github file histories, but can be accessed by tracing parent commits of individual files. Commit histories can be more readily traced by cloning this repository to your machine and running `git log`.

## Code Challenges

* [Binary Search](binary-search) - a simple binary search algorithm. Completed as a pair programming challenge during week 1 in approximately one hour.
* [Word Search](word-search) - a word search algorithm. Completed as a solo challenge during week 1.
* [Ruby Racer](ruby-racer) - a simple console game completed as a solo challenge during week 1.
* [Multi-author Blog](blog) - a multi-author blog web app powered by Sinatra and PostgreSQL. Includes a script to seed the database for easy testing.

## Group Projects

* [Babelflow](//hamsopkins/babelflow) - A Stack Overflow clone powered by Sinatra created with three other junior devs over the course of a long weekend after the fifth week on campus at Dev Bootcamp.
* [Remindr](/chi-coyotes-2016/remindr) - A text message reminder scheduling web app powered by Rails and Twilio. See the readme for a link to a deployed version. Created in a team with two other junior devs
* Totem - Final group project for Dev Bootcamp created in a team with three other junior devs. Native Android app to locate other users in augmented reality.
  * [Totem Front End](https://github.com/ajvera/totem-front-end) - Native Android app
  * [Totem Back End](https://github.com/hamsopkins/totem-ws-server) - Node.js websocket server
  * [Video Demonstration](https://www.youtube.com/watch?v=OWmUOp-2MvE)
