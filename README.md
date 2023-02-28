# IMDb App Overview

This app includes the Main Screen, Search IMDb Screen and IMDb Details Screen. User can search the movie name using 'The Open Movie Database' API.

#Technology Stack
 - SwiftUI
 - Swift 
 - MVVM
-  Xcode 13.4
-  iOS 15.5

#Description

In the Main screen, user can select the search section in order to search the movie that will open the Search IMDb screen.

In the Search Screen, user need to enter the text to get the  results. If searched results are more than 10 and user reached at last visble itme here we are using pagination to ge the next 10 items. We do the pagination until we reach the total results count. User can select the searched movie to view the details.

In the Details screen , User can view the All the info related to movie like imdb rating, release year, Name , Poster ,plot and genre.
