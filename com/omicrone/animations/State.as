package com.omicrone.animations {
	
	import com.omicrone.Log;
	
	public class State {
		
		private var _name:*;
		
		private var _fDone:Function;
		private var _fAnimation:Function;
		private var _fStepper:Function;
		
		private var _x:Number;
		private var _y:Number;
		private var _rotation:Number;
		private var _alpha:Number;
		private var _scaleX:Number;
		private var _scaleY:Number;
		
		// CONSTRUCTOR
		
		public function State(name:*) {
			
			echo ("vytvořen stav animace " + name);
			
			_name = name;
			
			_fDone = null;
			_fAnimation = null;
			_fStepper = null;
			
		}
		
		// GETS
		
		public function get name():* {return _name}
		
		public function get done():Function {return _fDone}
		public function get animate():Function {return _fAnimation}
		public function get step():Function {return _fStepper}
		
		public function get x():Number {return _x}
		public function get y():Number {return _y}
		public function get rotation():Number {return _rotation}
		public function get alpha():Number {return _alpha}
		public function get scaleX():Number {return _scaleX}
		public function get scaleY():Number {return _scaleY}
		
		// SETS
		
		public function set done(i:Function):void {_fDone = i};
		public function set animate(i:Function):void {_fAnimation = i};
		public function set step(i:Function):void {_fStepper = i};
		
		public function set x(i:Number):void {_x = i};
		public function set y(i:Number):void {_y = i};
		public function set rotation(i:Number):void {_rotation = i};
		public function set alpha(i:Number):void {_alpha = i};
		public function set scaleX(i:Number):void {_scaleX = i};
		public function set scaleY(i:Number):void {_scaleY = i};
		
		// ECHO
		
		private function echo (s:String) {
			Log.add(s, "Animation-State");
		}
		
		public function toString():String {
			return "[Animation-State:" + name + "]";
		}
	}
}