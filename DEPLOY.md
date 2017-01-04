The demo apps are found in the repository in different branches.
they are deployed to heroku using forks of one original app.

See

* [Managing Multiple Environments for an App](https://devcenter.heroku.com/articles/multiple-environments)
* [Forking Applications](https://devcenter.heroku.com/articles/fork-app)

After setting everything up you deploy using

```
git checkout basic_auth
git push kanban-2 basic_auth:master
heroku run rails db:migrate -a kanban-2
```
