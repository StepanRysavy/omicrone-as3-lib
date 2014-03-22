package com.omicrone.physics {
	import com.omicrone.Log;
	
	import flash.display.DisplayObject;

	public class WorldObject {
		
		private var _mc:DisplayObject;
		private var _speed:Number;
		private var _angle:Number;
		
		public function WorldObject(mc:DisplayObject, speed:Number = 0, angle:Number = 0) {
			_mc = mc;
			_speed = speed;
			_angle = angle/180*Math.PI;
			
			Log.add ("init", this.toString());
		}
		
		// get set
		
		public function get object ():DisplayObject {
			return _mc;
		}
		
		// public functions
		
		public function update (force:Force):void {
			
			var nextY:Number = _speed * Math.sin(_angle) + force.y - _mc.y;
			var nextX:Number = _speed * Math.cos(_angle) + force.x - _mc.x;
			
			_speed = Math.sqrt(nextX*nextX + nextY*nextY);
			if (_speed != 0) {
				_angle = Math.asin(nextY / _speed);
			} else {
				_angle = 0;
			}
			
			
			_mc.x += nextX;
			_mc.y += nextY;
		}
		
		public function toString():String {
			return "[" + _mc.name + " :: WorldObject]";
		}
	}
}