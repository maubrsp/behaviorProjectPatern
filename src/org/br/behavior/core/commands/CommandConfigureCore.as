package org.br.behavior.core.commands
{
	
	import org.br.behavior.commands.Command;
	import org.br.behavior.controllers.Broadcaster;
	import org.br.behavior.controllers.LogController;
	import org.br.behavior.core.Core;
	import org.br.behavior.events.EventAction;
	import org.br.log.LogThrowError;
	import org.br.log.LogTracer;

	/**
	 * The <code>CommandConfigureCore</code> class is a command specialized in core configuration.
	 * @author mau
	 */
	public class CommandConfigureCore extends Command
	{
		
		/**
		 * Class Constructor 
		 */
		public function CommandConfigureCore(){
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function execute(scope:Object):void{
			super.execute(scope);
			
			if(Core.getInstance().useLoggers){
				LogController.getInstance().addLog(new LogTracer() , Core.TRACER , Core.TRACE_MESSAGE );
				LogController.getInstance().addLog(new LogThrowError(), Core.THROW_ERROR , Core.THROW_ERROR_MESSAGE);
			}
			
			Broadcaster.getInstance().addEventListener( EventAction.EXECUTE_ACTION ,  Core.getInstance().actions_eventHandler );
			sucess(null);
		}
		
	}
}