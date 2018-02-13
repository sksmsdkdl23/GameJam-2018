gameval = 1;
num = irandom_range(1, 100);
if (num < 5 && instance_count < 80 && gameval == 1) {
    xp = irandom_range(5, 1915);
    yp = 0;
    abc = instance_create(xp, yp, obj_poop);
    speedran = irandom_range(15, 20);
    abc.speed = speedran;
    abc.direction = 270;
}

if (y >= 900) {
    instance_destroy();
    score++;
}

if (score == 500) {
    gameval = 0;
    instance_create(0, 0, obj_endgame);
}
