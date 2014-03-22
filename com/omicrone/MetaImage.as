package com.omicrone {
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.system.LoaderContext;
	
	public class MetaImage extends EventDispatcher {
		
		public static var eCREATED:String = "CREATED";
		public static var eLOADED:String = "LOADED";
		public static var eERROR:String = "ERROR";
		
		private var _image:ImageMeta;
		private var _id;
		private var _data:*;
		private var _context:LoaderContext;
		
		public function MetaImage(id, link:String, data:*, preload:Boolean = false, preloadTo:* = null, context:LoaderContext = null, target:IEventDispatcher=null) {
			super(target);
			
			_id = id;
			_data = data;
			_image = ImageStorage.create(link);
			_context = context;
			
			dispatchEvent (new Event (eCREATED));
			
			if (preload) {
				load(preloadTo);
			}
		}
		
		// gets
		
		public function get id ():* {
			return _id;
		}
		
		public function get data ():* {
			return _data;
		}
		
		public function get image ():Bitmap {
			if (!_image.loadDone) return null;
			return _image.image as Bitmap;
		}
		
		public function get meta ():ImageMeta {
			return _image;
		}
		
		public function get loader ():Loader {
			return _image.image;
		}
		
		// sets
		
		public function set data (newData:*):void {
			_data = newData;
		}
		
		// publics
		
		public function load (to:* = null, forceReload:Boolean = false):void {			
			if (to == null) {
				ImageStorage.load(_image, fLoaded, null, fError, null, null, _context, forceReload);
			} else {
				ImageStorage.load(_image, fLoaded, to, fError, null, null, _context, forceReload);
			}
			
		}
		
		public function loaded ():void {
			_image.loaded();
			fLoaded();
		}
		
		// privates
		
		private function fLoaded (e:Event = null):void {			
			dispatchEvent (new Event (eLOADED));
		}
		
		private function fError (e:Event):void {
			dispatchEvent (new Event (eERROR));
		}
	}
}