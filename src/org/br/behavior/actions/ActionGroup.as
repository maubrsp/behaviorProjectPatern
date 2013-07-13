package org.br.behavior.actions
{
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	
	import org.br.behavior.events.EventAction;
	import org.br.behavior.patterns.interfaces.IActionGroup;
	import org.br.behavior.patterns.interfaces.ICommand;

	/**
	 * The <code>ActionGroup</code> class manage actions to shells.
	 * @author mau
	 */
	public class ActionGroup implements IActionGroup
	{
		
		
		
		/**
		 * Class Contructor for <code>BaseActionGroup</code>.
		 * 
		 * If any param  is null throw error.<p> Generate <code>Dictionary</code> content with names <code>String</code> splited with delimin "," indexed with <code>IAction</code> array</p>
		 *  
		 * @param commands <code>Array</code> with <code>IAction</code>
		 * @param names <code>String</code> with names delimeted by "," char.
		 */
		public function ActionGroup(commands:Array , names:String)
		{
			if( !commands || !names ) throw new Error("this class constuctor needs arrays params!");
			
			if(!actionCommands)actionCommands = new Dictionary(true);
			
			actionNames = names;
			
			var counter : uint = 0;
			for each (var o:String in commands) 
			{
				addAction(o ,  actionNames.split(",")[counter] )
				counter++;
			}
			
		}
		
		private var _shellName:String;
		/**
		 * @inheritDoc 
		 */
		public function get shellName():String
		{
			return _shellName;
		}
		
		public function set shellName(value:String):void
		{
			_shellName = value;
		}
		private var _actionCommands:Dictionary;
		/**
		 * @inheritDoc 
		 */
		public function get actionCommands():Dictionary
		{
			return _actionCommands;
		}
		public function set actionCommands(commands:Dictionary):void
		{
			_actionCommands = commands;
		}
		
		private var _actionNames:String;
		/**
		 * @inheritDoc
		 */
		public function get actionNames():String
		{
			return _actionNames;
		}
		
		public function set actionNames(names:String):void
		{
			_actionNames=names;
		}
		
		/**
		 * @inheritDoc
		 */
		public function addAction(action:String , name:String):void
		{
			actionCommands[name] = action;
		}
		
		/**
		 * @inheritDoc
		 */
		public function hasAction(name:String):Boolean
		{
			return actionCommands[name] != undefined ? true : false ;
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeAction(name:String):void
		{
			( actionCommands[name] as ICommand ).destroy();
			actionCommands[name] = null;
			delete actionCommands[name];
		}
		
		/**
		 * @inheritDoc
		 * */
		public function executeAction( event:EventAction):Boolean
		{
			if(!hasAction(event.name))return false;
			
			var command:ICommand = createCommand(actionCommands[event.name]); //(actionCommands[event.name] as ICommand)
			command.commandTarget = event.commandTarget;
			command.versionsToHandle = shellName;
			command.data = event.data;
			command.onError = event.error;
			command.onSucess = event.sucess;
			command.execute(event.scope);
			
			return true;
		}
		
		private function createCommand(arg:String):ICommand{
			var cls:Class = getDefinitionByName(arg) as Class;
			return new cls() as ICommand;
		}
		
		/**
		 *@inheritDoc
		 */
		public function destroy():void
		{
			for  (var key:String in actionCommands) 
			{
				removeAction( key );
			}
			actionCommands = null;
			actionNames = null;
			null;
		}
		
	}
}