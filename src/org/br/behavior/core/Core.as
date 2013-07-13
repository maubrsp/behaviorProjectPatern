package org.br.behavior.core
{
	import flash.utils.Dictionary;
	
	import org.br.behavior.commands.CommandGroup;
	import org.br.behavior.commands.CommandSequence;
	import org.br.behavior.controllers.LogController;
	import org.br.behavior.core.commands.CommandConfigureCore;
	import org.br.behavior.events.EventAction;
	import org.br.behavior.patterns.interfaces.IActionGroup;
	import org.br.behavior.patterns.interfaces.ICommand;
	import org.br.behavior.patterns.interfaces.ICore;
	import org.br.behavior.patterns.interfaces.IModel;
	import org.br.behavior.patterns.interfaces.IShell;
	import org.br.behavior.patterns.interfaces.IVersion;
	
	/**
	 * The <code>Core</code> class is the Controller to receive ActionEvents and distribute to Shells
	 * @author mau
	 */
	public class Core extends Shell implements ICore
	{
		
		//loggers
		public static const TRACER:String = "tracer";
		public static const THROW_ERROR:String = "throwerror";
		
		//loggers usages
		public static const TRACE_MESSAGE:String = "tracemessage";
		public static const THROW_ERROR_MESSAGE:String = "throwerrormessage";
		
		public static const VIEW_CONTROLLER:String = "viewController";
		
		//actions
		public static const ADD_SHELL:String = "addShell";
		public static const REMOVE_SHELL:String = "removeShell";
		
		//shell collection
		private var shellDictionary:Dictionary = new Dictionary(true);

		private static var instance:Core;
		
		private var _useLoggers:Boolean;
		/**
		 * @inheritDoc 
		 */
		public function get useLoggers():Boolean
		{
			return _useLoggers;
		}
		public function set useLoggers(value:Boolean):void
		{
			_useLoggers = value;
		}
		/**
		 * Class Constructor
		 */
		public function Core(enforcer:SingletonEnforcer)
		{
			super( new CoreActions() , null );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function init(document:Object, id:String):void{
			
			var commandsCore:Vector.<ICommand> = new Vector.<ICommand>();
			commandsCore.push(new CommandConfigureCore());
			
			if(createCommand is CommandGroup){
				for each (var o:ICommand in (createCommand as CommandGroup).group)
				{
					commandsCore.push(o);
				}
			}else{
				commandsCore.push(createCommand);
			}
			
			var commandCreateCore:CommandSequence = new CommandSequence(commandsCore);
			createCommand = commandCreateCore;
			
			version = "behaviorCore";
			addShell(this);
			
			super.init(document , "behaviorCore");
		}
		
		/**
		 * GET the Singletone Core Instance
		 * @return <code>Core</code>
		 */
		public static function getInstance():Core{
			if(!instance){
				instance = new Core(new SingletonEnforcer());
			}
			return instance;
		}
	
		
		/**
		 * Add a shell in core controller 
		 * @param shell <code>IShell</code>
		 */
		public function addShell( shell:IShell ):Boolean{
			if( shellDictionary[(shell as IVersion).version] == undefined){
				shellDictionary[(shell as IVersion).version] = shell;
				return true;
			}else{
				return false;
			}
		}
		
		/**
		 * Remove a shell from core controller
		 * @param name <code>String</code>
		 */
		public function removeShell(name:String):Boolean{
			if( shellDictionary[name] != undefined){
				(shellDictionary[name] as IShell).destroy();
				shellDictionary[name] = null;
				delete shellDictionary[name];
				return true;
			}else{
				return false;
			}
		}
		
		public function getShell(name:String):IShell{
			return shellDictionary[name] != undefined ? shellDictionary[name] : null;
		}
		
		/**
		 * Handle actions events in core;
		 * @param event
		 */
		public function actions_eventHandler(event:EventAction):void{
			if(!executeAction(event)){
				if(useLoggers)LogController.getInstance().log( LogController.LOG_ALL , THROW_ERROR_MESSAGE , "the requested action does not exist :: "+event.name );
			}
		}
		
		/**
		 * @inheritDoc
		 */
		override public function hasAction( name:String ):Boolean{
			return getShelWithActionInGroupRequested( name , null ) != null;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function executeAction(event:EventAction):Boolean
		{
			var result:Boolean = true;
			var shellToExecute:Vector.<IShell>;
			var iShl:IShell;
			if(event.versionsToHandle == null){
				
				shellToExecute = getShelWithActionInGroupRequested( event.name , event.versionsToHandle );
				
				if(!shellToExecute || shellToExecute.length ==0){
					
					result =  false;
					
				}else{
					
					for each ( iShl in shellToExecute){
						if(iShl is Core){
							if(!iShl.actionGroup.executeAction(event))result = false;
						}else{
							if(!iShl.executeAction(event))result = false;
						}
					}
					
				}
				
			}else{
				
				for each (var key:String in shellDictionary){
					
					if( event.versionsToHandle.split(",").indexOf( (shellDictionary[key] as IVersion).version ) != -1){
						
						shellToExecute = getShelWithActionInGroupRequested( event.name , event.versionsToHandle );
						
						if(!shellToExecute || shellToExecute.length ==0){
							
							for each (iShl in shellToExecute){
								
								if(iShl is Core){
									if(!iShl.actionGroup.executeAction(event))result = false;
								}else{
									if(!iShl.executeAction(event))result = false;
								}
								
							}
							
						}
					}
				}
				
			}
			
			return result;
		}
		
		/**
		 * @private
		 */
		private function getShelWithActionInGroupRequested( actionName:String , groupRequested:String ):Vector.<IShell>{
			var result:Vector.<IShell>
			for(var shl:String in shellDictionary ){
				
				if( ( shellDictionary[shl] as IShell).actionGroup.hasAction(actionName) || 
									(shellDictionary[shl].hasOwnProperty("actionGroup") && 
								shellDictionary[shl].actionGroup.hasAction(actionName)  ) ){
					
					if(!result)result = new Vector.<IShell>();
					
					if( !groupRequested || groupRequested.split(",").indexOf((shellDictionary[shl] as IVersion).version) > -1){
						result.push(( shellDictionary[shl] as IShell) );
					}
					
						
				}
			}
			return result;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function destroy():void{
			super.destroy();
		}
		
	}
}
/**
 * Simple Class to enforcer the singletone.
 * @author mau
 */
class SingletonEnforcer { }