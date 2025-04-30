# Simple Weather App

This is a weather app I made in flutter using the openweathermap api. It requests permission from the user for there location, so it can be used to show the current condition via a weather icon, the current temp, the high and the low point temperatures, wind speed, and humidity. The user can also use the search bar at the top of the screen to type in a location to recieve weather data about that location as well. Users can also refresh the app by swiping down vertically which refreshs the data for their current location.

## Project Status

I am no longer working on this project.

## Installation

Clone repo, install requirements, and fill out fields that are specific to you
1. Have VSCode and make sure you have the flutter plugin downloaded
2. Download or Clone the repo
3. Run flutter pub get in your terminal to download all of the flutter packages
4. Go [here](https://openweathermap.org/api) to make a free openweathermap account to generate your free api key
5. Next create folder inside of the lib folder called secrets then inside of the secrets folder create the file api_key.dart. Inside this file add in your api key like this: ``` const OPENWEATHERAPIKEY = "YOURAPIKEYHERE" ```
6. Next use the shortcut Ctrl+Shift+P in VSCode, then type Flutter: SelectDevice. And select your preferred debuging device, this can be a physical device like a phone or a tabelt or an emulator you have downloaded. BE AWARE requesting user location access does not work on windows, web, and linux. If you use an Iphone Emulator go to Feauture > Location, and select one their simulated locations. If using an Android Emulator click on the 3 dots in the Emulator menu > Location. Then manually set a mock location using latitude and longitude.
7. Once you have your preferred device selected you can navigate to the main.dart file located in the lib folder and click the run and debug button or you can run this command in your terminal ``` flutter run ``` and select a connected device using the num keys to run the app.

## Demo 

<img src="https://github.com/Juno-whut/Weather-App/blob/main/ReadMeAssets/Screenshot_20250430-155823.png" alt="Screenshot from App" width="300"/>
<img src="https://github.com/Juno-whut/Weather-App/blob/main/ReadMeAssets/Screenshot_20250430-155832.png" alt="Screenshot from App" width="300"/>

Heres a link to the full demo video on my youtube channel: [Full App Demo Video](https://youtu.be/Ppp-IdSLEco)

## Contributing

Right now I have taken the project as far as I want to go so I'm not looking for contributers or maintainers. However feel free to download, clone , or fork the repository for your own use.

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Self Promotion
I am currently looking for a full time position as a level 3 mobile or full stack engineer. If you think I would be a good fit check out my portfolio website and contact me on there [PortfolioWebsite]().