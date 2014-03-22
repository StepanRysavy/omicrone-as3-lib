package com.omicrone {
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.Event;
	
	public class Galleries extends EventDispatcher {
		
		private var _galleries:Array;
		
		public function Galleries(target:IEventDispatcher=null) {
			super(target);
			
			_galleries = new Array();
		}
		
		public function add (gallery:Gallery):void {
			_galleries.push(gallery);
			_galleries[_galleries.length - 1].addEventListener ("GALLERY_LOADING", galleryLoading);
		}
		
		private function galleryLoading (e:Event = null):void {
			for (var i:uint = 0; i < _galleries.length; i++) {
				var gallery:Gallery = _galleries[i];
				if (gallery == e.target) {
					// toto je aktualne nacitana galerie
				} else {
					gallery.stop();
				}
			}
		}
	}
}