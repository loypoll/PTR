if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy()
else
{
    var num = instance_place_list(x, y, 407, global.instancelist, 0)
    for (var i = 0; i < num; i++)
    {
        var b = ds_list_find_value(global.instancelist, i)
        with (b)
        {
            secretjumped = 0
            savedsecretinvincible = invincible
            state = (266 << 0)
        }
    }
    ds_list_clear(global.instancelist)
}
