//Get Input
//key_right = keyboard_check(vk_right) || keyboard_check("D");
//key_left = keyboard_check(vk_left) || keyboard_check("A");
//key_jump = keyboard_check_pressed(vk_up) || keyboard_check_pressed("W")  || keyboard_check_pressed(vk_space) ;
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_up);
key_shoot = keyboard_check_pressed(vk_space);

move = key_right + key_left;
h_speed = move * MoveSpeed;

if (v_speed < 10) v_speed += grav;

if (place_meeting(x,y+1, obj_wall)) 
{
    v_speed = key_jump * -jumpSpeed;    
}

//Horizontal Collision
if (place_meeting(x + h_speed, y, obj_wall))
{
    while (!place_meeting(x + sign(h_speed), y, obj_wall))
    {
        x+= sign(h_speed);
    }
    h_speed = 0;
}

//Vertical Collision
if (place_meeting(x, y + v_speed, obj_wall))
{
    while (!place_meeting(x, y + sign(v_speed) , obj_wall))
    {
        y+= sign(v_speed);
    }
    v_speed = 0;
}

x += h_speed;
y += v_speed;
if (-key_left) dir = -1;
if (key_right) dir = 1;

image_xscale = dir;


//Shooting
if (key_shoot && place_meeting(x, y, obj_pixel))
{
    instance_create(x + sprite_width, y, obj_bullet);
}


//restart
if (hp <= 0)
{
    x = xStart;
    y = yStart;
}
