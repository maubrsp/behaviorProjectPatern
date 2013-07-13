package org.br.behavior.patterns.interfaces
{
	/**
	 * The Interface <code>ICommand</code> determine methods, getters and setters to commands pattern. 
	 * @author mau
	 */
	public interface ICommand extends IDestroyable
	{
		/**
		 * Get/Set <code>String</code> with the referenced <code>IShell</code> with this action.
		 * @return <code>String</code>
		 */
		function get versionsToHandle():String;
		function set versionsToHandle(value:String):void;
		
		/**
		 * Get/Set <code>Object</code> with the command caller.
		 * @return <code>Object</code>
		 */
		function get commandTarget():Object;
		function set commandTarget(scope:Object):void;
		
		/**
		 * Get/Set <code>Object</code> with the command caller.
		 * @return <code>Object</code>
		 */
		function get caller():Object;
		function set caller(scope:Object):void;
		
		/**
		 * Get/Set <code>Object</code> with the command caller.
		 * @return <code>Object</code>
		 */
		function get data():Object;
		function set data(value:Object):void;

		/**
		 * Get/Set <code>Object</code> with the command caller.
		 * @return <code>Object</code>
		 */
		function get onSucess():Object;
		function set onSucess(value:Object):void;
		
		/**
		 * Get/Set <code>Object</code> with the command caller.
		 * @return <code>Object</code>
		 */
		function get onError():Object;
		function set onError(value:Object):void;
		
		/**
		 * Method to execute the command.
		 * @param <code>ICommandResult</code> with scope who calls the command.
		 */
		function execute(scope:Object):void;
		
		/**
		 * Get/Set <code>Boolean</code> if true the class auto destroy on finish his process.
		 * @return <code>Boolean</code>
		 */
		function get autoDestroy():Boolean;
		function set autoDestroy(value:Boolean):void;
		
	}
}