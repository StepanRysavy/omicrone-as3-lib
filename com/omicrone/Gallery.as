package com.omicrone {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Gallery extends EventDispatcher {
		
		private var _images:Array;
		private var _loading:Boolean;
		private var _loadNext:Boolean;
		private var _currentImageLoaded:ImageMeta;
		
		public function Gallery(target:IEventDispatcher=null) {
			super(target);
			log ("init");
			_images = new Array();
			_loading = false;
			_loadNext = true;
			_currentImageLoaded = null;
		}
		
		/** gets */
		
		public function get loading ():Boolean {
			return _loading;
		}
		
		public function get imagesTotal ():uint {
			return _images.length;
		}
		
		public function get imagesLoaded ():uint {
			for (var i:uint = 0; i < _images.length; i++) {
				var im:ImageMeta = _images[i];
				if (!im.loadDone) return i;
			}
			return _images.length;
		}
		
		public function get imagesNotLoaded ():uint {
			return _images.length - imagesLoaded;
		}
		
		public function get currentBytesTotal ():Number {
			return _currentImageLoaded.loadTotal;
		}
		
		public function get currentBytesLoaded ():Number {
			return _currentImageLoaded.loadBytes;
		}
		
		public function get images ():Array {
			return _images;
		}
		
		public function set step (loadBySteps:Boolean):void {
			_loadNext = !loadBySteps;
		}
		
		/** publics */
		
		public function add (s:String, loadNow:Boolean = false):void {
			var im:ImageMeta = ImageStorage.create(s);
			_images.push(im);
			if (loadNow) if (!_loading) load();
		}
		
		public function load ():void {
			dispatchEvent (new Event ("GALLERY_LOADING"));
			_loadNext = true;
			loadDone();
		}
		
		public function stop ():void {
			log ("zastavuji načítání");
			_loadNext = false;
		}
		
		public function check ():void {
			if (imagesNotLoaded > 0) load ();
		}
		
		public function get (imageAtPosition:uint):ImageMeta {
			return _images[imageAtPosition];
		}
		
		/** privates */
		
		private function loadImage (im:ImageMeta):void {
			log ("načítám obrázek, celkem ještě k načtení: " + imagesNotLoaded + ", budu načítat všechny (" + _loadNext + ")");
			_currentImageLoaded = im;
			ImageStorage.load(im, loadDone);
		}
		
		private function loadDone (e:Event = null):void {
			dispatchEvent (new Event ("IMAGE_LOADED"));
			var im:ImageMeta = getFirstUnloaded();
			if (im == null || _loadNext == false) {
				_loading = false;
				dispatchEvent (new Event ("GALLERY_LOADED"));
				log ("žádný další obrázek k načtení");
			} else {
				loadImage(im);
			}
		}
		
		private function getFirstUnloaded():ImageMeta {
			for (var i:uint = 0; i < _images.length; i++) {
				var im:ImageMeta = _images[i];
				if (!im.loadDone) return im;
			}
			return null;
		}
		
		private function log (s:String):void {
			Log.add(s, this.toString())
		}
		
		override public function toString():String {
			return "Gallery";
		}
	}
}