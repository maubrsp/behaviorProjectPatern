package org.br.behavior.commands
{
	
	import flash.profiler.showRedrawRegions;
	import flash.utils.getQualifiedClassName;
	
	import org.br.behavior.controllers.LogController;
	import org.br.behavior.core.Core;
	import org.br.behavior.patterns.interfaces.ICommand;
	import org.br.behavior.patterns.interfaces.ICommandResult;
	import org.br.behavior.patterns.interfaces.IShell;

	/**
	 * The <code>Command</code> class is the base for create commands.
	 * @author dna
	 */
	public class Command implements ICommandResult, ICommand
	{

		private var _versionsToHandle:String;
		
		public function get versionsToHandle():String
		{
			return _versionsToHandle;
		}
		
		public function set versionsToHandle(value:String):void
		{
			_versionsToHandle = value;
			
		}
		
		private var _commandTarget:Object;
		/**
		 * @inheritDoc
		 */
		public function get commandTarget():Object
		{
			return _commandTarget;
		}
		
		public function set commandTarget(scope:Object):void
		{
			_commandTarget = scope;
		}
		
		private var _autoDestroy:Boolean;
		/**
		 * @inheritDoc
		 */
		public function get autoDestroy():Boolean
		{
			return autoDestroy;
		}
		public function set autoDestroy(value:Boolean):void
		{
			autoDestroy = value;
		}
		
		private var _caller:Object;
		/**
		 * @inheritDoc
		 */
		public function get caller():Object
		{
			return _caller;
		}
		public function set caller(scope:Object):void
		{
			_caller = scope;
		}
		
		private var _data:Object;
		/**
		 * @inheritDoc
		 */
		public function get data():Object
		{
			return _data;
		}
		public function set data(value:Object):void
		{
			_data = value;
		}
		
		private var _onError:Object;
		/**
		 * @inheritDoc
		 */
		public function get onError():Object
		{
			return _onError;
		}
		public function set onError(value:Object):void
		{
			_onError = value;
		}
		
		private var _onSucess:Object;
		/**
		 * @inheritDoc
		 */
		public function get onSucess():Object
		{
			return _onSucess;
		}
		public function set onSucess(value:Object):void
		{
			_onSucess = value;
		}
		
		/**
		 * Class Constructor
		 */
		public function Command()
		{
		}
		
		/**
		 * GET this <code>IShell</code> owner.
		 * @return <code>IShell</code>
		 */
		public function get shell():IShell{
			return Core.getInstance().getShell(versionsToHandle);		
		}
		
		/**
		 * @inheritDoc
		 */
		public function execute(scope:Object):void
		{
			if(scope != null) caller = scope;
		}
		
		/**
		 * @inheritDoc
		 */
		public function sucess(value:Object = null):void{
			
			if(onSucess){
				if(onSucess is Function){
					if( (onSucess as Function).length == 0)onSucess();
					if( (onSucess as Function).length == 1)onSucess(data);
					if( (onSucess as Function).length == 2)onSucess(data , commandTarget);
					if( (onSucess as Function).length == 3)onSucess(data , commandTarget , caller);
				}else if(onSucess is ICommand){
					( onSucess as ICommand ).commandTarget = commandTarget;
					( onSucess as ICommand ).data = data;
					( onSucess as ICommand ).execute(caller);
				}else{
					LogController.getInstance().log(LogController.LOG_ALL , 
													Core.THROW_ERROR_MESSAGE +","+ Core.TRACE_MESSAGE ,
													"Command : " + this.toString() + " suceess can't invoque onSucess" )
				}
			}else if(caller && caller is ICommandResult){
				caller.sucess(data);
			}else{
					LogController.getInstance().log(LogController.LOG_ALL , 
													Core.THROW_ERROR_MESSAGE +","+ Core.TRACE_MESSAGE ,
													"Command : " + this.toString() + " suceess can't invoque onSucess and Caller" );
			}
			destroy();
		}
		
		/**
		 * @inheritDoc
		 */
		public function error(value:Object = null):void{
			caller.error(data);
			destroy();
		}
		
		/**
		 * @inheritDoc
		 */
		public function destroy():void{
			null;
		}
		
		/**
		 * @inheritDoc 
		 */
		public function toString():String
		{
			return "Command: " + getQualifiedClassName(this) + 
					"- data: " + String(data != null ? data.toString() : "null") +
					"- commandTarget: " + String( commandTarget != null ? commandTarget.toString() : "null" ) +
					"- caller: " + String( caller != null ? caller.toString() : "null" );
		}
		
		
	}
}