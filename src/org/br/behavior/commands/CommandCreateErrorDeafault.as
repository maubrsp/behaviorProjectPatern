package org.br.behavior.commands
{
	import flash.events.ErrorEvent;
	
	import org.br.behavior.controllers.LogController;
	import org.br.behavior.core.Core;
	import org.br.behavior.patterns.interfaces.ICommandResult;

	/**
	 * The <code>CommandCreateErrorDeafault</code> class define default functionalities when create version fails.
	 * @author mau
	 */
	public class CommandCreateErrorDeafault extends Command
	{
		
		/**
		 * Class Constructor.
		 */
		public function CommandCreateErrorDeafault()
		{
			super();
		}
		
		/**
		 * @inheirtDoc
		 */
		override public function execute(scope:Object):void{
			super.execute(scope);
			
			LogController.getInstance().log( LogController.LOG_ALL , 
											Core.THROW_ERROR_MESSAGE + "," + Core.TRACE_MESSAGE , 
											"Error Creating Version" );
			
			sucess();
			
		}
		
	}
}