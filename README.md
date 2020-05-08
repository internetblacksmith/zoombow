# Zoom + KeyBow = ZoomBow

original concept from elkentaro: https://github.com/elkentaro/zoomButton

## Hardware
 * [Raspberry pi Zero](https://shop.pimoroni.com/products/raspberry-pi-zero-w) ( any version will due but if you don't feel comfortable with the soldering iron the [WH](https://shop.pimoroni.com/products/raspberry-pi-zero-wh-with-pre-soldered-header) version is what you need)
 * [Pimoroni Keybow](https://shop.pimoroni.com/products/keybow-mini-3-key-macro-pad-kit)
 * A microSd card (8GB up)

## Setup
First assemble your KeyBow and setup the microSD card as explained in the KeyBow page on the Pimoroni website on the KeyBow store page then simply clone thes Repository on the root of the MicroSD then edit the file keys.lua replacing the line second line

    require "layouts/default" - Numberpad

with

    require "zoombow/main"

then simply put the microSd in your pi and connect it to your pc using the second usb port (the one nearer to the HDMI) and go nuts with it