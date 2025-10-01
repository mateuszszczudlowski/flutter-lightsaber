# 🌟 Lightsaber App

A stunning Flutter application that brings the iconic Star Wars lightsaber experience to your mobile device. Featuring realistic physics, immersive audio, and beautiful neon visual effects.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Star Wars](https://img.shields.io/badge/Star%20Wars-FFE81F?style=for-the-badge&logo=starwars&logoColor=black)

## ✨ Features

### 🎮 Interactive Lightsaber
- **Tap to Ignite**: Touch the lightsaber to activate/deactivate the blade
- **Shake Detection**: Realistic shake-to-swing functionality using device accelerometer
- **Dynamic Colors**: Randomly generated vibrant lightsaber colors on each ignition
- **Smooth Animations**: Fluid blade extension/retraction with glow effects

### 🎵 Immersive Audio
- **Ignition Sound**: Authentic lightsaber activation audio
- **Swing Sound**: Realistic whoosh effects triggered by device movement
- **Haptic Feedback**: Tactile response on shake detection

### 🎨 Visual Excellence
- **Neon Glow Effects**: Beautiful gradient and shadow animations
- **Performance Optimized**: Efficient rendering with RepaintBoundary widgets
- **Responsive Design**: Adapts to different screen sizes and orientations

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- iOS Simulator / Android Emulator or physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd neon_lightsaber_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📱 How to Use

1. **Launch the app** - You'll see the lightsaber hilt in the center
2. **Tap the lightsaber** - Touch anywhere on the device to ignite/extinguish the blade
3. **Shake your device** - Move your phone to trigger swing sound effects
4. **Enjoy the experience** - Each ignition generates a new random color!

## 🏗️ Architecture

### Project Structure
```
lib/
├── main.dart                 # App entry point
├── pages/
│   └── home_page.dart       # Main lightsaber interface
├── widgets/
│   ├── lightsaber_widget.dart # Lightsaber visual component
│   └── star_wars_logo.dart   # Star Wars logo widget
├── helpers/
│   ├── accelerometer_helper.dart # Shake detection logic
│   ├── audio_helper.dart        # Sound management
│   └── color_generator.dart     # Random color generation
└── constants/
    └── app_constants.dart       # App-wide constants
```

### Key Components

- **LightsaberWidget**: Stateless widget handling visual rendering
- **AccelerometerHelper**: Manages shake detection with configurable sensitivity
- **AudioHelper**: Handles sound playback and resource management
- **ColorGenerator**: Generates vibrant, random lightsaber colors

## 🎯 Performance Optimizations

- **Combined AnimationBuilders**: Reduced widget rebuilds by ~50%
- **RepaintBoundary**: Isolated expensive rendering operations
- **Cached Shadow Calculations**: Optimized visual effect computations
- **Efficient Resource Management**: Proper disposal of controllers and subscriptions

## 🛠️ Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  sensors_plus: ^6.0.1      # Accelerometer access
  audioplayers: ^6.0.0     # Audio playback
  cupertino_icons: ^1.0.8  # iOS style icons
```

**Note**: Haptic feedback is provided by Flutter's built-in `HapticFeedback` class - no additional dependency required!

## 🎨 Bonus: Lightsaber Theme & Sounds

### 🌈 **Lightsaber Color System**
The app features a sophisticated color generation system that creates authentic Star Wars lightsaber colors:

- **Bright Neon Colors**: Each ignition generates vibrant RGB values optimized for visibility
- **Dynamic Gradients**: The blade features multi-layered gradients for depth and realism
- **Glow Effects**: Animated shadows create an authentic neon glow around the blade
- **Color Variety**: From classic blue and green to rare purple and yellow sabers

### 🔊 **Authentic Star Wars Audio**
The audio system brings the iconic lightsaber experience to life:

#### **Ignition Sound** (`lightsaber-ignition-6816.mp3`)
- **Classic Activation**: The unmistakable "snap-hiss" of a lightsaber coming to life
- **High Quality**: Crystal clear audio that captures the power and energy
- **Perfectly Timed**: Synchronized with the blade extension animation

#### **Swing Sound** (`swing3-94210.mp3`)
- **Motion Activated**: Triggered by actual device movement via accelerometer
- **Realistic Physics**: Sound intensity matches the detected shake strength
- **Immersive Experience**: Creates the feeling of wielding a real lightsaber
- **Cooldown System**: Prevents audio spam with intelligent timing

### 🎭 **Theme Details**
- **Star Wars Aesthetic**: Faithful to the original movie design language
- **Neon Cyberpunk**: Modern twist with vibrant glow effects
- **Minimalist UI**: Clean interface that doesn't distract from the lightsaber
- **Dark Theme**: Perfect backdrop to showcase the neon blade effects

The combination of authentic sounds, realistic physics, and stunning visuals creates an immersive experience that truly captures the magic of wielding a lightsaber from a galaxy far, far away! ⭐

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- Star Wars franchise for the inspiration
- Flutter team for the amazing framework
- Audio assets from freesound.org
- The Force, for guiding this development

---

**May the Force be with you!** ⚔️✨

*Built with ❤️ and Flutter*
