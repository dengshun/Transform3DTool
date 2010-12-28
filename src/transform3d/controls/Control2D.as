package transform3d.controls 
{
	import flash.display.Sprite;
	
	import transform3d.cursors.CustomMouseCursor;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author tamt
	 */
	public class Control2D extends Sprite
	{

		protected var _inited:Boolean = false;
		
		//-------------------------
		//--------constructor------
		//-------------------------
		public function Control2D() 
		{
			if (stage) onAdded();
			else addEventListener(Event.ADDED_TO_STAGE, onInterAdded);
			
			addEventListener(Event.REMOVED_FROM_STAGE, onInterRemoved);
		}
		
		//-------------------------
		//-----basic functions-----
		//-------------------------
		
		protected function onAdded(e:Event = null):void 
		{
		}
		
		private function onInterAdded(e:Event):void 
		{
			if (_inited) return;
			_inited = true;
			this.onAdded(e);
		}
		
		protected function onRemoved(e:Event = null):void {
		}
		
		private function onInterRemoved(e:Event):void {
			if (!_inited) return;
			_inited = false;
			this.onInterRemoved(e);
		}
		
		
		
		/**
		 * dispose this object completely
		 */
		public function dispose():void {
			onRemoved();
			this.removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
		}		
	}

}