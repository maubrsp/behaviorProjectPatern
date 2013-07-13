package org.br.behavior.patterns.interfaces
{
	import org.br.behavior.events.EventAction;
	/**
	 * The <code>ICommandResult</code> interface define functinalities to receive command results
	 * @author mau
	 */
	public interface ICommandResult
	{
		
		/**
		 * Method to catch sucess from commands.
		 */
		function sucess(value:Object = null):void
		/**
		 * Method to catch error from commands.
		 */
		function error(value:Object = null):void
		
	}
}