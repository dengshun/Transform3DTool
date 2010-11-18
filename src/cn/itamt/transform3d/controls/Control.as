package cn.itamt.transform3d.controls 
{
	import cn.itamt.transform3d.cursors.CustomMouseCursor;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import net.badimon.five3D.display.Sprite3D;
	
	/**
	 * ...
	 * @author tamt
	 */
	public class Control extends Sprite3D
	{
		protected var _inited:Boolean = false;
		
		//-------------------------
		//--------constructor------
		//-------------------------
		public function Control() 
		{
			if (stage) onAdded();
			else addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
		}
		
		//-------------------------
		//-----basic functions-----
		//-------------------------
		
		protected function onAdded(e:Event = null):void 
		{
			_inited = true;
		}
		
		protected function onRemoved(e:Event = null):void {
			_inited = false;
		}
		
		/**
		 * 完全释放该对象
		 */
		public function dispose():void {
			onRemoved();
			this.removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
		}
	}

}