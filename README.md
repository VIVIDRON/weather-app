# Weather App

A simple, user-friendly weather application that provides real-time weather updates, hourly forecasts, and temperature details. Built using Flutter, the app ensures a seamless experience across Android and Ios devices.

## Features

- 🌦 **Current Weather:** Displays the current temperature, weather conditions.
- 🕒 **Hourly Forecast:** Shows a 5-hour weather forecast with temperature and weather icons.
- 🌡 **Temperature Units:** Temperatures displayed in Celsius.
- 📱 **Responsive Design:** Optimized for different screen sizes.

## Video Preview

![weather_app](https://github.com/user-attachments/assets/65f60865-5510-4c5e-9538-69264e4fc3e8)

## Installation

### Prerequisites

- Flutter SDK installed on your system.
- Android Studio or Visual Studio Code (optional for development).
- A device or emulator for testing.

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/weather-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd weather-app
   ```

3. Fetch the dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Technologies Used

- **Flutter:** Cross-platform UI toolkit.
- **Dart:** Programming language for Flutter.
- **API Integration:** Fetching real-time weather data from [OpenWeatherMap API](https://openweathermap.org/api).

## API Usage

- Register on OpenWeatherMap to get an API key.
- Replace `YOUR_API_KEY` in the code with your actual API key.

## Folder Structure

```
weather-app/
├── lib/
│   ├── main.dart           # Entry point of the app
│   ├── screens/            # Contains all screen widgets
│   ├── widgets/            # Reusable widgets like forecast cards
│   ├── models/             # Data models for weather data
│   └── services/           # API service logic
├── assets/                 # Images and other static assets
├── pubspec.yaml            # Project dependencies
└── README.md               # Project documentation
```

## Contributing

Contributions are welcome! If you'd like to improve this project:

1. Fork the repository.
2. Create a new branch for your feature:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature-name"
   ```
4. Push to the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a Pull Request.

Feel free to reach out with questions, suggestions, or feedback. Happy coding! 😊
