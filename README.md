# Portfolio

## Go to website [Click](https://vohongquan-67e37.web.app/#/)


# How to deploy flutter web using firebase hosting (Good for me)

## Enable web & release
```
Run the following command in your terminal.
flutter config --enable-web

flutter run -d chrome --release
```
## Deploy flutter web using firebase hosting
```
Make sure you have added the project to the firebase console

Run the following command in your terminal.

* Install firebase-tools
$ npm install -g firebase-tools

* Login firebase
$ firebase login

* If you are already logged in and want to re-login as different account
$ firebase logout

* Hosting
$ firebase init hosting
```

:point_right: Use an exisiting project

:point_right: Your project name in firebase console

:point_right: What do you want to use as your public directory? build/web

:point_right: Configure as a single-page app(rewrite all to /index.html)? (I choose YES)

:point_right: Another question, just answer NO

```
Run the following command in your terminal.

* Deploy
$ firebase deploy
```
## Wait a moment and check you firebase hosting ,You will see your website link

Note:If your website is not successful then delete build folder, .firebaserc , firebase.json , .firebase folder and and start over from login firebase 
