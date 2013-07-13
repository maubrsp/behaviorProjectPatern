package org.br.behavior.core
{
	import flash.utils.getDefinitionByName;
	
	import org.br.behavior.events.EventAction;
	import org.br.behavior.patterns.interfaces.IActionGroup;
	import org.br.behavior.patterns.interfaces.IModel;
	import org.br.behavior.patterns.interfaces.IShell;
	
	/**
	 * The <code>Shell</code> class is the Controller style pattern for all beans, shells and any other micro / macro part for the system. 
	 * @author mau
	 */
	public class Shell extends Version implements IShell
	{
		
		private var _actionGroup:IActionGroup;
		/**
		 * @inheritDoc
		 */
		public function get actionGroup():IActionGroup
		{
			return _actionGroup;
		}
		public function set actionGroup(value:IActionGroup):void
		{
			_actionGroup = value;
		}
				
		private var _model:IModel
		/**
		 * @inheritDoc
		 */
		public function get model():IModel
		{
			return _model;
		}
		public function set model(value:IModel):void
		{
			_model = value;
		}
		
		private var _view:Object;
		/**
		 * @inheritDoc
		 */
		public function get view():Object
		{
			return _view;
		}
		
		public function set view(value:Object):void
		{
			_view = value;
		}
		
		/**
		 * Define if the view is intantied in this contution. 
		 */
		private var autoCreateView:Boolean;
		
		/**
		 * Constructor.
		 * @param actions <code>IActionGroup</code> pass shell's actions.
		 * @param data <code>IModel</code>
		 */
		public function Shell(actions:IActionGroup , data:IModel , pView:Object = null , pAutoCreateView:Boolean = false )
		{
			super();
			actionGroup = actions;
			model = data;
			
			if(pView){
				pAutoCreateView ? createView(pView) : view = pView;
			}
			
		}
		//TODO fish process
		/**
		 * @inheritDoc
		 */
		public function createView(pView:Object):void{
			
			if(pView is Class){
				view = new pView();
			}else if(pView is String){
				var viewClass:Class = getDefinitionByName(pView.toString()) as Class;
				view = new viewClass();
			}else{
				throw Error("invalid arguments or view status in createView : " + this.toString() );
			}
			
		}
		
		/**
		 * @inheritDoc
		 */
		public function executeAction(event:EventAction):Boolean
		{
			actionGroup.shellName = version;
			return actionGroup.executeAction( event );
		}
		
		/**
		 * @inheritDoc
		 */
		public function hasAction(actionName:String):Boolean
		{
			return actionGroup.actionNames.toLowerCase().search(actionName.toLowerCase()) >= 0;
		}
		
		/**
		 * @inheritDoc
		 */
		public function destroy():void
		{
			actionGroup.destroy();
			model.dispose();
			null;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function sucess(data:Object=null):void{
			super.sucess(data);
		}
		
	}
}