require "keybow"

-- Keybow MINI --

system = "macOS"
-- system = "Linux" -- Uncomment for Linux!

key_02_pressed = false

audio_status = false
video_status = false

function setup()
  keybow.use_mini()
  keybow.auto_lights(false)
  keybow.clear_lights()

  key_02_pressed = false

  audio_status = false
  video_status = false

  set_audio_video_leds()
end

-- Key mappings --
function handle_minikey_00(pressed)
  if key_02_pressed then
    volume_down(pressed)
  else
    toggle_audio(pressed)
  end
end

function handle_minikey_01(pressed)
  if key_02_pressed then
    volume_up(pressed)
  else
    toggle_video(pressed)
  end
end

function handle_minikey_02(pressed)
  key_02_pressed = pressed
  if pressed then
    set_volume_leds()
  else
    set_audio_video_leds()
  end
end

function set_audio_video_leds()
  button_led(false, 0, audio_status)
  button_led(false, 1, video_status)
  keybow.set_pixel(2, 0, 0, 0)
end

function set_volume_leds()
  keybow.set_pixel(0, 204, 153, 255)
  keybow.set_pixel(1, 153, 0, 204)
  keybow.set_pixel(2, 255, 255, 0)
end


function press_shortcut(key, pressed)
  set_modifiers_key_down()
  keybow.set_key(key, pressed)
  set_modifiers_key_up()
end

-- Command(⌘)+Shift+A: Mute/unmute audio --
function toggle_audio(pressed)
  press_shortcut("a", pressed)

  if pressed then
    audio_status = not audio_status
  end

  button_led(pressed, 0, audio_status)
end

-- Command(⌘)+Shift+V: Start/stop video --
function toggle_video(pressed)
  press_shortcut("v", pressed)

  if pressed then
    video_status = not video_status
  end

  button_led(pressed, 1, video_status)
end

function volume_up(pressed)
    keybow.set_media_key(keybow.MEDIA_VOL_UP, pressed)
end

function volume_down(pressed)
    keybow.set_media_key(keybow.MEDIA_VOL_DOWN, pressed)
end

function set_modifiers_key_down()
  set_modifiers(keybow.KEY_DOWN)
end

function set_modifiers_key_up()
  set_modifiers(keybow.KEY_UP)
end

function set_modifiers(status)
  if system == "macOS" then
    keybow.set_modifier(keybow.RIGHT_META, status)
    keybow.set_modifier(keybow.RIGHT_SHIFT, status)
  else
    keybow.set_modifier(keybow.RIGHT_CTRL, status)
  end
end

function button_led(pressed, led, status)
  if pressed then
    keybow.set_pixel(led, 0, 0, 255)
  elseif not pressed and status then
    keybow.set_pixel(led, 0, 255, 0)
  elseif not pressed and not status then
    keybow.set_pixel(led, 255, 0, 0)
  end
end
