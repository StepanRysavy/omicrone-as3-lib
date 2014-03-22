package com.omicrone.animations {
	import com.omicrone.Log;
	
	import flash.display.DisplayObject;

	public class Manager {
		
		private var _states:Array;
		private var _state:State;
		
		public function Manager(mc:DisplayObject) {
			echo ("manager animací pro objekt " + mc);
			
			// seznam stavů
			_states = new Array();	
			
			// vytvoření počátečních stavů
		}
		
		/** 
		 * Přidá nový stav do manageru
		 * Vrací true, pokud byl stav přidán
		 * Vrací false, pokud takový stav existuje
		 * 
		 * Overdrive přepíše existující stav 
		 */
		public function addState (state:State, overdrive:Boolean):Boolean {
			echo ("přidání stavu " + state);
			
			var s:State;
			
			// prochází všechny stavy
			for (var i:uint = 0; i < _states.length; i++) {
				s = _states[i];
				
				// pokud daný stav existuje
				if (s.name == state.name) {
					
					// pokud je povoleno přepisovat data
					if (overdrive) {
						_states[i] = state;
						echo ("stav " + state + " byl změněn");
						return true;
					} else {
						echo ("stav " + state + " již existuje");
						return false;
					}
				}
			}
			
			// založení nového stavu
			_states.push(state);
			echo ("stav " + state + " byl přidán");
			return true;
		}
		
		/**
		 * Změna aktuálního stavu na stav podle objektu
		 */
		public function changeStateByObject (state:State, speed:int = 1000):Boolean {
			echo ("změna aktuálního stavu " + _state + " na " + state);
			
			// kontrola existence stavu
			if (_states.indexOf(state) == -1) {
				echo ("stav " + state + " neexistuje");
				return false;
			}
			
			changeState (state, speed);
		}
		
		/**
		 *  Změna aktuálního stavu na stav podle jména
		 */
		public function changeStateByName (name:*, speed:int = 1000):Boolean {
			echo ("změna aktuálního stavu " + _state + " na " + name);
			
			// kontrola existence stavu
			var s:State = null;
			
			// prochází všechny stavy
			for (var i:uint = 0; i < _states.length; i++) {
				var st:State = _states[i];
				
				// pokud daný stav existuje
				if (st.name == name) s = st;
			}
			
			if (s == null) {
				echo ("požadovaný stav " + name + " neexistuje");
				return false;
			}
			
			changeState (s, speed);
		}
		
		// PRIVATNI FUNKCE
		
		private function changeState (state:State, speed:int):void {
			echo ("provádění změny z " + _state + " na " + state + " za " + speed + " milisekund");	
		}
		
		private var echo (s:String) {
			Log.add(s, "Animation - Manager");
		}
	}
}