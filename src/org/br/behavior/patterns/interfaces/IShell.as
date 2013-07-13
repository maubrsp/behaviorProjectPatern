package org.br.behavior.patterns.interfaces
{
	import flash.display.DisplayObject;
	
	import org.br.behavior.events.EventAction;

	/**
	 * The <code>IShell</code> is a <code>interface</code> to define shell aspects
	 * @author mau 
	 */
	public interface IShell extends IDestroyable
	{
		
		/**
		 * GET/SET the <code>IModel</code> with model data.
		 * @return <code>IModel</code>  
		 */
		function get model():IModel;
		function set model(value:IModel):void;

		/**
		 * GET/SET the <code>DisplayObject</code> with view.
		 * @return <code>DisplayObject</code>  
		 */
		function get view():Object;
		function set view(value:Object):void;

		//TODO estabilizar patter de controle das views, integrar com base view controller
		/**
		 * Instantiate the view 
		 */
		function createView(pView:Object):void;
		
		/**
		 * GET/SET <code>IActionGroup</code> with shell's actions ( name - command).
		 * @return <code>IActionGroup</code>.		 
		 */
		function get actionGroup():IActionGroup;
		function set actionGroup(value:IActionGroup):void;
		
		/**
		 * The method executeAction executes the <code>ICommand</code> in his action <code>IAction</code>.
		 * @see ICommand
		 * @see IAction
		 * @return <code>Boolean</code> true if the action handled call <code>ICommand#execute()</code> else false.
		 * @param event <code>EventAction</event> with the event handled.
		 */
		function executeAction( event:EventAction ):Boolean; //name:String , scope:ICommandResult = null , data:Object = null , succes:Object = null , error:Object = null ):Boolean;
		/**
		 * Get true if the action exist in shell else false.
		 * @param name <code>Object</code> with the action (name, ?action - iaction - command)
		 * @return <code>Boolean</code>		 
		 */
		function hasAction( actionName:String ):Boolean;
		
	}
}