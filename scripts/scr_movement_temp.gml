if (keyboard_check(vk_left)) {
    image_speed = 1;
    sprite_index = stickman;
    image_xscale = -3;
    x -= 15;
}

else if (keyboard_check(vk_right)) {
    image_speed = 1;
    sprite_index = stickman;
    image_xscale = 3;
    x += 15;
}

else {
    sprite_index = stickman_stay;
    image_speed = 0.1;
}

if (x <= 0 - sprite_width / 2 - 10) {
    x += 15;
}

if (x >= room_width - sprite_width / 2 + 10) {
    x -= 15;
}

if (keyboard_check(vk_left) || keyboard_check(vk_right) || keyboard_check(vk_up) ||
    keyboard_check(vk_down)) {
    switch(footstep_index) {
    case 0 :
        if (!audio_is_playing(stickstep_one)) {
            audio_play_sound(stickstep_one, 1, false);
            footstep_index++;
        }
        break;
    case 1 :
        if (!audio_is_playing(stickstep_one)) {
            if (!audio_is_playing(stickstep_two)) {
                audio_play_sound(stickstep_two, 1, false);
                footstep_index++;
            }
        }
    case 2 :
        if (!audio_is_playing(stickstep_two)) {
            if (!audio_is_playing(stickstep_three)) {
                audio_play_sound(stickstep_three, 1, false);
                footstep_index++;
            }
        }
        break;
    case 3 :
        if (!audio_is_playing(stickstep_three)) {
            if (!audio_is_playing(stickstep_four)) {
                audio_play_sound(stickstep_four, 1, false);
                footstep_index++;
            }
        }
        break;
    case 4 :
        if (!audio_is_playing(stickstep_four)) {
            if (!audio_is_playing(stickstep_five)) {
                audio_play_sound(stickstep_five, 1, false);
                footstep_index = 0;
            }
        }
        break;
    default:
        break;
    }
}



