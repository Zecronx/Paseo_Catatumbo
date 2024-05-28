# MIT License
#
# Copyright (c) 2023 Mark McKay
# https://github.com/blackears/cyclopsLevelBuilder
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

@tool
extends Resource
class_name ToolPrismSettings


@export var match_selected_block:bool = true
@export var default_block_elevation:float = 0
@export var default_block_height:float = 1
@export var collision_type:Collision.Type = Collision.Type.STATIC
@export_flags_3d_physics var collision_layer:int = 1
@export_flags_3d_physics var collision_mask:int = 1

func load_from_cache(cache:Dictionary):
	match_selected_block = cache.get("match_selected_block", true)
	default_block_elevation = cache.get("default_block_elevation", 0)
	default_block_height = cache.get("default_block_height", 1)
	collision_type = cache.get("collision_type", Collision.Type.STATIC)
	collision_layer = cache.get("collision_layer", 1)
	collision_mask = cache.get("collision_mask", 1)
	
func save_to_cache():
	return {
		"match_selected_block": match_selected_block,
		"default_block_elevation": default_block_elevation,
		"default_block_height": default_block_height,
		"collision_type": collision_type,
		"collision_layer": collision_layer,
		"collision_mask": collision_mask,
	}

