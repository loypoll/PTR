if (state != (152 << 0))
    exit;
if (!instance_exists(obj_fadeout))
{
    scr_soundeffect(sfx_door)
    with (instance_create(x, y, obj_fadeout))
        roomreset = 1
}
