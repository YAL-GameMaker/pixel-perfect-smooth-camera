# Pixel-perfect smooth camera

When designing traditional pixel-art games (in general and in GameMaker specifically), it is generally desirable to keep your camera pixel-perfect to avoid rotated pixels and reduce various other artifacts:

![ppsc-1](https://user-images.githubusercontent.com/731492/101706746-77887580-3a92-11eb-9add-2a8d59bc1fb9.gif)

This, of course, comes with an unfortunate caveat: it can be very hard to make your camera movement look good - especially if small speeds and/or acceleration/deceleration are involved:

![ppsc-2](https://user-images.githubusercontent.com/731492/101706719-650e3c00-3a92-11eb-996e-db442a774b89.gif)

This is a demonstration of an approach that allows you to escape this problem - by making the camera 1px wider and taller and having it draw to a surface, we are able to then offset this surface to make up for fractions in the camera coordinates:

![ppsc-3](https://user-images.githubusercontent.com/731492/101706727-69d2f000-3a92-11eb-9c4b-10e3f93a061a.gif)

An alternate approach involves drawing a half-pixel (at the game's internal resolution) frame at the edges of the screen so that you can wiggle the game's default surface (`application_surface`) under it without making it apparent to the player.

## Credits

* Example by [YellowAfterlife](https://yal.cc)
* Tileset and background taken from ["Pixel Adventure"](https://opengameart.org/content/pixel-adventure-1) by Pixel Frog
* Inspired by Hyper Light Drifter camera  
  (which likely uses the "alternate approach" described here)