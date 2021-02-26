
Original App Design Project - README Template
===
# TinderTunes

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview

### Description
Tinder but for your songs. Users will swipe on songs/artists to create a playlist. This will allow for users to find new songs in a specific genre or find new genres in general.

### Progress as of February 25, 2021
- Spotify API is connected to the app
- Once a user logs in, they are transitioned to the swiping page
- An app icon and a loading page have been created


<img src="http://g.recordit.co/rRMgJWiCwQ.gif" width=250><br>


### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Music
- **Mobile:** Would mostly be used on a mobile device because we want to implement swiping as the main functionality to make your playlist. A website could be a future implementation but our focus is mobile.
- **Story:** The user will be given recommended songs and artists which they can swipe left or right on to help curate their playlists.
- **Market:** Anyone who has a spotify and is looking for a new playlist or just a way to reshuffle their own playlist.
- **Habit:** Could be used whenever they feel like looking for new music, or rediscover music they used to listen to.
- **Scope:** Initially will be just a solo user experience, however people can share their playlists to friends with similar interests, or as a way to get friends into music that you listen to.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* User can login
* User create their profile/set their preferences
* User can swipe left or right on an artist
* User generates a playlist based on artist swipes
* User can add the playlist to their Spotify
* User logs out

**Optional Nice-to-have Stories**

* Details if you click on the artist
* Can cure COVID-19 through the playlist (substitute for the vaccine)

### 2. Screen Archetypes

* Login / Register
   * Users are required to sign in with Spotify before they can begin
* Stream
   * Users will have “infinite scrolling” abilities but with a different scrolling mechanic

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Login Page
* Home Page
* Results page

**Flow Navigation** (Screen to Screen)

* Login Page
   * User will log into Spotify account
* Home Page
   * A modal will display where users will select a genre or genres
   *Modal will disappear, then users will be able to swipe left and right for different artists (left for reject, right for accept)
* Results/Generate Playlist page
   * A button on the home page will lead to the “Generate Playlist” page where a playlist will be created depending on the artists that were swiped left or right



## Wireframes
![](https://i.imgur.com/dQlPaHl.jpg)

### [BONUS] Digital Wireframes & Mockups
![](https://i.imgur.com/JNTOvu4.png)

### [BONUS] Interactive Prototype

## Schema 
### Models
Swiping
| Property    |  Type       |  Description |
| ----------- | ----------- |  ----------- |
| artistName     | String      | Name of swipe artist|
| artistSongs  | Name       | Name of top songs|
| artistListenerCount    | Integer     | Count of swipe artist’s monthly listeners |
| artistCaption     | String      | Caption of swipe artist |
| artistGenre     | String      | Artist types|
| playlistName     | String      | Name of playlist|
| isSwipedLeft     | Bool     | True if artist was swiped left, False if not |
| isSwipedRight     | Bool     | True if artist was swiped right, False if not|

### Networking
* Login Screen
    *  (CREATE/GET) Create account or login to existing account
* Swipe Screen
    * (READ/GET) Query artist information songs & listeners
    * (UPDATE/PUT) Add song/artist to playlist section
* Playlist Screen
    * (POST/PUT) Add playlist to spotify account
* Settings Screen
    * (UPDATE/PUT) Can change login for spotify account
    * (UPDATE/PUT) Change the genre of music artists/songs suggested
    * (UPDATE) Log out of current account


