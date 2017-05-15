form_base =
   'size[8,8;]'..
   'bgcolor[#ffffff00;true]'..
   'button[0,0;2,1;status;Status]'..
   'button[2,0;2,1;log;Log]'..
   'button[4,0;2,1;map;Map]'..
   'button[6,0;2,1;home;Home]'

wall_computer_home =
   form_base..
   'background[0,0;8,8;spawn_comp_home.png;true]'..
   'label[4,4;This is the home screen.]'

wall_computer_log =
   form_base..
   'background[0,0;8,8;spawn_comp_log.png;true]'..
   'textarea[1,3.5;7,2;;You do not have sufficent privileges on this ship to view this inforamtion. This has been logged and reported to the authorities.;]'..
   'textarea[1,5;7,2;;If you feel this is an error please speak to the Captian or First mate.;]'

wall_computer_map =
   form_base..
   'background[0,0;8,8;spawn_comp_map.png;true]'..
   'label[0,2.5;Level 1]'..
   'label[0,5.2;Level 2]'..
   'label[0,7.75;Level 3]'

wall_computer_status =
   form_base..
   'background[0,0;8,8;spawn_comp_status.png;true]'..
   'label[4,4;This is the status screen.]'



minetest.register_node('spawn:wall_computer', {
   description = 'Spaceship computer',
   tiles = {'spawn_wall.png', 'spawn_wall.png', 'spawn_wall.png', 'spawn_wall.png', 'spawn_wall.png',{name = 'spawn_wall.png^spawn_wall_computer.png', tileable_vertical = false}},
   groups = {spawn=1},
   paramtype2 = 'facedir',
   on_construct = function(pos)
      local meta = minetest.get_meta(pos)
      meta:set_string('formspec', wall_computer_home)
   end,
   on_receive_fields = function(pos, formname, fields, sender)
      local meta = minetest.get_meta(pos)
      if fields['status'] then
         meta:set_string('formspec', wall_computer_status)
      elseif fields ['log'] then
         meta:set_string('formspec', wall_computer_log)
      elseif fields ['map'] then
         meta:set_string('formspec', wall_computer_map)
      elseif fields ['home'] then
         meta:set_string('formspec', wall_computer_home)
      end
   end,
})
