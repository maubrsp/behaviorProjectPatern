package org.br.behavior.events
{
	import flash.events.Event;
	
	/**
	 * The <code>EventAction</code> class is the base event to comunicate actions.
	 * @author mau
	 */
	public class EventAction extends Event
	{
		
		public static const EXECUTE_ACTION:String = "executeAction";
		
		public var name:String;
		public var scope:Object;
		public var versionsToHandle:String;
		public var commandTarget:Object;
		public var data:Object;
		public var sucess:Object;
		public var error:Object;
		
		/**
		 * Class Constructor.
		 * @param type <code>String</code>
		 * @param pActionName <code>String</code>
		 * @param pCommandTarget <code>Object</code>
		 * @param pCallerScope <code>Object</code>
		 * @param pData <code>Object</code>
		 * @param pSucess <code>Object</code>
		 * @param pError <code>Object</code>
		 * @param bubbles <code>Boolean</code>
		 * @param cancelable <code>Boolean</code>
		 */
		public function EventAction( type:String, 
									 actionName:String , 
									 pCommandTarget:Object, 
									 pVersionsToHandle:String = null,
									 recipientScope:Object = null ,
									 pData:Object = null ,
									 pSucess:Object = null ,
									 pError:Object = null ,
									 bubbles:Boolean=false ,
									 cancelable:Boolean=false )
		{
			name = actionName;
			commandTarget = pCommandTarget;
			versionsToHandle = pVersionsToHandle;
			scope = recipientScope;
			data = pData;
			sucess = pSucess;
			error = pError;
			super(type, bubbles, cancelable);
		}
		
		/**
		 * @inheritDoc 
		 */
		public override function clone():Event{
			return new EventAction(type, name , commandTarget , versionsToHandle , scope , data , sucess , error , bubbles , cancelable );
		}
		
		/**
		 * @inheritDoc 
		 */
		public override function toString():String{
			return formatToString("EventAction", "type", "name" , "commandTarget" , "versionsToHandle" , "scope" , "data" , "sucess", "error", "bubbles", "cancelable");
		}
		
	}
}