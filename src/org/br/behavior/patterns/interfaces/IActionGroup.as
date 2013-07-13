
package org.br.behavior.patterns.interfaces
{
	import flash.utils.Dictionary;
	
	import org.br.behavior.events.EventAction;

	/**
	 * The <coce>IActionGroup</code> interface define action group rules.
	 * @author mau
	 * 
	 */
	public interface IActionGroup extends IDestroyable
	{
		/**
		 * Get true if the action exist in shell else false.
		 * @param name <code>Object</code> with the action (name, ?action - iaction - command)
		 * @return <code>String</code>		 
		 */
		function hasAction(name:String):Boolean;
		
		/**
		 * This method add a action to shell's action controller
		 * @param action <code>String</code> class.
		 * @param name <code>String</code>
		 */
		function addAction(action:String , name:String):void;
		
		/**
		 * Remove a action from group - VALIDATE IMPLEMENTATION
		 * @param name
		 */
		function removeAction(name:String):void;
		
		/**
		 * This method executes the <code>ICommand</code> in his action <code>IAction</code>.
		 * @see ICommand
		 * @see IAction
		 * @return <code>Boolean</code> true if the action handled call <code>ICommand#execute()</code> else false.
		 * @param event <code>EventAction</event> with the event handled.
		 */
		function executeAction( event:EventAction ):Boolean;
		
		/**
		 * GET/SET the <code>String</code> with his <code>Shell</code> name.  
		 * @return 
		 */
		function get shellName():String;
		function set shellName(value:String):void;
		
		/**
		 * GET/SET all actions names.
		 * @return <code>String</code> with all action names delimeted by "," char.
		 */
		function get actionNames():String;
		function set actionNames(names:String):void;
		
		/**
		 * GET/SET the <code>Dictionary</code> with a <code>IAction</code> collection with shell's actions (name + command);  
		 * @return <code>Dictionary</code> with shell's actions.
		 */
		function get actionCommands():Dictionary;
		function set actionCommands(commands:Dictionary):void;
		
	}
}