package com.omicrone.display {
	import com.omicrone.Log;
	
	public class DisplayState {
		
		private var _id:uint;
		private var _name:String;
		private var _x:Number;
		private var _y:Number;
		private var _rotation:Number;
		private var _xscale:Number;
		private var _yscale:Number;
		private var _alpha:Number;
		private var _functionAtDone:Function;
		
		public function DisplayState(id:uint, stateName:String, x:Number, y:Number, rotation:Number, xscale:Number, yscale:Number, alpha:Number, fce:Function = null) {
			_id = id;
			_name = stateName;
			_x = x;
			_y = y;
			_alpha = alpha;
			_rotation = rotation;
			_xscale = xscale;
			_yscale = yscale;
			_alpha = alpha;
			_functionAtDone = fce;
			
			//Log.add ("nový stav " + _name + ": x=" + x + ", y=" + y + ", rotace=" + rotation + ", scaleX=" + xscale + ", scaleY=" + yscale + ", alpha=" + alpha, this);
		}
		
		public function get id ():uint {return _id;}
		public function get stateName ():String {return _name;}
		public function get x ():Number {return _x;}
		public function get y ():Number {return _y;}
		public function get rotation ():Number {return _rotation;}
		public function get xscale ():Number {return _xscale;}
		public function get yscale ():Number {return _yscale;}
		public function get alpha ():Number {return _alpha;}
		public function get functionAtDone ():Function {return _functionAtDone;}
		
		public function set x (num:Number):void {_x = num;}
		public function set y (num:Number):void {_y = num;}
		public function set rotation (num:Number):void {_rotation = num;}
		public function set xscale (num:Number):void {_xscale = num;}
		public function set yscale (num:Number):void {_yscale = num;}
		public function set alpha (num:Number):void {_alpha = num;}
		public function set functionAtDone (fce:Function):void {_functionAtDone = fce;}
	}
}