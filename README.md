# Carrot U Admin

This is the final project for the 2019-2020 Carrot U session. It will manage students,
mentors, and sessions of the course.

# Setup instructions

## Clone the GitHub repo

This pulls the source code for the app to your laptop.

```bash
% cd                # go to your home directory
% mkdir git         # create a directory for git (if needed)
% cd git            # go into the git directory
% git clone https://github.com/carrot-u/carrot-u-admin-app/  # check this repo out from git
```

## Run the bundler

This pulls all the gems (shared libraries) needed by the app to your machine.

```bash
% cd carrot-u-admin-app       # go into the source directory
% bundle install
```

You may get some error messages about the version of `bundler`, needing to update `yarn`,
etc. These should give you instructions about what needs to be done to fix the errors,
just follow those and ask in the #carrot-university channel if you can't resolve the
problem.

## Set up Postgres

You should have already installed Postgres during the setup for the course, but you
need to create the database for the project.

Create the database:

```bash
% createdb carrot_u_admin
```

Run the migrations:

```bash
% rake db:migrate
```

## Configure Heroku

Heroku is the cloud platform we will be running the app on. You can deploy to it
using `git`, with some setup work.
Detailed instructions are [here](https://devcenter.heroku.com/articles/git).

Simple instructions below.

Install Heroku command line (CLI) with `brew`:

```bash
% brew tap heroku/brew && brew install heroku
```

Connect to the Heroku app:

```bash
% heroku git:remote -a carrot-u-admin
```

For setup this is all you need to do, but now you can push code to Heroku, run
db migrations, and launch the app. See 
[the Heroku docs](https://devcenter.heroku.com/articles/getting-started-with-ruby)
to learn more about using Heroku.

# Running your app

## Local

You can run locally using rails:

```bash
% rails s
``` 

This allows you to access your local version of the app at http://locahost:3000/

Use this when developing code.

## Heroku

You can launch the Heroku app using the Heroku command line:

```bash
% heroku apps:open
```

or you can just browse to https://carrot-u-admin.herokuapp.com/

Use this to see what the current master branch of the code looks like.

## Okta

Note that we are connecting to this app using Okta, so the version running on Heroku
will also appear on your [Okta home page](https://instacart.okta.com/app/UserHome) - look for "Carrot U".




