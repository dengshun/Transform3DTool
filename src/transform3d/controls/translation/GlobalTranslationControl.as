package transform3d.controls.translation 
{
	import transform3d.controls.DimentionControl;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	/**
	 * global traslation control
	 * @author tamt
	 */
	public class GlobalTranslationControl extends DimentionControl
	{
		
		protected var _valueX:Number;
		public function get valueX():Number {
			return _valueX;
		}
		protected var _valueY:Number;
		public function get valueY():Number {
			return _valueY;
		}
		
		protected var _targetRect:Rectangle;
		public function set targetRect(val:Rectangle):void {
			_targetRect = val;
			
			if(_inited){
				clear();
				draw();
			}
		}
		
		public function GlobalTranslationControl ():void 
		{
			super();
			_style.borderColor = 0x0066ff;
			_style.fillAlpha = NaN;
		}
		
		protected override function onAdded(evt:Event = null):void {
			super.onAdded();
		}
		
		protected override function draw():void {
			super.draw();
			
			_sp.graphics3D.clear();
			if (_targetRect == null) return;
			_sp.graphics3D.lineStyle(_style.borderThickness, _style.borderColor, _style.borderAlpha);
			if(!isNaN(_style.fillAlpha))_sp.graphics3D.beginFill(_style.fillColor, _style.fillAlpha);
			_sp.graphics3D.drawRect(_targetRect.x, _targetRect.y, _targetRect.width, _targetRect.height);
			if(!isNaN(_style.fillAlpha))_sp.graphics3D.endFill();
		}
		
		protected override function onStartDrag():void {
			super.onStartDrag();
			
			this._startDragPoint = _globalMousePoint.clone();
		}
		
		protected override function onDraging():void {
			super.onDraging();
			
			_valueX = _globalMousePoint.x - this._startDragPoint.x;
			_valueY = _globalMousePoint.y - this._startDragPoint.y;
		}
		
		protected override function onStopDrag():void {
			super.onStopDrag();
			
			_valueX = _valueY = 0;
		}
	}

}
