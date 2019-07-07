# The application "Good questions"
## Educational application

## Annotation
The project was implemented on Ruby on Rails (v5.1.2) for educational purposes.

## Short description
The application is designed to communicate between users in the format of "question - answer".

## Tested / used technologies:
- reCaptcha, including (in the latest version) Invisible Recapthca
- Many-to-many connection (hashtag functionality)
- Trigram search (search for questions with similar hashtags)

## Install and Run
Before running the application, you must install all the necessary gems and prepare the database. To do this, in the console in the directory with the application, you must run the following commands:

```
bundle install
bundle exec rake db: migrate
```

And it is also necessary to set the environment variables for the reCaptcha operation:

```
RECAPTCHA_ASKME_SITE_KEY
RECAPTCHA_ASKME_SECRET_KEY
```

To start the local server, run the following command:

```
bundle exec rails s
```

The list of all used gems is specified in the Gemfile file.

## Demo
The latest current version of the application is running [here](https://fakeaskme.herokuapp.com/)
