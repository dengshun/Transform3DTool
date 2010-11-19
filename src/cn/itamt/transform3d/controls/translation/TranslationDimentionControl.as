package cn.itamt.transform3d.controls.translation 
{
	import cn.itamt.transform3d.controls.DimentionControl;
	import cn.itamt.transform3d.Util;
	import net.badimon.five3D.utils.InternalUtils;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author tamt
	 */
	public class TranslationDimentionControl extends DimentionControl
	{
		
		protected var _arrowSize:Number = 10;
		protected var _length:Number = 80;
		public function get length():Number {
			return _length;
		}
		
		public function get distance():Number {
			return _value;
		}
		
		protected var _globalStartDragPoint:Point;
		
		public function TranslationDimentionControl() 
		{
			super();
			
			_style.borderThickness = 2;
		}
		
		protected override function onStartDrag():void {
			super.onStartDrag();
			
			var root:Sprite = InternalUtils.getScene(this);
			_globalStartDragPoint = new Point(root.mouseX, root.mouseY);
		}
		
		override protected function onDraging():void {
			var root:Sprite = InternalUtils.getScene(this);
			_globalMousePoint = new Point(root.mouseX, root.mouseY);
			
			var pt:Point = _globalMousePoint.subtract(_globalStartDragPoint);
			var b:Number = Math.atan2(pt.y, pt.x);
			var a:Number = Util.projectRotationX(this.matrix) / Util.RADIAN;
			var a:Number = a - b;
			_value = Math.cos(a)*(Math.sqrt(pt.x * pt.x + pt.y * pt.y));
			
			//显示度数
			if (showValue) {
				if (!_textfield.visible)_textfield.visible = true;
				_textfield.text = Math.round(_value).toString();
				var pos:Point = Point.interpolate(_globalStartDragPoint, _mousePoint, .5);
				_textfield.x = pos.x - _textfield.width / 2;
				_textfield.y = pos.y - _textfield.height / 2;
			}
		}
		
	}

}