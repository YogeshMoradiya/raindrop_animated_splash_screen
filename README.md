# Raindrop Animated Splash Screen 🌧️
A Flutter package for a **beautiful raindrop splash animation**.  
Customize color, duration, and text, then navigate to your main app screen.

## ✨ Features

✅ Raindrop falling animation.  
✅ Configurable color and text.  
✅ Auto navigate to next screen.  
✅ change background color.
✅ Lightweight and easy to use.   

---
## How to use it ?

### 1. Add dependency
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  raindrop_animated_splash_screen: <latest_version>
```  

### 2. Install it You can install packages from the command line: 

with pub :
```
$ pub get
```
with Flutter : 
```
$ flutter pub get
```
### 3. Import it

Now in your `Dart` code, you can use :

```
import 'package:raindrop_animated_splash_screenraindrop_animated_splash_screen.dart';
```
### 4. Use it

Using `raindrop_animated_splash_screen` in your project is super simple .  

“Just wrap your screen with RaindropSplashScreen, and it will automatically handle the splash animation and navigate to your next screen.”
---

## Basic usage

Add WithOut Any Customization :


```
 RaindropSplashScreen(
        // Screen to show after splash animation finishes
        nextScreen: const HomePage(),
      ),
```

Add All Customiztion According Your Screen :

```
RaindropSplashScreen(
        // Screen to show after splash animation finishes
        nextScreen: const HomePage(),

        // Text shown below the raindrop animation
        title: "Raindrop Splash",

        // Color of raindrop + hole reveal effect
        color: Colors.blue,

        // Duration of splash animation
        duration: const Duration(seconds: 3),
      ),
```

## 📸 Screenshots & Demo
| Without customization | With customization |
|------------------------|--------------------|
| ![Pi7_Gif](https://github.com/user-attachments/assets/dca938a9-3d63-4428-8c21-92aef408fbf7) | ![Pi7_Gif (1)](https://github.com/user-attachments/assets/501c4a4f-331b-4eac-927c-f2571c7702e3) | 

