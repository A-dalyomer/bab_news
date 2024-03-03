## Bab News APP


## Summary

I made this app utilizing my experience in the flutter framework, dart and programming concepts,
hoping it meets the requirements you needed for examining my experience.

You can check the [Key features] and the git log for project build process details.

This app's main goal is to view the top stories from the new york times API,
following the basic architecture principles of android and present ui features like the search, 
section filters, changing listview items view type and viewing a story in detail. All in responsive
UI.

As requested i used the riverpod for state management, although i used multiple state management 
solutions in my experience, including the bloc, provider and getx. i really had fun reading the 
documentation of riverpod on their official documentations website as prefer to read them.

But as for the network requests library i used dio for building the network feature which handles
all the API requests calls and have core handler for global API errors that might be sent from 
server, as i like this approach since i made it on my own and make the api integration easier and 
reduces error handling logic in the calls.
This central API caller is really useful since we can always change the core network logic and its 
dependencies without the need to edit any other feature in the project.


I would have used the retrofit dependency as preferred but in addition to the reason above, i did
also read the documentation of it too and found out its a code generation client for the dio 
dependency which i could integrate but might have to remove the central caller API for that.




## Key features

- News app made in Flutter framework.
- Responsive UI for all screen sizes.
- Tested on android, Windows and web.
- Dependency injection implemented with get_it and riverpod.
- Project is built by features approach for project expansion probabilities.
- Well documented classes and widgets.
- Unit and integration tests that cover all app elements.
- API logic errors handlers for global and single API calls.
- API UI states views with loading, error, empty data and actual data.
- Search stories, change view type, change stories section and view story details screen.

## App testing

1. An APK release will be included on the git repository for immediate testing.
2. Test from IDE.



## Setup Instructions

1. **Installation:**
    - Run flutter pub get
    - Run the app on an emulator or device

2. **Testing:**
    - I have included a IDE run configuration file for running all tests.
    - Tests files follows a file structure same as the project library files.

## Contributors

- Ahmad Daly omer
