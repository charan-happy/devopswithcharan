Application-Walkthrough
-------------------------

`Tweettalk` is an application that helps you to collaborate with people. This applicaiton is inspired by Twitter

Following are the usecases of this application :

1. Register - Lets user signup
2. Login - Lets a signed up user login
3. Dashboard - Lets you see tweets posted by other registered users and gives you an option to reply to those tweets or see all replies associtated with those tweets
4. Tweet Now - Lets you compose your tweet
5. My Tweets - Lets you see tweets posted by you. You may edit or delete your tweet here. You can also see replies to your tweet
6. Hashtags - Lets you add one or more hashtags wheenever you compose or edit your tweets
7. Treending - Gives you a tag cloud view for all the tags used in the application. Clicking on any tag navigates you to the associated tweets

# Application Architecture

`Tweet Talk` is a MEAN Stack Application. It has a front end built using Angular, MongoDB is used as a backend. Frontend Angular application communicates with MongoDB using API which is build on Node, using EXPREESS framework.
Let's go through each tier one by one

**MongoDB Atlas**
- MongoDB atlas lets you create MongoDB databases on your favourite cloud providers such as Microsoft Azure, AWS and GCP etc. We have selected AWS/Azure . Hence, our MongoDB cluster lies in Microsoft Azure

- The cluster has database `DBTweets` which has following collections
- 1. Users - That holds all the registered users' information
  2. Tweets - That holds all the tweets posted by the users
  3. Replies - That holds all the replies against the tweets
  4. Tags - That holds all the hashtags of the tweets and the replies
 
     The front-end application communicates with these collections using Express API

**NodeJS API**
- The API is built using the Express framework built on Nodejs . The Express Project (i.e; backend) project stores MongoDB related information in Config.js it is the configuration file; the API Interacts with MongoDB.

- API exposes URLs called as `Routes` to meet different usecases. The routes are invoked from the front-end application. All Routes are part of the `routes` directory of the Express project

- **The Angular Front End**
- - The Front end application is created using Angular. The angular application has configuration file - config.jts which stores API connection information, using which it invokes the API
 
  - ## Application setup
 
  - **Required softwares** that must be installed on the local machine for executing the TweetTalk Project are :
 
  - - Node.js (min version required 10.x) - [official site](https://nodejs.org/en/)
    - Visual Studio code - [official site](https://code.visualstudio.com/)

    # Application Execution -locally


    ![npm cli](https://github.com/charan-happy/DevopsWithCharan/assets/89054489/30cfb4b0-eccd-4feb-9904-e33c3b8327cd)

    ![Application navigation](https://github.com/charan-happy/DevopsWithCharan/assets/89054489/5229cb36-e396-41fc-bce5-f6ffc4220a3f)

    



    
