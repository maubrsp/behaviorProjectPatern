package org.br.behavior.core.commands
{
	import org.br.behavior.commands.Command;
	import org.br.behavior.core.Core;
	
	/**
	 * The <code>CommandRemoveShell</code> 
	 * @author mau
	 */
	public class CommandRemoveShell extends Command
	{
		/**
		 * Class Constructor
		 */
		public function CommandRemoveShell()
		{
			super();
		}
		/**
		 * @inheritDoc
		 */
		override public function execute(scope:Object):void{
			super.execute(scope);
			Core.getInstance().removeShell( data.toString() );
			sucess();
		}
		
	}
}