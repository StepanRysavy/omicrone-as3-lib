package com.omicrone.physics {
	
	import com.omicrone.Log;
	
	public class Force {
		
		private var _spot:Boolean;
		private var _power:Number;
		
		private var _x:Number;
		private var _y:Number;
		
		public function Force(x:Number = 0, y:Number = 0, spot:Boolean = false, power:Number = 10, log:Boolean = true) {
			if (log) Log.add("init", this);
			
			_x = x;
			_y = y;
			_spot = spot;
			_power = power;
			
		}
		
		public function get x ():Number {
			return _x;
		}
		
		public function get y ():Number {
			return _y;
		}
		
		public function get spot ():Boolean {
			return _spot;
		}
		
		public function get power ():Number {
			return _power;
		}
		
		public function update (force:Force, wage:Number, mc:WorldObject) {
			var actualPower:Number = force.power*wage;
			var actualAngle:Number;
			if (force.spot) {
				
			} else {
				actualAngle = 90/180*Math.PI;
			}
			
		}
	}
}